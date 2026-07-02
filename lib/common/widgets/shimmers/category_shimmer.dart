import 'package:flutter/material.dart';
import 'package:t_store/common/widgets/shimmers/shimmer.dart';
import 'package:t_store/utils/constants/sizes.dart';

class TCategoryShimmer extends StatelessWidget {
   const TCategoryShimmer({super.key, this.itemCount = 8});

   final int itemCount;
 
   @override
   Widget build(BuildContext context) {
     return SizedBox(
       height: 80,
       child: ListView.separated(
         scrollDirection: Axis.horizontal,
         itemCount: itemCount,
         shrinkWrap: true,
        separatorBuilder: (_, __) => const SizedBox(width: TSizes.spaceBtwItems,),
         itemBuilder: (_, __) {
           return Column(
              children: [
                // image
                TShimmerEffect(width: 55, height: 55, radius: 55),
                SizedBox(height: TSizes.spaceBtwItems / 2,),

                // text
                TShimmerEffect(width: 55, height: 8),
              ]
           );
         },
       
       ),
     );
   }
 }