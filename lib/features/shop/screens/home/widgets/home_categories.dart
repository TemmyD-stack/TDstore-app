import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/common/widgets/shimmers/category_shimmer.dart';
import 'package:t_store/common/widgets/image_text_widget/vertical_image.dart';
import 'package:t_store/features/shop/controllers/category_controllers.dart';
import 'package:t_store/features/shop/screens/sub_categories/sub_categories.dart';

class THomeCategories extends StatelessWidget {
  const THomeCategories({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final categoryController = Get.put(CategoryControllers());
    return Obx((){
      if(categoryController.isLoading.value) return const TCategoryShimmer();
      if(categoryController.featuredCategory.isEmpty) {
        return Center(child: Text('No Data Found', style:Theme.of(context).textTheme.bodyMedium!.apply(color:Colors.white)),);
      }
      return SizedBox(
        height: 80,
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: categoryController.featuredCategory.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (_, index){
            final category = categoryController.featuredCategory[index];
            return TVerticalImageText(
              isNetworkImage: true,
              image:category.image, 
              title: category.name, 
              onTap: ()=> Get.to(()=> const SubCategoriesScreen()), );
          }
        ),
      );
    } 
    );
  }
}

