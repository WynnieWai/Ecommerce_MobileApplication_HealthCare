import 'package:flutter/material.dart';
import 'package:testing_asg1/common/widgets/brands/brand_show_case.dart';
import 'package:testing_asg1/features/shop/controllers/brand_controller.dart';
import 'package:testing_asg1/features/shop/models/category_model.dart';
import 'package:testing_asg1/utils/constants/image_strings.dart';

class CategoryBrands extends StatelessWidget {
  const CategoryBrands({
    super.key, 
    required this.category,
  });

  final CategoryModel category;

  @override
  Widget build(BuildContext context) {
    final controller = BrandController.instance;
    return const TBrandShowcase(images: [TImages.productImage3, TImages.productImage3, TImages.productImage3]);
  }
}