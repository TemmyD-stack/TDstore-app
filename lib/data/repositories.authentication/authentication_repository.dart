import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:t_store/features/autentication/screens/login/login.dart';
import 'package:t_store/features/autentication/screens/onboarding/onboarding.dart';

class AuthenticationRepository extends GetxController{
  static AuthenticationRepository get instance => Get.find();

  // Variables
  final deviceStorage = GetStorage();


  // Called from main.dart on app launch
  @override
  void onReady(){
    super.onReady();

    WidgetsBinding.instance.addPostFrameCallback((_) {
     if (!kIsWeb) {
      FlutterNativeSplash.remove();
    }
      screenRedirect();
    });
  }

  // Function to show relevant screen
  void screenRedirect() async {
    // local storage
    deviceStorage.writeIfNull("isFirstTime", true);
    
    if (deviceStorage.read("isFirstTime") != true) {
      Get.offAll(() => const LoginScreen());
    } else {
      Get.offAll(() => const OnboardingScreen());
    }
  }
}