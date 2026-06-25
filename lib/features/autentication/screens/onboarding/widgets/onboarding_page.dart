import 'package:flutter/material.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';

class OnboardingPage extends StatelessWidget {
  final String image, title, subTitle;
  const OnboardingPage({
    super.key,
    required this.image,
    required this.title,
    required this.subTitle
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(TSizes.defaultSpace),
      child: Column(
        children: [
          Image(
            width: THelperFunctions.screenWidth(context) * 0.8,
            height: THelperFunctions.screenHeight() * 0.6,
            image: AssetImage(image)
          ),
          Text(title, style: Theme.of(context).textTheme.headlineMedium, textAlign: TextAlign.center,),
          SizedBox(height: TSizes.spaceBtwItems,),
          Text(subTitle, style: Theme.of(context).textTheme.bodyMedium, textAlign: TextAlign.center,),
      
        ],
      ),
    );
  }
}