import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:readmore/readmore.dart';
import 'package:t_store/common/widgets/texts/section_heading.dart';
import 'package:t_store/features/shop/screens/product_details/widgets/bottom_add_to_cart_widget.dart';
import 'package:t_store/features/shop/screens/product_details/widgets/product_attributes.dart';
import 'package:t_store/features/shop/screens/product_details/widgets/product_detail_image_slider.dart';
import 'package:t_store/features/shop/screens/product_details/widgets/product_meta_data.dart';
import 'package:t_store/features/shop/screens/product_details/widgets/rating_share_widget.dart';
import 'package:t_store/features/shop/screens/product_reviews/product_review.dart';
import 'package:t_store/utils/constants/sizes.dart';

class TProductDetailScreen extends StatelessWidget {
  const TProductDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const TBottomAddToCart(),
      body: SingleChildScrollView(
        child: Column(
         children: [
          // 1- Product Image Slider
           TProductImageSlider(),

          // 2- Product Details
          Padding(
            padding: EdgeInsets.only(right: TSizes.defaultSpace, left: TSizes.defaultSpace, bottom: TSizes.defaultSpace),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // ratings and share
                TRatingsAndShare(),

                // price, title, stock and brand
                TProductMetaData(),

                // atributes
                TProductAttributes(),
                const SizedBox(height: TSizes.spaceBtwSections,),


                // checkout btn
                SizedBox( width: double.infinity, child: ElevatedButton(onPressed: (){}, child: Text('Checkout'))),
                const SizedBox(height: TSizes.spaceBtwSections,),

                // Description
                const TSectionHeader(title: 'Description', showActionButton: false,),
                const SizedBox(height: TSizes.spaceBtwItems,),
                const ReadMoreText(
                    'This is a product description for blue nike sleeve less vest. There are more things that can be added but i am not in the mood to add them',
                    trimLines: 2,
                    trimMode: TrimMode.Line,
                    trimCollapsedText: ' Show more',
                    trimExpandedText: ' Less',
                    moreStyle:
                        TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
                    lessStyle:
                        TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
                ),
                const Divider(),
                const SizedBox(height: TSizes.spaceBtwItems,),

                // Reviews
                const SizedBox(height: TSizes.spaceBtwSections,),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const TSectionHeader(title: 'Reviews (199)',  showActionButton: false,),
                      IconButton(icon: const Icon(Iconsax.arrow_right_3, size: 18,), onPressed: ()=> Get.to(()=> const ProductReviewsScreen())),
                    ],
                  ),
                  const SizedBox(height: TSizes.spaceBtwSections,)
                ],
              
            ),
          )
         ],
        ),
      ),
    );
  }
}

