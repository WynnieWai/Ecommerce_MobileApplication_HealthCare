import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:testing_asg1/data/repositories/product/product_repository.dart';
import 'package:testing_asg1/features/shop/models/product_model.dart';
import 'package:testing_asg1/upload_data.dart';
import 'package:testing_asg1/utils/constants/enums.dart';
import 'package:testing_asg1/utils/popups/loaders.dart';

class ProductController extends GetxController {
  static ProductController get instance => Get.find();

  final isLoading = false.obs;
  final productRepository = Get.put(ProductRepository());
  RxList<ProductModel> featuredProducts = <ProductModel>[].obs;
  List<ProductModel> allFeaturedProducts = [];
  List<ProductModel> allProducts = [];
  @override 
  void onInit() {
    fetchFeaturedProducts();
    super.onInit();
  }
  
  void fetchFeaturedProducts() async {
    try {
      // Show loader while loading Products
      isLoading.value = true;

      // Fetch Products
      final products = await productRepository.getFeaturedProducts();
      debugPrint('Hihi4');
      // Assign Products
        allFeaturedProducts = products; // cache all products
      featuredProducts.assignAll(products);
      debugPrint('Hihi5');
      //uploadDummyProducts(); // Uncomment this line to upload dummy products
    } catch (e) {
      TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    } finally {
      isLoading.value = false;
    }
  }

    Future<List<ProductModel>> fetchAllFeaturedProducts() async {
    try {
      // Fetch Products
      final products = await productRepository.getAllFeaturedProducts();
      return products;
    } catch (e) {
      TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
      return [];
    }
    
  }

  Future<List<ProductModel>> fetchAllProducts() async {
  try {
    final products = await productRepository.getAllProducts();
    return products;
  } catch (e) {
    TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    return [];
  }
}


  /// Get the product price or price range for variations 
  String getProductPrice(ProductModel product) {
    double smallestPrice = double.infinity;
    double largestPrice = 0.0;

    // If no variations exist, return the simple price or sale price 
    if (product.productType == ProductType.single.toString()) {
      return (product.salePrice > 0 ? product.salePrice : product.price).toString();
    }
    else {
      // Calculate the smallest and largest prices among variations 
      for (var variation in product.productVariations!) {
        // Determine the price to consider (sale price if available, otherwise regular price)
        double priceToConsider = variation.salePrice > 0.0 ? variation.salePrice : variation.price;

        // Update smallest and largest prices 
        if (priceToConsider < smallestPrice) {
          smallestPrice = priceToConsider;
        }

        if (priceToConsider > largestPrice) {
          largestPrice = priceToConsider;
        }
      }

      // If smallest and largest prices are the same, return a single price 
      if (smallestPrice.isEqual(largestPrice)) {
        return largestPrice.toString();
      }
      else {
        // Otherwise, return a price range 
        return '$smallestPrice - \$$largestPrice';
      }
    }
  }

  /// -- Calculate Discount Percentage 
  String?  calculateSalePercentage(double originalPrice, double salePrice) {
    if (salePrice <= 0.0) return null;
    if (originalPrice <= 0) return null;

    double percentage = ((originalPrice - salePrice) / originalPrice) * 100;
    return percentage.toStringAsFixed(0);
  }

  /// -- Check Product Stock Status 
  String getProductStockStatus(int stock) {
    return stock > 0 ? 'In Stock' : 'Out of Stock';
  }
// Add this search method
void searchProducts(String query) {
  if (query.isEmpty) {
    featuredProducts.assignAll(allFeaturedProducts);
  } else {
    final results = allFeaturedProducts.where((product) =>
      product.title.toLowerCase().contains(query.toLowerCase())
    ).toList();
    featuredProducts.assignAll(results);
  }
}
  
}