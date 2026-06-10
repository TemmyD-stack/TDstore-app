import 'package:flutter/material.dart';
import 'package:t_store/common/widgets/texts/section_heading.dart';
import 'package:t_store/utils/constants/sizes.dart';

class TBillingAddressSection extends StatelessWidget {
  const TBillingAddressSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TSectionHeader(title: "Shipping Address", btnTitle: "Change", onPressed: (){},),
        Text("Temidayo Esther", style: Theme.of(context).textTheme.bodyLarge,),
        const SizedBox(height: TSizes.spaceBtwItems / 2,),

        Row(children: [
          const Icon(Icons.phone, color: Colors.grey, size: 16,),
          const SizedBox(height: TSizes.spaceBtwItems,),
          Text("+234 706 172 0130", style: Theme.of(context).textTheme.bodyMedium,),

        ],),
        const SizedBox(height: TSizes.spaceBtwItems / 2,),

        Row(children: [
          const Icon(Icons.location_history, color: Colors.grey, size: 16,),
          const SizedBox(height: TSizes.spaceBtwItems,),
          Expanded(child: Text("Arubiewe Olodo, Ibadan, Oyo, Nigeria", style: Theme.of(context).textTheme.bodyMedium,)),

        ],),
       
      ],
    );
  }
}