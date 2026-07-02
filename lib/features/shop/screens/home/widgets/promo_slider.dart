
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/common/widgets/shimmers/shimmer.dart';
import 'package:t_store/common/widgets/custom_shapes/containers/circular_containers.dart';
import 'package:t_store/common/widgets/images/rounded_images.dart';
import 'package:t_store/features/shop/controllers/banner_controller.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/sizes.dart';

class TPromoSlider extends StatelessWidget {
  const TPromoSlider({
    super.key,
    required List<String> banners,
  });
  

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(BannerController());
    return Obx(() {
        if (controller.isLoading.value){
          return TShimmerEffect(width: double.infinity, height: 200);
        }
        if(controller.banners.isEmpty){
          return const SizedBox(
            height: 200,
            child: Center(
              child: Text('No Banners Found'),
            ),
          );
        }else{
          return Column(
        children: [
          CarouselSlider(
            items: controller.banners.map((banner) => TRoundedImage(
              imageUrl: banner.imageUrl,
              isNetworkImage: true,
              onPressed: () => Get.toNamed(banner.targetScreen),
            )).toList(),
            options: CarouselOptions(
              viewportFraction: 1,
              onPageChanged: (index, _) => controller.updatePageIndicator(index),
            )
          ),
          const SizedBox(height: TSizes.spaceBtwItems,),
          Center(
            child: Obx((){
              return Row(
                mainAxisAlignment: MainAxisAlignment.center,
              children: [
                for(int i = 0; i < controller.banners.length; i++)
                 TCircularContainer(
                  width: 20,
                  height: 4,
                  margin: EdgeInsets.only(right: 10),
                  backgroundColor: controller.carousalCurrentIndex.value == i ? TColors.primary : TColors.grey,
                )
              ],
                      );
            }),
          )
      
        ],
      );
        }
        
        }
    );
  }
}

