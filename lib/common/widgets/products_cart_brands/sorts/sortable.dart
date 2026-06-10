import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/common/widgets/layouts/grid_layout.dart';
import 'package:t_store/common/widgets/products_cart_brands/product_cards/product_card_vertical.dart';
import 'package:t_store/utils/constants/sizes.dart';

class TSortableProductsWidget extends StatelessWidget {
  const TSortableProductsWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      //  dropdowns
      DropdownButtonFormField(
        decoration:
            const InputDecoration(prefixIcon: Icon(Iconsax.sort)),
        onChanged: (value) {},
        items: ['Name', 'Higher Price', 'Lower Price', 'Sale', 'Newest', 'Popularity']
            .map((option) {
          return DropdownMenuItem(
            value: option,
            child: Text(option),
          );
        }).toList(),
      ),
    
      const SizedBox(
        height: TSizes.spaceBtwSections,
      ),
    
      //  Products
      TGridLayout(
        itemCount: 8, 
        itemBuilder: (_, index) => const TProductCardVertical()
      )
    ]);
  }
}
