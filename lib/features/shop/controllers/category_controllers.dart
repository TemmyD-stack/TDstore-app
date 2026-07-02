import 'package:get/get.dart';
import 'package:t_store/data/repositories.authentication/categories/category_repository.dart';
import 'package:t_store/features/shop/models/category_model.dart';
import 'package:t_store/utils/popups/loaders.dart';

class CategoryControllers extends GetxController {
  static CategoryControllers get instance => Get.find();

  final _categoryRepository = Get.put(CategoryRepository());
  final isLoading = false.obs;
  RxList<CategoryModel> allCategory = <CategoryModel>[].obs;
  RxList<CategoryModel> featuredCategory = <CategoryModel>[].obs;
  

  @override
  void onInit() {
    super.onInit();
    fetchCategories();
  }

  //Load category data
  Future<void> fetchCategories() async {
    try {
      // show loader
      isLoading.value = true;

      // fetch categories from data source
      final categories = await _categoryRepository.getAllCategories();

      // update the ctegory list
      allCategory.assignAll(categories);

      // filter featured categories
      featuredCategory.assignAll(
          allCategory.where((category) => category.isFeatured).toList());
    } catch (e) {
      TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString(),);
    } finally {
      isLoading.value = false;
    }
  }
}