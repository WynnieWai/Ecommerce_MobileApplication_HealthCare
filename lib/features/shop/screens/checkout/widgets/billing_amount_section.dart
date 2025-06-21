import 'package:flutter/material.dart';
import 'package:testing_asg1/features/shop/controllers/product/cart_controller.dart';
import 'package:testing_asg1/utils/constants/sizes.dart';
import 'package:testing_asg1/utils/helpers/pricing_calculator.dart';

class TBillingAmountSection extends StatelessWidget {
  const TBillingAmountSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final cartController= CartController.instance;
    final subTotal =cartController.totalCartPrice.value;
     return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            //Billing Address
            Text('Subtotal', style: Theme.of(context).textTheme.bodyMedium),
            //Product Price
            Text('\$$subTotal', style: Theme.of(context).textTheme.bodyMedium),
          ],
        ),
        const SizedBox(height: TSizes.spaceBtwItems/2),

        ///Shipping Fee
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            //Billing Address
            Text('Shipping Fee', style: Theme.of(context).textTheme.bodyMedium),
            //Product Price
            Text('\$${TPricingCalculator.calculateShippingCost(subTotal, 'US')}', style: Theme.of(context).textTheme.labelLarge),

          ],
        ),

        const SizedBox(height: TSizes.spaceBtwItems/2),

        ///Tax Fee
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            //Billing Address
            Text('Tax Fee', style: Theme.of(context).textTheme.bodyMedium),
            //Product Price
            Text('\$${TPricingCalculator.calculateTax(subTotal, 'US')}', style: Theme.of(context).textTheme.labelLarge),
          ],
        ),
        const SizedBox(height: TSizes.spaceBtwItems/2),

        ///Order Total
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            //Billing Address
            Text('Order Total', style: Theme.of(context).textTheme.bodyMedium),
            //Product Price
            Text('\$${TPricingCalculator.calculateTotalPrice(subTotal, 'US')}', style: Theme.of(context).textTheme.titleMedium),

          ],
        ),      
      ],    
    );
  }
}