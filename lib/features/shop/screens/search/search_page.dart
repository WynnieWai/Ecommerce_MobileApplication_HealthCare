import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:testing_asg1/common/widgets/layouts/grid_layout.dart';
import 'package:testing_asg1/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:testing_asg1/features/shop/controllers/product/product_controller.dart';
import 'package:testing_asg1/features/shop/controllers/brand_controller.dart';
import 'package:testing_asg1/features/shop/models/product_model.dart';
import 'package:testing_asg1/features/shop/models/brand_model.dart';
import 'package:testing_asg1/common/widgets/brands/brand_card.dart';
import 'package:testing_asg1/features/shop/screens/brand/brand_products.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final TextEditingController _searchController = TextEditingController();
  final ProductController productController = Get.find<ProductController>();
  final BrandController brandController = Get.put(BrandController());

  List<ProductModel> filteredProducts = [];
  List<BrandModel> filteredBrands = [];
  String searchType = 'Product'; // or 'Brand'

  void _onSearchChanged(String query) {
    setState(() {
      if (searchType == 'Product') {
        filteredProducts = productController.allProducts
            .where((p) => p.title.toLowerCase().contains(query.toLowerCase()))
            .toList();
      } else {
        filteredBrands = brandController.allBrands
            .where((b) => b.name.toLowerCase().contains(query.toLowerCase()))
            .toList();
      }
    });
  }

  @override
  void initState() {
    super.initState();

    if (productController.allProducts.isEmpty) {
      productController.fetchAllProducts().then((products) {
        print('Fetched products: ${products.length}');
        setState(() {
          productController.allProducts = products;
          filteredProducts = products;
        });
      });
    } else {
      filteredProducts = productController.allProducts;
    }
    filteredBrands = brandController.allBrands;
  }

  @override
  Widget build(BuildContext context) {
  if (searchType == 'Product' && productController.allProducts.isEmpty) {
    return const Scaffold(
      body: Center(child: CircularProgressIndicator()),
    );
  }

  return Scaffold(
    body: SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Search Bar + Dropdown
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _searchController,
                    autofocus: true,
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                      hintText: 'Search products or brands...',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    onChanged: _onSearchChanged,
                  ),
                ),
                const SizedBox(width: 8),
                DropdownButton<String>(
                  value: searchType,
                  underline: const SizedBox(),
                  items: ['Product', 'Brand']
                      .map((type) => DropdownMenuItem(value: type, child: Text(type)))
                      .toList(),
                  onChanged: (value) {
                    if (value != null) {
                      setState(() {
                        searchType = value;
                        _onSearchChanged(_searchController.text);
                      });
                    }
                  },
                ),
              ],
            ),
          ),

          // Grid or List
          Expanded(
            child: searchType == 'Product'
                ? GridView.builder(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 16,
                      crossAxisSpacing: 16,
                      childAspectRatio: 0.63,
                    ),
                    itemCount: filteredProducts.length,
                    itemBuilder: (_, index) => TProductCardVertical(
                      product: filteredProducts[index],
                    ),
                  )
                : ListView.builder(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                    itemCount: filteredBrands.length,
                    itemBuilder: (_, index) => Padding(
                      padding: const EdgeInsets.only(bottom: 12), // space between items
                      child: TBrandCard(
                        brand: filteredBrands[index],
                        showBorder: true,
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => BrandProducts(brand: filteredBrands[index]),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
          ),
        ],
      ),
    ),
  );


  // return Scaffold(
  //     // appBar: PreferredSize(
  //     //   preferredSize: const Size.fromHeight(kToolbarHeight + 12),
  //     //   child: Padding(
  //     //     padding: const EdgeInsets.only(
  //     //       top: 15.0, 
  //     //       bottom: 15.0, 
  //     //     ), 
  //     //     child: AppBar(
  //     //       automaticallyImplyLeading: true,
  //     //       title: TextField(
  //     //         controller: _searchController,
  //     //         autofocus: true,
  //     //         decoration: const InputDecoration(
  //     //           hintText: 'Search products or brands...',
  //     //           border: InputBorder.none,
  //     //         ),
  //     //         onChanged: _onSearchChanged,
  //     //       ),
  //     //       actions: [
  //     //         DropdownButton<String>(
  //     //           value: searchType,
  //     //           underline: const SizedBox(),
  //     //           items: ['Product', 'Brand']
  //     //               .map((type) =>
  //     //                   DropdownMenuItem(value: type, child: Text(type)))
  //     //               .toList(),
  //     //           onChanged: (value) {
  //     //             if (value != null) {
  //     //               setState(() {
  //     //                 searchType = value;
  //     //                 _onSearchChanged(_searchController.text);
  //     //               });
  //     //             }
  //     //           },
  //     //         ),
  //     //       ],
  //     //     ),
  //     //   ),
  //     // ),
      
  //     body: searchType == 'Product'
  //         ? GridView.builder(
  //             padding: const EdgeInsets.only(
  //               top: 32, // 👈 spacing between search bar and product grid
  //               left: 16,
  //               right: 16,
  //               bottom: 16,
  //             ),
  //             gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
  //               crossAxisCount: 2,
  //               mainAxisSpacing: 16,
  //               crossAxisSpacing: 16,
  //               childAspectRatio: 0.63,
  //             ),
  //             itemCount: filteredProducts.length,
  //             itemBuilder: (_, index) => TProductCardVertical(
  //               product: filteredProducts[index],
  //             ),
  //           )
  //         : ListView.builder(
  //             padding: const EdgeInsets.only(
  //               top: 24, // 👈 spacing between search bar and brand list
  //               left: 16,
  //               right: 16,
  //               bottom: 16,
  //             ),
  //             itemCount: filteredBrands.length,
  //             itemBuilder: (_, index) => TBrandCard(
  //               brand: filteredBrands[index],
  //               showBorder: true,
  //               onTap: () {
  //                 Navigator.push(
  //                   context,
  //                   MaterialPageRoute(
  //                     builder: (_) =>
  //                         BrandProducts(brand: filteredBrands[index]),
  //                   ),
  //                 );
  //               },
  //             ),
  //           ),
  //   );
    
    // return Scaffold(
    //   appBar: AppBar(
    //     title: TextField(
    //       controller: _searchController,
    //       autofocus: true,
    //       decoration: const InputDecoration(
    //         hintText: 'Search products or brands...',
    //         border: InputBorder.none,
    //       ),
    //       onChanged: _onSearchChanged,
    //     ),
    //     actions: [
    //       DropdownButton<String>(
    //         value: searchType,
    //         underline: SizedBox(),
    //         items: ['Product', 'Brand']
    //             .map((type) => DropdownMenuItem(value: type, child: Text(type)))
    //             .toList(),
    //         onChanged: (value) {
    //           if (value != null) {
    //             setState(() {
    //               searchType = value;
    //               _onSearchChanged(_searchController.text);
    //             });
    //           }
    //         },
    //       ),
    //     ],
    //   ),
    //   body: searchType == 'Product'
    //           ? GridView.builder(
    //                 padding: const EdgeInsets.all(16),
    //                 gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
    //                   crossAxisCount: 2,
    //                   mainAxisSpacing: 16,
    //                   crossAxisSpacing: 16,
    //                   childAspectRatio: 0.63, // Adjust as needed
    //                 ),
    //                 itemCount: filteredProducts.length,
    //                 itemBuilder: (_, index) => TProductCardVertical(product: filteredProducts[index]),
    //               )
    //             :  ListView.builder(
    //               itemCount: filteredBrands.length,
    //               itemBuilder: (_, index) => TBrandCard(
    //                 brand: filteredBrands[index],
    //                 showBorder: true,
    //                 onTap: () {
    //                   Navigator.push(
    //                     context,
    //                     MaterialPageRoute(
    //                       builder: (_) => BrandProducts(brand: filteredBrands[index]),
    //                     ),
    //           );
    //         },
    //       ),
    //     ),
    // );
  }
}