import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:testing_asg1/common/widgets/image_text_widgets/vertical_image_text.dart';
import 'package:testing_asg1/features/shop/controllers/category_controller.dart';
import 'package:testing_asg1/features/shop/screens/sub_category/sub_categories.dart';

import '../../../../../common/widgets/shimmers/category_shimmer.dart';

class THomeCategories extends StatelessWidget {
  const THomeCategories({
    super.key,
  });

  // // Define the list of categories and their respective images
  // final List<Map<String, dynamic>> categories = const [
  //   {"image": TImages.healthIcon, "title": "Health"},
  //   {"image": TImages.skinCareIcon, "title": "Skin Care"},
  //   {"image": TImages.personalCareIcon, "title": "Personal Care"},
  //   {"image": TImages.hairCareIcon, "title": "Hair Care"},
  //   {"image": TImages.babyCareIcon, "title": "Baby Care"},
  //   {"image": TImages.houseHoldIcon, "title": "Household"},
  // ];

  // @override
  // Widget build(BuildContext context) {
  //   return SizedBox(
  //     height: 80,
  //     child: ListView.builder(
  //       shrinkWrap: true,
  //       itemCount: categories.length,
  //       scrollDirection: Axis.horizontal,
  //       itemBuilder: (_, index) {
  //         final category = categories[index];
  //         return TVerticalImageText(
  //           image: category["image"],
  //           title: category["title"],
  //           onTap: () => Get.to(() => SubCategoriesScreen(categoryTitle: category["title"])),
  //         );
  //       },
  //     ),
  //   );
  // }


  @override
  Widget build(BuildContext context) {
    final categoryController = Get.put(CategoryController());


    return Obx(() {
        if(categoryController.isLoading.value) return const TCategoryShimmer();

        if(categoryController.featuredCategories.isEmpty) {
          return Center(child: Text('No Data Found!', style: Theme.of(context).textTheme.bodyMedium!.apply(color: Colors.white)));
        }

        return SizedBox(
          height: 80,
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: categoryController.featuredCategories.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (_, index) {
              final category = categoryController.featuredCategories[index];
              return TVerticalImageText(
                image: category.image,
                title: category.name,
                onTap: () => Get.to(() => SubCategoriesScreen(category: category))
              );
            },
          ),
        );
      }
    );
  }
}