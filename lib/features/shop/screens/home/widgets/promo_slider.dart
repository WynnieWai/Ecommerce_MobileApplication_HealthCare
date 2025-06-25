// import 'package:carousel_slider/carousel_slider.dart';
// import 'package:carousel_slider/carousel_controller.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:testing_asg1/common/widgets/shimmers/shimmer.dart';
// import 'package:testing_asg1/features/shop/controllers/banner_controller.dart';
// import 'package:testing_asg1/features/shop/screens/home/widgets/video_banner_item.dart';
// import '../../../../../common/widgets/custom_shapes/containers/circular_container.dart';
// import '../../../../../common/widgets/images/t_rounded_image.dart';
// import '../../../../../utils/constants/colors.dart';
// import '../../../../../utils/constants/sizes.dart';

// // class TPromoSlider extends StatelessWidget {
// //   const TPromoSlider({
// //     super.key,
// //   });

// //   // final List<String> banners;

// //   @override
// //   Widget build(BuildContext context) {
// //     final controller = Get.put(BannerController());
// //     return Obx(
// //       (){
// //         // Loader
// //       if (controller.isLoading.value) {
// //         return const TShimmerEffect(width: double.infinity, height: 190);
// //       }

// //       // No data found
// //       if (controller.banners.isEmpty) {
// //         return const Center(child: Text('No Data Found'));
// //       } else {
// //         return  Column(
// //           children: [
// //             CarouselSlider(
// //               options: CarouselOptions(
// //                 autoPlay: true,
// //                 autoPlayInterval: const Duration(seconds: 3),
// //                 autoPlayAnimationDuration: const Duration(milliseconds: 500),
// //                 autoPlayCurve: Curves.easeInOut,
// //                 pauseAutoPlayOnTouch: true,
// //                 enlargeCenterPage: true,
// //                 viewportFraction: 1,
// //                 onPageChanged: (index, _) => controller.updatePageIndicator(index)
// //               ),
// //               items: controller.banners
// //                     .map(
// //                       (banner) => TRoundedImage(
// //                         imageUrl: banner.imageUrl, 
// //                         isNetworkImage: true,
// //                         onPressed:()=>Get.toNamed(banner.targetScreen),
// //                         ),
// //                       )
// //                     .toList()
// //             ),
// //             const SizedBox(height: TSizes.spaceBtwItems),
// //             Center(
// //               child: Obx(
// //                 () => Row(
// //                   mainAxisSize: MainAxisSize.min,
// //                   children: [
// //                     for(int i = 0; i < controller.banners.length; i++) 
// //                       TCircularContainer(
// //                         width: 20, 
// //                         height: 4, 
// //                         margin: const EdgeInsets.only(right: 10), 
// //                         backgroundColor: controller.carousalCurrentIndex.value == i ? TColors.primary : TColors.grey
// //                       ),
// //                   ],
// //                 ),
// //               ),
// //             ),
// //           ],
// //         );
          
// //         }

// //       }

// //     );
// //   }
// // }

// // 2nd Version
// import 'package:carousel_slider/carousel_slider.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:testing_asg1/common/widgets/shimmers/shimmer.dart';
// import 'package:testing_asg1/features/shop/controllers/banner_controller.dart';
// import 'package:testing_asg1/features/shop/screens/home/widgets/video_banner_item.dart';
// import '../../../../../common/widgets/custom_shapes/containers/circular_container.dart';
// import '../../../../../common/widgets/images/t_rounded_image.dart';
// import '../../../../../utils/constants/colors.dart';
// import '../../../../../utils/constants/sizes.dart';

// class TPromoSlider extends StatelessWidget {
//   const TPromoSlider({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final controller = Get.put(BannerController());
    
//     return Obx(() {
//       if (controller.isLoading.value) {
//         return const TShimmerEffect(width: double.infinity, height: 190);
//       }
      
//       if (controller.banners.isEmpty) {
//         return const Center(child: Text('No Data Found'));
//       }

//       return Column(
//         children: [
//           CarouselSlider(
//             carouselController: controller.carouselController,
//             options: CarouselOptions(
//               autoPlay: true,
//               autoPlayInterval: const Duration(seconds: 5),
//               autoPlayAnimationDuration: const Duration(milliseconds: 800),
//               autoPlayCurve: Curves.fastOutSlowIn,
//               pauseAutoPlayOnTouch: true,
//               viewportFraction: 1,
//               onPageChanged: (index, _) => controller.updatePageIndicator(index),
//             ),
//             items: controller.banners.asMap().entries.map((entry) {
//               final index = entry.key;
//               final banner = entry.value;
              
//               return banner.type == 'video'
//                   ? VideoBannerItem(
//                       videoUrl: banner.videoUrl!,
//                       thumbnailUrl: banner.thumbnailUrl,
//                       autoPlay: controller.carousalCurrentIndex.value == index,
//                       onTap: controller.goToNextBanner,
//                     )
//                   : TRoundedImage(
//                       imageUrl: banner.imageUrl!,
//                       isNetworkImage: true,
//                       onPressed: banner.targetScreen != null
//                           ? () => Get.toNamed(banner.targetScreen!)
//                           : null,
//                     );
//             }).toList(),
//           ),
//           const SizedBox(height: TSizes.spaceBtwItems),
//           // Indicator dots
//           Obx(
//             () => Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: 
//                 List.generate(controller.banners.length, (index) => 
//                   TCircularContainer(
//                     width: 20,
//                     height: 4,
//                     margin: const EdgeInsets.only(right: 10),
//                     backgroundColor: controller.carousalCurrentIndex.value == index
//                         ? TColors.primary
//                         : TColors.grey,
//                   ),
//                 ),
//               ),
//             ),
//         ],
//       );
//     });
//   }
// }

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:testing_asg1/common/widgets/shimmers/shimmer.dart';
import 'package:testing_asg1/features/shop/controllers/banner_controller.dart';
import 'package:testing_asg1/features/shop/screens/home/widgets/video_banner_item.dart';
import '../../../../../common/widgets/custom_shapes/containers/circular_container.dart';
import '../../../../../common/widgets/images/t_rounded_image.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';

class TPromoSlider extends StatelessWidget {
  const TPromoSlider({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(BannerController());
    
    return Obx(() {
      if (controller.isLoading.value) {
        return const TShimmerEffect(width: double.infinity, height: 190);
      }
      
      if (controller.banners.isEmpty) {
        return const Center(child: Text('No Data Found'));
      }

      return Column(
        children: [
          CarouselSlider(
            carouselController: controller.carouselController,
            options: CarouselOptions(
              autoPlay: !controller.isVideoPlaying.value,
              autoPlayInterval: const Duration(seconds: 5),
              autoPlayAnimationDuration: const Duration(milliseconds: 800),
              autoPlayCurve: Curves.fastOutSlowIn,
              pauseAutoPlayOnTouch: true,
              viewportFraction: 1,
              onPageChanged: (index, _) {
                controller.updatePageIndicator(index);
                controller.setVideoPlaying(false);
              },
            ),
            items: controller.banners.asMap().entries.map((entry) {
              final index = entry.key;
              final banner = entry.value;
              
              return banner.type == 'video'
                  ? VideoBannerItem(
                      videoUrl: banner.videoUrl!,
                      thumbnailUrl: banner.thumbnailUrl,
                      autoPlay: controller.carousalCurrentIndex.value == index,
                      onTap: controller.goToNextBanner,
                    )
                  : TRoundedImage(
                      imageUrl: banner.imageUrl!,
                      isNetworkImage: true,
                      // onPressed: banner.targetScreen != null
                      //     ? () => Get.toNamed(banner.targetScreen!)
                      //     : null,
                    );
            }).toList(),
          ),
          const SizedBox(height: TSizes.spaceBtwItems),
          Obx(
            () => Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: 
                List.generate(controller.banners.length, (index) => 
                  TCircularContainer(
                    width: 20,
                    height: 4,
                    margin: const EdgeInsets.only(right: 10),
                    backgroundColor: controller.carousalCurrentIndex.value == index
                        ? TColors.primary
                        : TColors.grey,
                  ),
                ),
              ),
          ),
        ],
      );
    });
  }
}