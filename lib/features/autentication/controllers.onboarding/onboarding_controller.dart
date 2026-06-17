import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:t_store/features/autentication/screens/login/login.dart';

class OnboardingController extends GetxController {
  static OnboardingController get instance => Get.find();

  // variable
  final pageController = PageController();
  final currentPageIndex = 0.obs;

  // Update Current index when page Scroll
  // ignore: strict_top_level_inference
  void updatePageIndicator(index) => currentPageIndex.value = index;

  // jump to the specific dot selected page
  // ignore: strict_top_level_inference
  void dotNavigationClick(index){
    currentPageIndex.value = index;
    pageController.jumpTo(index);
  }
  // update current index and jump to next page
  void nextPage(){
    if(currentPageIndex.value == 2){
      final storage = GetStorage();
      storage.write("isFirstTime", false); 
      Get.offAll(() => const LoginScreen());
    }else{
      int page = currentPageIndex.value + 1;
      pageController.jumpToPage(page);
    }
  }

   // update current index and jump to last page
  void skipPage(){
    currentPageIndex.value = 2;
    pageController.jumpToPage(2);
  }

}