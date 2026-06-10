import 'package:flutter/material.dart';
import 'package:t_store/common/widgets/appbar/appbar.dart';
import 'package:t_store/common/widgets/products_cart_brands/brands/brands_card.dart';
import 'package:t_store/common/widgets/products_cart_brands/sorts/sortable.dart';
import 'package:t_store/utils/constants/sizes.dart';

class BrandProducts extends StatelessWidget {
  const BrandProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: TAppBar(title: Text('Nike'),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(padding: EdgeInsets.all(TSizes.defaultSpace),
        child: Column(
          children: [
            //brand detail
            TBrandCard(showBorder: true,),
            SizedBox(height: TSizes.spaceBtwSections,),
            TSortableProductsWidget(),
          ],
        ),
        ),
      ),
    );
  }
}