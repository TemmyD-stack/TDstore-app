import 'package:flutter/material.dart';
import 'package:t_store/common/widgets/layouts/grid_layout.dart';
import 'package:t_store/common/widgets/products_cart_brands/brands/brand_showcase.dart';
import 'package:t_store/common/widgets/products_cart_brands/product_cards/product_card_vertical.dart';
import 'package:t_store/common/widgets/texts/section_heading.dart';
import 'package:t_store/features/shop/models/category_model.dart';
import 'package:t_store/utils/constants/image_strings.dart';
import 'package:t_store/utils/constants/sizes.dart';

class TCategoryWidget extends StatelessWidget {
  const TCategoryWidget({
    super.key, required this.category
  });
 final CategoryModel category;
  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              // Brands
              TBrandShowcase(images: [
              TImages.productImage3, TImages.productImage2, TImages.productImage1
            ],),
              TBrandShowcase(images: [
              TImages.productImage3, TImages.productImage2, TImages.productImage1
            ],),
      
            // Products
            TSectionHeader(title: "You might like", onPressed: () {},),
            const SizedBox(height: TSizes.spaceBtwItems,),
      
            TGridLayout(
              itemCount: 4, 
              itemBuilder: (_, index) => TProductCardVertical()
            ),
            const SizedBox(height: TSizes.spaceBtwItems,),

          ],
        ),
      ),]
    );
  }
}

