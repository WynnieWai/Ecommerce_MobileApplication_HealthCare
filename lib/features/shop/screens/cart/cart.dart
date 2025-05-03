import 'package:flutter/material.dart';
import 'package:testing_asg1/common/widgets/appbar/appbar.dart';
import 'package:testing_asg1/common/widgets/products/cart/add_remove_button.dart';
import 'package:testing_asg1/common/widgets/products/cart/cart_item.dart';
import 'package:testing_asg1/common/widgets/texts/product_price_text.dart';

import 'package:testing_asg1/utils/constants/sizes.dart';


class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TAppBar( showBackArrow:true ,title: Text('Cart', style: Theme.of(context).textTheme.headlineSmall)),
      body: Padding(
        padding: EdgeInsets.all(TSizes.defaultSpace),
        child: ListView.separated(
          shrinkWrap: true,
          separatorBuilder: (_,__)=>const SizedBox(height:TSizes.spaceBtwSections), 
          itemCount: 4,
          itemBuilder: (_, index) => Column(
            children:[
              TCartItem(),
              SizedBox(height: TSizes.spaceBtwItems),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      SizedBox(width: 70),
                      //Add Remove Button
                      TProductQuantityWithAddRemoveButton(),
                    ],
                  ),     
                  TProductPriceText(price: '256'),
                ],
              ),                
            ]
          )
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: ElevatedButton(onPressed: (){},child: Text('Checkout \$256.0')),
      ),
    );
  }
}
