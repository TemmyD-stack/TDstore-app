import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';

class TSingleAddress extends StatelessWidget {
  const TSingleAddress({super.key, required this.selectedAddress});

  final bool selectedAddress;

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return TRoundedContainer(
      width: double.infinity,
      padding: const EdgeInsets.all(TSizes.md),
      showBorder: true,
      backGroundColor: selectedAddress
          ? TColors.primary.withAlpha(150)
          : Colors.transparent,
      borderColor: selectedAddress
          ? Colors.transparent
          : dark
              ? TColors.darkerGrey
              : TColors.grey,
        margin: 
        const EdgeInsets.only(bottom: TSizes.spaceBtwItems),
        child: Stack(
          children: [
            Positioned(
              right: 5,
              top: 0,
              child: Icon(selectedAddress ? Iconsax.tick_circle5 : null,
              color: selectedAddress ? dark ? TColors.light : TColors.dark.withOpacity(0.6) : null,
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                 Text(
                  'TemmyD-Stack', 
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.titleLarge
                  
                  ),
                  const SizedBox(height: TSizes.sm / 2,),
                   const Text(
                  '(+234) 706 172 0130', 
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  
                  ),
                  const SizedBox(height: TSizes.sm / 2,),

                const Text(
                  'Ibadan, Oyo State, Nigeria.', 
                  softWrap: true,
                  
                  ),
                  const SizedBox(height: TSizes.sm / 2,),

                 
              ],
            )
          ],
        ),
    );
  }
}