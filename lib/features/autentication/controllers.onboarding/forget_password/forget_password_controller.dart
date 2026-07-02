import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/data/repositories.authentication/authentication_repository.dart';
import 'package:t_store/features/autentication/screens/password_config/reset_password.dart';
import 'package:t_store/utils/constants/image_strings.dart';
import 'package:t_store/utils/helpers/network_manager.dart';
import 'package:t_store/utils/popups/full_screen_loader.dart';
import 'package:t_store/utils/popups/loaders.dart';

class ForgetPasswordController extends GetxController{
  static ForgetPasswordController get instance => Get.find();
  
  // variables
  final email = TextEditingController();
  GlobalKey<FormState> forgetPasswordFormKey = GlobalKey<FormState>();

  // Send Reset password email
  Future<void> sendPasswordResetEmail() async {
    try{
      // Start loading
      TFullScreenLoader.openLoadingDialog('Pocessing your request...', TImages.docerAnimation);

      // internet connectivity check
      final isConnected = await NetworkManager.instance.isConnected();
      if(!isConnected){TFullScreenLoader.stopLoading(); return;}

      // form validation
      if(!forgetPasswordFormKey.currentState!.validate()){
        TFullScreenLoader.stopLoading();
        return;
      }

      // send mail to reset password
      await AuthenticationRepository.instance.sendPasswordResetEmail(email.text.trim());

      // Remove Loader
      TFullScreenLoader.stopLoading();

      // show success screen
      TLoaders.successSnackBar(title: 'Email Sent', message: 'Email Link Sent to Reset your Password'.tr);

      // Redirect
      Get.to(() => ResetPassword(email : email.text.trim()));
    } catch(e){
      // Remove Loader
      TFullScreenLoader.stopLoading();
       TLoaders.errorSnackBar(title: 'Email Sent', message: e.toString());
    }
  }

  Future<void> resendPasswordResetEmail(String email) async {
    try{
      // Start loading
      TFullScreenLoader.openLoadingDialog('Pocessing your request...', TImages.docerAnimation);

      // internet connectivity check
      final isConnected = await NetworkManager.instance.isConnected();
      if(!isConnected){TFullScreenLoader.stopLoading(); return;}

      // send mail to reset password
      await AuthenticationRepository.instance.sendPasswordResetEmail(email);

      // Remove Loader
      TFullScreenLoader.stopLoading();

      // show success screen
      TLoaders.successSnackBar(title: 'Email Sent', message: 'Email Link Sent to Reset your Password'.tr);

    } catch(e){
      // Remove Loader
      TFullScreenLoader.stopLoading();
       TLoaders.errorSnackBar(title: 'Email Sent', message: e.toString());
    }
  }
  
}