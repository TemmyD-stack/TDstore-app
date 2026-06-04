import 'package:flutter/material.dart';
import 'package:t_store/common/widgets/custom_shapes/containers/primary_header_container.dart';
import 'package:t_store/common/widgets/custom_shapes/containers/search_container.dart';
import 'package:t_store/common/widgets/layouts/grid_layout.dart';
import 'package:t_store/common/widgets/products_cart_brands/product_cards/product_card_vertical.dart';
import 'package:t_store/common/widgets/texts/section_heading.dart';
import 'package:t_store/features/shop/screens/home/widgets/home_appbar.dart';
import 'package:t_store/features/shop/screens/home/widgets/home_categories.dart';
import 'package:t_store/features/shop/screens/home/widgets/promo_slider.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/image_strings.dart';
import 'package:t_store/utils/constants/sizes.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
         
          children: [
            TPrimaryHeaderContainer(
              child: Column(
               
                children: [
                  // AppBar
                  const THomeAppBar(),
                  const SizedBox(height: TSizes.spaceBtwSections,),

                  // SearchBar
                  const TSearchContainer(text: "Search in store"),
                  SizedBox(height: TSizes.spaceBtwSections,),

                  // Categories
                  Padding(
                    padding: EdgeInsets.only(left: TSizes.defaultSpace),
                    child: Column(
                      children: [

                        // heading
                        TSectionHeader(title: "Popular Categories", showActionButton: false, textColor: TColors.white,),
                        const SizedBox(height: TSizes.spaceBtwItems,),

                        // categories list
                        THomeCategories(),
                        const SizedBox(height: TSizes.spaceBtwSections,),
                      ],
                    ),
                  )
                ],
              ),
            ),

            /// Body
            Padding(
              padding: const EdgeInsets.all(TSizes.defaultSpace),
              child: Column(
                children: [
                  TPromoSlider(
                    banners: [
                     TImages.promoBanner1,TImages.promoBanner2,TImages.promoBanner3
                    ]
                  ),
                  SizedBox(height: TSizes.spaceBtwSections,),

                  // Header
                  TSectionHeader(title: "Popular Products", onPressed: (){},),
                  const SizedBox(height: TSizes.spaceBtwItems,),
                 

                  /// Popular products section
                  TGridLayout(itemCount: 2, itemBuilder: (_, index) => const TProductCardVertical(),),
                  
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

 
}
