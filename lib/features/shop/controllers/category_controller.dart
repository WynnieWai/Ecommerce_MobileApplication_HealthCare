import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:testing_asg1/data/repositories/categories/category_repository.dart';
import 'package:testing_asg1/data/repositories/product/product_repository.dart';
import 'package:testing_asg1/features/shop/models/category_model.dart';
import 'package:testing_asg1/features/shop/models/product_model.dart';
import 'package:testing_asg1/features/shop/screens/sub_category/sub_categories.dart';
import 'package:testing_asg1/utils/exceptions/firebase_exceptions.dart';
import 'package:testing_asg1/utils/exceptions/platform_exceptions.dart';

import '../../../utils/popups/loaders.dart';

class CategoryController extends GetxController {
  static CategoryController get instance => Get.find();

  final isLoading = false.obs;
  final _categoryRepository = Get.put(CategoryRepository());
  RxList<CategoryModel> allCategories = <CategoryModel>[].obs;
  RxList<CategoryModel> featuredCategories = <CategoryModel>[].obs;

  @override
  void onInit() {
    fetchCategories();
    super.onInit();
  }

  /// -- Load category data
  Future<void> fetchCategories() async {
    try {
      // Show loader while loading categories
      isLoading.value = true;

      // Fetch categories from data source (Firestore, API, etc.)
      final categories = await _categoryRepository.getAllCategories();

      // Update the categories list
      allCategories.assignAll(categories);

      // Filter featured categories
      featuredCategories.assignAll(allCategories.where((category) => category.isFeatured && category.parentId.isEmpty).take(8).toList());

    } catch (e) {
      TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    } finally {
      // Remove loader
      isLoading.value = false;
    }
  }

  /// -- Load selected category data
  // Future<List<CategoryModel>> getSubCategories(String categoryId) async{
  //   try{
  //     final subCategories = await _categoryRepository.getSubCategories(categoryId);
      
  //     return subCategories;

  //   }catch(e){
  //     TLoaders.errorSnackBar(title: 'Oh Snap!',message: e.toString());
  //     return[];
  //   }
  // }
  
Future<List<CategoryModel>> getSubCategories(String categoryId) async {
  try {
    final subCategories = await _categoryRepository.getSubCategories(categoryId);
    print('Subcategories for $categoryId: ${subCategories.length}');
    return subCategories;
  } catch (e) {
    TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    return [];
  }
}

  /// Get Category or Sub-Category Products
  Future<List<ProductModel>> getCategoryProducts({required String categoryId, int limit = 4}) async {
      print('getCategoryProducts called for $categoryId');
    // Fetch products from the repository
    try{
      final products = await ProductRepository.instance.getProductsForCategory(categoryId: categoryId, limit: limit);
      print('Products for $categoryId: ${products.length}');
      return products;
    }catch(e){
      TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
      return[];
    }
  }
}