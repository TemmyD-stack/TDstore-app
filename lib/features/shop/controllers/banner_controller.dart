import 'package:get/get.dart';
import 'package:t_store/data/repositories.authentication/banners/banner_repository.dart';
import 'package:t_store/features/shop/models/banner_models.dart';
import 'package:t_store/utils/popups/loaders.dart';

class BannerController extends GetxController {
  final isLoading = false.obs;
  final carousalCurrentIndex = 0.obs;
  final RxList<BannerModel> banners = <BannerModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchBanners();
  }

  void updatePageIndicator(index) {
    carousalCurrentIndex.value = index;
  }

  Future<void> fetchBanners() async {
    try {
      isLoading.value = true;
      final bannerRepo = Get.put(BannerRepository());
      final fetchedBanners = await bannerRepo.fetchBanners();
      banners.assignAll(fetchedBanners);
    } catch (e) {
      TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    } finally {
      isLoading.value = false;
    }
  }
}