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
  // Future<List<ProductModel>> getCategoryProducts({required String categoryId, int limit = 4}) async {
  //     print('getCategoryProducts called for $categoryId');
  //   // Fetch products from the repository
  //   try{
  //     final products = await ProductRepository.instance.getProductsForCategory(categoryId: categoryId, limit: limit);
  //     print('Products for $categoryId: ${products.length}');
  //     return products;
  //   }catch(e){
  //     TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
  //     return[];
  //   }
  // }

//   Future<List<ProductModel>> getCategoryProducts({required String categoryId, int limit = 4}) async {
//   try {
//     // 1. Get all subcategories for this category
//     final subCategories = await getSubCategories(categoryId);
//     final subCategoryIds = subCategories.map((c) => c.id).toList();

//     // 2. Also include the main category id (optional, in case some products are directly under it)
//     subCategoryIds.add(categoryId);

//     // 3. Query products where CategoryId is in subCategoryIds
//     final snapshot = await FirebaseFirestore.instance
//         .collection('Products')
//         .where('CategoryId', whereIn: subCategoryIds)
//         .limit(limit)
//         .get();

//     final products = snapshot.docs.map((doc) => ProductModel.fromSnapshot(doc)).toList();
//     return products;
//   } catch (e) {
//     // handle error
//     return [];
//   }
// }

Future<List<ProductModel>> getCategoryProducts({required String categoryId, int limit = 4}) async {
  try {
    // 1. Get all subcategories for this category
    final subCategories = await getSubCategories(categoryId);
    final subCategoryIds = subCategories.map((c) => c.id).toList();

    // 2. Also include the main category id (optional, in case some products are directly under it)
    subCategoryIds.add(categoryId);

    // 3. Query products where CategoryId is in subCategoryIds
    var query = FirebaseFirestore.instance
        .collection('Products')
        .where('CategoryId', whereIn: subCategoryIds);

    // Only add limit if limit > 0
    if (limit > 0) {
      query = query.limit(limit);
    }

    final snapshot = await query.get();
    final products = snapshot.docs.map((doc) => ProductModel.fromSnapshot(doc)).toList();
    return products;
  } catch (e) {
    return [];
  }
}


}