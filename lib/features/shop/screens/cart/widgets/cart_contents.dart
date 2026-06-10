import 'package:flutter/material.dart';
import 'package:t_store/common/widgets/products_cart_brands/cart/add_remove_btn.dart';
import 'package:t_store/common/widgets/products_cart_brands/cart/cart_item.dart';
import 'package:t_store/common/widgets/texts/product_price_text.dart';
import 'package:t_store/utils/constants/sizes.dart';

class TCartContents extends StatelessWidget {
  const TCartContents({
    super.key,
    this.showAddRemoveBtns = false,
  });

  final bool showAddRemoveBtns;
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 2,
      separatorBuilder: (_, __) {
        return SizedBox(height: TSizes.spaceBtwSections);
      },
      itemBuilder: (_, index) => Column(
        children: [
          // cart item
          TCartItem(),
          if(showAddRemoveBtns) const SizedBox(height: TSizes.spaceBtwItems,),

          // Add remove btn with total price row
          if(showAddRemoveBtns)
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  // Extra Space
                  SizedBox(width: 70,),
                  // Add Remove btn
                   TProductQuantityWithAddRemoveBtn(),
                ],
              ),
            
              TProductPriceText(priceText: "256"),
            ],
          )
        ],
      )
    );
  }
}

