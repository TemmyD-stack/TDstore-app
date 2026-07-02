import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/features/autentication/controllers.onboarding/forget_password/forget_password_controller.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/constants/text_strings.dart';
import 'package:t_store/utils/validators/validation.dart';

class ForgotPassword extends StatelessWidget {
  const ForgotPassword({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ForgetPasswordController());
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // heading
            Text(TTexts.forgetPasswordTitle, style: Theme.of(context).textTheme.headlineMedium, textAlign: TextAlign.center,),
                const SizedBox(height: TSizes.spaceBtwItems,),
              Text(TTexts.forgetPasswordSubTitle, style: Theme.of(context).textTheme.labelMedium, textAlign: TextAlign.center,),
                const SizedBox(height: TSizes.spaceBtwSections * 2,),

            // text field
            Form(
              key: controller.forgetPasswordFormKey,
              child: TextFormField(
                        controller: controller.email,
                        validator: TValidator.validateEmail,
                        decoration: const InputDecoration(
                labelText: TTexts.email, prefixIcon: Icon(Iconsax.direct_right)),
                      ),
            ),
                const SizedBox(height: TSizes.spaceBtwSections,),

            // submit btn
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => controller.sendPasswordResetEmail(),
               child: Text(TTexts.submit)),
            )
          ],
        ),
      ),
    );
  }

}