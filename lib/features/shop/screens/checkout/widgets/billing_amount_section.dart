import 'package:flutter/material.dart';
import 'package:testing_asg1/utils/constants/sizes.dart';

class TBillingAmountSection extends StatelessWidget {
  const TBillingAmountSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
     return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            //Billing Address
            Text('Subtotal', style: Theme.of(context).textTheme.bodyMedium),
            //Product Price
            Text('\$256.0', style: Theme.of(context).textTheme.bodyMedium),
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
            Text('\$8.0', style: Theme.of(context).textTheme.labelLarge),
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
            Text('\$6.0', style: Theme.of(context).textTheme.labelLarge),
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
            Text('\$6.0', style: Theme.of(context).textTheme.titleMedium),
          ],
        ),      
      ],    
    );
  }
}