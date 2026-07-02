import 'package:flutter/material.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';

class TVerticalImageText extends StatelessWidget {
  const TVerticalImageText({
    super.key,
    required this.image,
    required this.title,
    this.backgroundColor = TColors.white,
    this.textColor = TColors.white,
    this.onTap, required bool isNetworkImage,

  });

   final Color? backgroundColor;
  final Color textColor;
  final String image, title;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(right: TSizes.spaceBtwItems,),
        child: Column(
          children: [
            Container(
              width: 56,
              height: 56,
              padding: const EdgeInsets.all(TSizes.sm),
              decoration: BoxDecoration(
                color: dark ? TColors.black : backgroundColor,
                borderRadius: BorderRadius.circular(100)
              ),
              child: Center(
                child: Image(image: AssetImage(image), fit: BoxFit.cover, color: dark ? TColors.light : TColors.dark,),
              ),
            ),
            const SizedBox(height: TSizes.spaceBtwItems / 2,),
            SizedBox(width: 55, child: Text(title, style: Theme.of(context).textTheme.labelMedium!.apply(color: TColors.white), overflow: TextOverflow.ellipsis, maxLines: 1,)),
          ],
        ),
      ),
    );
  }
}

