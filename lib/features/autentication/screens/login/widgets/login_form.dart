import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/features/autentication/controllers.onboarding/login/login_controller.dart';
import 'package:t_store/features/autentication/screens/password_config/forgot_password.dart';
import 'package:t_store/features/autentication/screens/signup/signup.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/constants/text_strings.dart';
import 'package:t_store/utils/validators/validation.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());
    return Form(
      key: controller.loginFormKey,
        child: Padding(
      padding: const EdgeInsets.symmetric(vertical: TSizes.spaceBtwSections),
      child: Column(
        children: [
          // email
          TextFormField(
            controller: controller.email,
            validator: (value) => TValidator.validateEmail(value),
            decoration: InputDecoration(
                prefixIcon: Icon(Iconsax.direct_right),
                labelText: TTexts.email),
          ),
          const SizedBox(
            height: TSizes.spaceBtwInputFields,
          ),

          // password
          Obx(() => TextFormField(
          controller: controller.password,
          validator: (value) => TValidator.validatePassword(value),

          obscureText: controller.hidePassword.value,
          decoration:  InputDecoration(
              labelText: TTexts.password,
              prefixIcon: Icon(Iconsax.password_check),
              suffixIcon: IconButton(
                onPressed: ()=> controller.hidePassword.value = !controller.hidePassword.value,
                icon:controller.hidePassword.value ? Icon(Iconsax.eye_slash) : Icon(Iconsax.eye))
          ),
        ),),
          const SizedBox(
            height: TSizes.spaceBtwInputFields / 2,
          ),

          // Remember me and forgot password
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Remember me
              Row(
                children: [
                  Obx(() => Checkbox(value: controller.rememberMe.value, onChanged: (value) => controller.rememberMe.value = !controller.rememberMe.value)),
                  Text(TTexts.rememberMe),
                ],
              ),

              // Forgot password
              TextButton(onPressed: () => Get.to(()=> const ForgotPassword()), child: Text(TTexts.forgetPassword)),
            ],
          ),
          const SizedBox(
            height: TSizes.spaceBtwSections,
          ),

          // Sign in BTN
          SizedBox(
              width: double.infinity,
              child:
                  ElevatedButton(onPressed: () => controller.emailAndPasswordSignIn(), child: Text(TTexts.signIn))),

          const SizedBox(
            height: TSizes.spaceBtwSections,
          ),
          // Create ACCOUNT btn
          SizedBox(
              width: double.infinity,
              child: OutlinedButton(
                  onPressed: () => Get.to(() => const SignupScreen()), child: Text(TTexts.createAccount))),
        ],
      ),
    ));
  }
}
