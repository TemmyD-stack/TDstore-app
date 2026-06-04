import 'package:flutter/material.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';

class TCircularIcon extends StatelessWidget {
  const TCircularIcon({
    super.key, 
    required this.icon,
    this.width,
    this.height,
    this.size = TSizes.lg,
    this.onPressed,
    this.color,
    this.backgroundColor
  });
  final IconData icon;
  final double? height, width, size;
  final Color? backgroundColor;
  final Color? color;
  final VoidCallback? onPressed;
 
  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);

    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
       color: backgroundColor ?? (dark ? TColors.black.withAlpha(90) : TColors.white.withAlpha(90)),
        borderRadius: BorderRadius.circular(100)
      ),
      child : IconButton( onPressed: onPressed, icon:  Icon(icon, size: size, color: color,))
    );
  }
}