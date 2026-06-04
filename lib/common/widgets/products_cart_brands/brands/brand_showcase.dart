import 'package:flutter/material.dart';
import 'package:t_store/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:t_store/common/widgets/products_cart_brands/brands/brands_card.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';

class TBrandShowcase extends StatelessWidget {
  const TBrandShowcase({
    super.key,
    required this.images,
  });

  final List<String> images;
  @override
  Widget build(BuildContext context) {
    return TRoundedContainer(
      showBorder: true,
      borderColor: TColors.darkGrey,
      backGroundColor: Colors.transparent,
      margin: const EdgeInsets.only(bottom: TSizes.spaceBtwItems),
      padding: const EdgeInsets.all(TSizes.md),
      child: Column(children: [
        TBrandCard(showBorder: false,),
        const SizedBox(height: TSizes.spaceBtwItems,),
    
        // Top3 product Images
        Row(children: images.map((image) => brandTopProductImage(image, context)).toList()
         
        ,)
      ],),
    );
  }
}

Widget brandTopProductImage(String image, context){
  return Expanded(
    child: TRoundedContainer(
      height: 100,
      backGroundColor: THelperFunctions.isDarkMode(context) ? TColors.darkerGrey : TColors.light,
      margin: const EdgeInsets.only(right: TSizes.sm),
      padding: const EdgeInsets.all(TSizes.md),
      child: Image(fit: BoxFit.contain, image: AssetImage(image),),
    ),
  );
}