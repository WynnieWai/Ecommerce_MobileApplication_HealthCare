import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:iconsax/iconsax.dart';
import 'package:testing_asg1/common/widgets/appbar/appbar.dart';
import 'package:testing_asg1/common/widgets/layouts/grid_layout.dart';
import 'package:testing_asg1/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:testing_asg1/common/widgets/products/sortable/sortable_products.dart';
import 'package:testing_asg1/common/widgets/shimmers/vertical_product_shimmer.dart';
import 'package:testing_asg1/features/shop/controllers/all_products_controller.dart';
import 'package:testing_asg1/features/shop/models/product_model.dart';
import 'package:testing_asg1/features/shop/screens/home/dummy_product.dart';
import 'package:testing_asg1/utils/constants/sizes.dart';
import 'package:testing_asg1/utils/helpers/cloud_helper_functions.dart';

class AllProducts extends StatelessWidget{
  const AllProducts({super.key,required this.title,this.query,this.futureMethod});

final String title;
final Query? query;
final Future<List<ProductModel>>? futureMethod;



  @override
  Widget build(BuildContext context){

    // Initialize controller for managing product fetching
    final controller = Get.put(AllProductsController());

    return Scaffold(
      appBar: TAppBar(title: Text(title),showBackArrow: true),
      body:SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: FutureBuilder(
            future: futureMethod ?? controller.fetchProductsByQuery(query), 
            builder: (context, snapshot){
              // Check the state of the FutureBuilder snapshot
              const loader = TVerticalProductShimmer();
              final widget = TCloudHelperFunctions.checkMultiRecordState(snapshot: snapshot, loader: loader);

              // Return appropriate widget based on snapshot state
              if (widget != null) return widget;

              // Products found
              final products = snapshot.data!;

              return TSortableProducts(products:products);
            }),
        ),
      ),
    );
  }
}

// class TSortableProducts extends StatelessWidget {
//   const TSortableProducts({
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         //Dropdown
//         DropdownButtonFormField(
//           decoration: const InputDecoration(prefixIcon: Icon(Iconsax.sort)),
//           onChanged:(value){},
//           items: ['Name','Higher Price','Lower Price','Sale','Newest','Popularity']
//           .map((option)=>DropdownMenuItem(value:option, child: Text(option)))
//           .toList(),
//         ),
    
//         const SizedBox(height: TSizes.spaceBtwSections),
    
//         //Product
//         TGridLayout(itemCount: 4, itemBuilder: (_,index) => TProductCardVertical(product: ProductModel.empty()))
//         // TGridLayout(
//         //   itemCount: products.length,
//         //   itemBuilder: (_, index) => TProductCardVertical(
//         //     product: products[index],
//         //   ),
//         // ),
//       ],
//     );
//   }
// }