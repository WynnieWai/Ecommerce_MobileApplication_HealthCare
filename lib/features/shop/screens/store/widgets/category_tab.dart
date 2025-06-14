import 'package:flutter/material.dart';
import 'package:testing_asg1/common/widgets/layouts/grid_layout.dart';
import 'package:testing_asg1/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:testing_asg1/common/widgets/texts/section_heading.dart';
import 'package:testing_asg1/features/shop/models/category_model.dart';
import 'package:testing_asg1/features/shop/screens/home/dummy_product.dart';
import 'package:testing_asg1/utils/constants/sizes.dart';


class TCategoryTab extends StatelessWidget{
  const TCategoryTab({super.key, required this.category});

  final CategoryModel category;

  @override
  Widget build(BuildContext context){

    // Get products for this category
    final categoryProducts = productsByCategory[category] ?? [];
    
    if (categoryProducts.isEmpty) {
      return const Center(
        child: Text('No products available in this category'),
      );
    }
    
    return ListView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),

      children:[
        Padding(
          padding:const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              //Brands
              // TBrandShowcase(images: [TImages.productImage3,TImages.productImage2,TImages.productImage1]),
              // const SizedBox(height: TSizes.spaceBtwItems),

              //Products
              TSectionHeading(title: "You might like", showActionButton: true,onPressed: (){}),
              const SizedBox(height: TSizes.spaceBtwItems),
      
              // TGridLayout(itemCount:4, itemBuilder: (_,index)=>const TProductCardVertical()),
              TGridLayout(
                    itemCount: categoryProducts.length,
                    itemBuilder: (_, index) => TProductCardVertical(
                      product: categoryProducts[index],
                    ),
                  ),
              const SizedBox(height: TSizes.spaceBtwSections,)
      
            ],
            ),
            ),
      ]
    );
  }
}