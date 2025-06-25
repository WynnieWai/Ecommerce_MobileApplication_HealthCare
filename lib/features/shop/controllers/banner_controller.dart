
// import 'package:get/get.dart';
// import 'package:testing_asg1/data/repositories/banners/banner_repository.dart';
// import 'package:testing_asg1/features/shop/models/banner_model.dart';
// import 'package:testing_asg1/utils/popups/loaders.dart';

// class BannerController extends GetxController {
//   /// Variables
//   final isLoading = false.obs;
//   final carousalCurrentIndex = 0.obs;
//   final RxList<BannerModel> banners = <BannerModel>[].obs; 

//   @override
//   void onInit(){
//     fetchBanners();
//     super.onInit();
//   }

//   /// Update Page Navigational Dots
//   void updatePageIndicator(index) {
//     carousalCurrentIndex.value = index;
//   }

//   /// Fetch Banners
//   Future<void> fetchBanners() async {
//     try {
//       // Show loader while loading categories
//       isLoading.value = true;

//       // Fetch Banners
//       final bannerRepo = Get.put(BannerRepository());
//       final banners = await bannerRepo.fetchBanners();

//       //Assign Banners
//       this.banners.assignAll(banners);

//     } catch (e) {
//       TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
//     } finally {
//       // Remove Loader
//       isLoading.value = false;
//     }
//   }
// }

// 2nd version
// import 'package:carousel_slider/carousel_slider.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:testing_asg1/data/repositories/banners/banner_repository.dart';
// import 'package:testing_asg1/features/shop/models/banner_model.dart';
// import 'package:testing_asg1/utils/popups/loaders.dart';

// class BannerController extends GetxController {
//   // State variables
//   final isLoading = false.obs;
//   final carousalCurrentIndex = 0.obs;
//   final RxList<BannerModel> banners = <BannerModel>[].obs;
//   final CarouselSliderController carouselController = CarouselSliderController();

//   @override
//   void onInit() {
//     fetchBanners();
//     super.onInit();
//   }

//   // Update page indicator dots
//   void updatePageIndicator(int index) {
//     carousalCurrentIndex.value = index;
//   }

//   // Fetch banners from repository
//   Future<void> fetchBanners() async {
//     try {
//       isLoading.value = true;
//       final bannerRepo = Get.put(BannerRepository());
//       final banners = await bannerRepo.fetchBanners();
//       this.banners.assignAll(banners);
//     } catch (e) {
//       TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
//     } finally {
//       isLoading.value = false;
//     }
//   }

//   // Navigate to next banner
//   void goToNextBanner() {
//     if (banners.isEmpty) return;
//     carouselController.nextPage(
//       duration: const Duration(milliseconds: 300),
//       curve: Curves.easeIn,
//     );
//   }
// }

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:testing_asg1/data/repositories/banners/banner_repository.dart';
import 'package:testing_asg1/features/shop/models/banner_model.dart';
import 'package:testing_asg1/utils/popups/loaders.dart';
import 'package:video_player/video_player.dart';

class BannerController extends GetxController {
  // State variables
  final isLoading = false.obs;
  final carousalCurrentIndex = 0.obs;
  final RxList<BannerModel> banners = <BannerModel>[].obs;
  final CarouselSliderController carouselController = CarouselSliderController();
  
  // Video control variables
  final isVideoPlaying = false.obs;
  final currentVideoDuration = 0.obs;

  @override
  void onInit() {
    fetchBanners();
    super.onInit();
  }

  void updatePageIndicator(int index) {
    carousalCurrentIndex.value = index;
  }

  Future<void> fetchBanners() async {
    try {
      isLoading.value = true;
      final bannerRepo = Get.put(BannerRepository());
      final banners = await bannerRepo.fetchBanners();
      this.banners.assignAll(banners);
    } catch (e) {
      TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  void goToNextBanner() {
    if (banners.isEmpty) return;
    if (!isVideoPlaying.value) {
      carouselController.nextPage(
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeIn,
      );
    }
  }

  void setVideoPlaying(bool playing, {int? duration}) {
    isVideoPlaying.value = playing;
    if (duration != null) {
      currentVideoDuration.value = duration;
    }
  }
}