// import 'package:flutter/material.dart';
// import 'package:testing_asg1/common/widgets/appbar/appbar.dart';
// import 'package:testing_asg1/common/widgets/brands/brand_card.dart';
// import 'package:testing_asg1/common/widgets/layouts/grid_layout.dart';
// import 'package:testing_asg1/common/widgets/texts/section_heading.dart';
// import 'package:testing_asg1/features/shop/screens/store/dummy_brand.dart';
// import 'package:testing_asg1/utils/constants/sizes.dart';

// class AllBrandsScreen extends StatelessWidget{
//   const AllBrandsScreen({super.key});

//   @override
//   Widget build(BuildContext context) {

//     return Scaffold(
//       appBar: const TAppBar(title:Text('Brand'),showBackArrow:true),
//       body:SingleChildScrollView(
//         child:Padding(
//           padding: const EdgeInsets.all(TSizes.defaultSpace),
//           child:Column(
//             children: [
//               //Heading
//               const TSectionHeading(title: "Brands",showActionButton: false),
//               const SizedBox(height: TSizes.spaceBtwItems),

//               // //Brands
//               // TGridLayout(
//               //   itemCount: 10, 
//               //   mainAxisExtent: 80,
//               //   itemBuilder:(context,index)=>TBrandCard(showBorder:true, onTap:()=> Get.to(()=>const BrandProducts()), ),
//               // ),

//                 TGridLayout(
//                 //itemCount:4,
//                 itemCount: dummyBrands.length,
//                 mainAxisExtent: 80, 
//                 itemBuilder:(_,index){
//                 final brand = dummyBrands[index];
//                 // In the Backend Tutorial we will pass the each Brand and onPress Event also
//                 // return const TBrandCard(showBorder:false); 
//                 return TBrandCard(
//                   showBorder:false,
//                   title: brand.title,
//                   imagePath: brand.image,
//                   productCount: brand.productCount,
//                   );

//                   }
//                 )

//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:testing_asg1/common/widgets/appbar/appbar.dart';
import 'package:testing_asg1/common/widgets/brands/brand_card.dart';
import 'package:testing_asg1/common/widgets/layouts/grid_layout.dart';
import 'package:testing_asg1/common/widgets/texts/section_heading.dart';
import 'package:testing_asg1/features/shop/screens/brand/brand_products.dart';
import 'package:testing_asg1/utils/constants/sizes.dart';
import 'package:get/get.dart';

class AllBrandsScreen extends StatelessWidget{
  const AllBrandsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TAppBar(title:Text('Brand'),showBackArrow:true),
      body:SingleChildScrollView(
        child:Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child:Column(
            children: [
              //Heading
              const TSectionHeading(title: "Brands",showActionButton: false),
              const SizedBox(height: TSizes.spaceBtwItems),

              //Brands
              TGridLayout(
                itemCount: 10, 
                mainAxisExtent: 80,
                itemBuilder:(context,index)=>TBrandCard(showBorder:true, onTap:()=> Get.to(()=>const BrandProducts()), ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
