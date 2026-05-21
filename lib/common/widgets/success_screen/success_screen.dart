import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/common/styles/spacing_styles.dart';
import 'package:t_store/features/autentication/screens/login/login.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/constants/text_strings.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';

class SuccessScreen extends StatelessWidget {
  const SuccessScreen({super.key, this.image, this.title, this.subtitle, required this.onPressed});
  final image, title, subtitle;
  final VoidCallback onPressed; 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: TSpacingStyle.paddingWithAppBarHeight * 2, 
          child: Column(
            children: [
              // IMAGE
              Image(image: 
                AssetImage(image), 
                width: THelperFunctions.screenWidth() * 0.6,
              ),
              const SizedBox(height: TSizes.spaceBtwSections,),

              // Title and subtitle
              Text(title, style: Theme.of(context).textTheme.headlineMedium, textAlign: TextAlign.center,),
              const SizedBox(height: TSizes.spaceBtwItems,),
              Text(subtitle, style: Theme.of(context).textTheme.labelMedium, textAlign: TextAlign.center,),
               const SizedBox(height: TSizes.spaceBtwSections,),

              
               // button
              SizedBox(width: double.infinity, child: ElevatedButton(onPressed: ()=> Get.to(()=> LoginScreen()), child: const Text(TTexts.tContinue)),),
            ],
          ),
      ),
      ),
    );
  }
}