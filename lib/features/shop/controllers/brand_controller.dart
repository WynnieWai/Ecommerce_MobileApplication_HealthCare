import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:testing_asg1/data/repositories/brands/brand_repository.dart';
import 'package:testing_asg1/data/repositories/product/product_repository.dart';
import 'package:testing_asg1/features/shop/controllers/category_controller.dart';
import 'package:testing_asg1/features/shop/models/brand_model.dart';
import 'package:testing_asg1/features/shop/models/product_model.dart';
import 'package:testing_asg1/utils/popups/loaders.dart';

class BrandController extends GetxController {
  static BrandController get instance => Get.find();

  RxBool isLoading = true.obs;
  final RxList<BrandModel> allBrands = <BrandModel>[].obs;
  final RxList<BrandModel> featuredBrands = <BrandModel>[].obs;
  final brandRepository = Get.put(BrandRepository());

  @override
  void onInit() {
    getFeaturedBrands();
    super.onInit();
  }

  /// -- Load Brands
  Future<void> getFeaturedBrands() async {
    try {
      // Show loader while loading Brands
      isLoading.value = true;

      final brands = await brandRepository.getALLBrands();

      allBrands.assignAll(brands);

      featuredBrands.assignAll(allBrands.where((brand) => brand.isFeatured ?? false).take(4));


    } catch (e) {
      TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    } finally {
      // Stop loader
      isLoading.value = false;
    }
  }

  // Get brand for category
  Future<List<BrandModel>> getBrandsForCategory(String categoryId) async {
    try {
      final brands = await brandRepository.getBrandsForCategory(categoryId);
      return brands;
    } catch (e) {
      TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
      return [];
    }
  }


//   Future<List<BrandModel>> getBrandsForCategory(String categoryId) async {
//   try {
//     // 1. Get all subcategories for this category
//     final subCategories = await CategoryController.instance.getSubCategories(categoryId);
//     final categoryIds = [categoryId, ...subCategories.map((c) => c.id)];

//     // 2. Get all products in these categories (limit to 10 for Firestore)
//     final productSnapshot = await FirebaseFirestore.instance
//         .collection('Products')
//         .where('CategoryId', whereIn: categoryIds.take(10).toList())
//         .get();

//     // 3. Get unique brand IDs from products
//     final brandIds = productSnapshot.docs
//         .map((doc) => doc['Brand']['Id'] as String)
//         .toSet()
//         .toList();

//     if (brandIds.isEmpty) return [];

//     // 4. Fetch brands by IDs
//     final brandSnapshot = await FirebaseFirestore.instance
//         .collection('Brands')
//         .where('Id', whereIn: brandIds.take(10).toList())
//         .get();

//     return brandSnapshot.docs.map((doc) => BrandModel.fromSnapshot(doc)).toList();
//   } catch (e) {
//     TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
//     return [];
//   }
// }

//   Future<List<BrandModel>> getBrandsForCategory(String categoryId) async {
//   // 1. Get all subcategories for this category
//   final subCategories = await CategoryController.instance.getSubCategories(categoryId);
//   final categoryIds = [categoryId, ...subCategories.map((c) => c.id)];

//   // 2. Get all products in these categories (limit to 10 for Firestore)
//   final productSnapshot = await FirebaseFirestore.instance
//       .collection('Products')
//       .where('CategoryId', whereIn: categoryIds.take(10).toList())
//       .get();

//   // 3. Get unique brand IDs from products
//   final brandIds = productSnapshot.docs
//       .map((doc) => doc['Brand']['Id'] as String)
//       .toSet()
//       .toList();

//   if (brandIds.isEmpty) return [];

//   // 4. Fetch brands by IDs
//   final brandSnapshot = await FirebaseFirestore.instance
//       .collection('Brands')
//       .where('Id', whereIn: brandIds.take(10).toList())
//       .get();

//   return brandSnapshot.docs.map((doc) => BrandModel.fromSnapshot(doc)).toList();
// }

// Future<List<BrandModel>> getBrandsForCategory(String categoryId) async {
//   // 1. Get all subcategories for this category
//   final subCategories = await CategoryController.instance.getSubCategories(categoryId);
//   final categoryIds = [categoryId, ...subCategories.map((c) => c.id)];

//   // 2. Get all BrandCategory docs for these categories (limit to 10 for Firestore)
//   final brandCategorySnapshot = await FirebaseFirestore.instance
//       .collection('BrandCategory')
//       .where('categoryId', whereIn: categoryIds.take(10).toList())
//       .get();

//   // 3. Get unique brand IDs from BrandCategory
//   final brandIds = brandCategorySnapshot.docs
//       .map((doc) => doc['brandId'] as String)
//       .toSet()
//       .toList();

//   if (brandIds.isEmpty) return [];

//   // 4. Fetch brands by IDs
//   final brandSnapshot = await FirebaseFirestore.instance
//       .collection('Brands')
//       .where('Id', whereIn: brandIds.take(10).toList())
//       .get();

//   return brandSnapshot.docs.map((doc) => BrandModel.fromSnapshot(doc)).toList();
// }



  Future<List<ProductModel>> getBrandProductsForCategory({
  required String brandId,
  required List<String> categoryIds,
  int limit = 3,
}) async {
  if (categoryIds.isEmpty) return [];
  // Firestore whereIn supports max 10 items
  final limitedCategoryIds = categoryIds.take(10).toList();

  final query = FirebaseFirestore.instance
      .collection('Products')
      .where('Brand.Id', isEqualTo: brandId)
      .where('CategoryId', whereIn: limitedCategoryIds)
      .limit(limit);

  final snapshot = await query.get();
  return snapshot.docs.map((doc) => ProductModel.fromSnapshot(doc)).toList();
}

    // In BrandController
  // Future<List<ProductModel>> getBrandProductsForCategory({
  //   required String brandId,
  //   required List<String> categoryIds,
  //   int limit = 3,
  // }) async {
  //   final query = FirebaseFirestore.instance
  //       .collection('Products')
  //       .where('Brand.Id', isEqualTo: brandId)
  //       .where('CategoryId', whereIn: categoryIds)
  //       .limit(limit);

  //   final snapshot = await query.get();
  //   return snapshot.docs.map((doc) => ProductModel.fromSnapshot(doc)).toList();
  // }

//   Future<List<ProductModel>> getBrandProductsForCategory({
//   required String brandId,
//   required List<String> categoryIds,
//   int limit = 3,
// }) async {
//   if (categoryIds.isEmpty) return [];
//   // Firestore whereIn supports max 10 items
//   final limitedCategoryIds = categoryIds.take(10).toList();

//   final query = FirebaseFirestore.instance
//       .collection('Products')
//       .where('Brand.Id', isEqualTo: brandId)
//       .where('CategoryId', whereIn: limitedCategoryIds)
//       .limit(limit);

//   final snapshot = await query.get();
//   return snapshot.docs.map((doc) => ProductModel.fromSnapshot(doc)).toList();
// }

  // Get brand specific products from your data source
  Future<List<ProductModel>> getBrandProducts({ required String brandId, int limit = -1}) async {
  try {
    final products = await ProductRepository.instance.getProductsForBrand(brandId:brandId, limit: limit);
    return products;
  } catch (e) {
    TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    return [];
  }
}

}
