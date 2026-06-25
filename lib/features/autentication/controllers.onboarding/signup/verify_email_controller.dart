import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/scheduler.dart';
import 'package:get/get.dart';
import 'package:t_store/common/widgets/success_screen/success_screen.dart';
import 'package:t_store/data/repositories.authentication/authentication_repository.dart';
import 'package:t_store/utils/popups/loaders.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/constants/text_strings.dart';

class VerifyEmailController extends GetxController {
  static VerifyEmailController get instance => Get.find();

  /// Send email whenever verify screen appears & set timer for auto redirect
  @override
  void onInit() {
    sendEmailVerification();
    setTimerForAutoRedirect();
    super.onInit();
  }


  /// Send email verification link
  Future<void> sendEmailVerification() async {
    try {
      await AuthenticationRepository.instance.sendEmailVerification();
      TLoaders.successSnackBar(title: 'Email Sent', message: 'Please check your inbox and verify your email');
    } catch (e) {
      TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }

  /// Timer to automatically redirect on email verification
  void setTimerForAutoRedirect() {
    Timer.periodic(const Duration(seconds: 1), (timer) async {
      // await reload() so Firebase actually fetches the latest email-verified flag
      await FirebaseAuth.instance.currentUser?.reload();
      final user = FirebaseAuth.instance.currentUser;
      if (user?.emailVerified ?? false) {
        timer.cancel();
        // Use addPostFrameCallback so navigation happens AFTER the current build frame,
        // preventing the "setState called during build" crash
        SchedulerBinding.instance.addPostFrameCallback((_) {
          Get.off(
            () => SuccessScreen(
              image: TImages.successfulRegisterationAnimation,
              title: TTexts.yourAccountCreatedTitle,
              subtitle: TTexts.yourAccountCreatedSubTitle,
              // FIX: wrap in () => so screenRedirect() is called when BUTTON is pressed,
              // not immediately during widget construction
              onPressed: () => AuthenticationRepository.instance.screenRedirect(),
            ),
          );
        });
      }
    });
  }


  /// Manually check if email is verified (Continue button)
  Future<void> checkEmailVerificationStatus() async {
    await FirebaseAuth.instance.currentUser?.reload();
    final currentUser = FirebaseAuth.instance.currentUser;
    if (currentUser != null && currentUser.emailVerified) {
      // FIX: same fix here — wrap in () => arrow function
      Get.off(
        () => SuccessScreen(
          image: TImages.successfulRegisterationAnimation,
          title: TTexts.yourAccountCreatedTitle,
          subtitle: TTexts.yourAccountCreatedSubTitle,
          onPressed: () => AuthenticationRepository.instance.screenRedirect(),
        ),
      );
    }
  }
}