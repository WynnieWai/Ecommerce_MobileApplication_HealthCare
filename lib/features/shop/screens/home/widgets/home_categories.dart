import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:testing_asg1/common/widgets/image_text_widgets/vertical_image_text.dart';
import 'package:testing_asg1/features/shop/screens/sub_category/sub_categories.dart';
import 'package:testing_asg1/utils/constants/image_strings.dart';

class THomeCategories extends StatelessWidget {
  const THomeCategories({
    super.key,
  });

  // Define the list of categories and their respective images
  final List<Map<String, dynamic>> categories = const [
    {"image": TImages.healthIcon, "title": "Health"},
    {"image": TImages.skinCareIcon, "title": "Skin Care"},
    {"image": TImages.personalCareIcon, "title": "Personal Care"},
    {"image": TImages.hairCareIcon, "title": "Hair Care"},
    {"image": TImages.babyCareIcon, "title": "Bay Care"},
    {"image": TImages.houseHoldIcon, "title": "House Hold"},
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: categories.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (_, index) {
          final category = categories[index];
          return TVerticalImageText(
            image: category["image"],
            title: category["title"],
            onTap: () => Get.to(() => const SubCategoriesScreen()),
          );
        },
      ),
    );
  }
}