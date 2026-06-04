import 'package:flutter/material.dart';
import 'package:t_store/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:t_store/common/widgets/images/circular_image.dart';
import 'package:t_store/common/widgets/texts/brand_text_verify_icon.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/enums.dart';
import 'package:t_store/utils/constants/image_strings.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';

class TBrandCard extends StatelessWidget {
  const TBrandCard({
    super.key,
    this.onTap,
    required this.showBorder
  });

  final bool showBorder;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
     onTap: onTap,
     child: TRoundedContainer(
       padding: EdgeInsets.all(TSizes.sm),
       showBorder: showBorder,
       backGroundColor: Colors.transparent,
       child: Row(
         children: [
           
           // Icon
           Flexible(
             child: TCircularImage(
               isNetworkImage: false, 
               image: TImages.clothIcon,
               backgroundColor: Colors.transparent,
               overlayColor: THelperFunctions.isDarkMode(context) ? TColors.white : TColors.black,
             ),
           ),
           const SizedBox(width: TSizes.spaceBtwItems / 2,),
     
           // text
           Expanded(
             child: Column(
               mainAxisSize: MainAxisSize.min,
               crossAxisAlignment: CrossAxisAlignment.start,
               children: [
                  TBrandTextVerifyIcon(titleText: 'Nike', brandTextSize: TextSizes.large,),
                  Text("256 products in stock right now", overflow: TextOverflow.ellipsis, style: Theme.of(context).textTheme.labelMedium,),
                  
               ],
             ),
           )
     
         ],
       ),
     ),
                          );
  }
}

