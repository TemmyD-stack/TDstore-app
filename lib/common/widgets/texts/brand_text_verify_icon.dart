import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/common/widgets/texts/brand_title_text.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/enums.dart';
import 'package:t_store/utils/constants/sizes.dart';

class TBrandTextVerifyIcon extends StatelessWidget {
  const TBrandTextVerifyIcon({
    super.key,
    this.textColor,
    this.maxLines = 1,
    this.iconColor = TColors.primary,
    required this.titleText,
    this.textAlign = TextAlign.center,
    this.brandTextSize = TextSizes.small, 
    
  });

  final String titleText;
  final int maxLines;
  final Color? textColor, iconColor;
  final TextAlign? textAlign;
  final TextSizes brandTextSize;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Flexible(
          child: TBrandTitleText(
            title: titleText, 
            maxLines: maxLines,
            textAlign: textAlign,
            brandTextSize: brandTextSize

          ),
        ),
        const SizedBox(
          width: TSizes.xs,
        ),
        const Icon(
          Iconsax.verify5,
          color: TColors.primary,
          size: TSizes.iconXs,
        ),
      ],
    );
  }
}


