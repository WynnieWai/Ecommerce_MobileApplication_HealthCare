import 'package:flutter/material.dart';
import 'package:testing_asg1/common/widgets/texts/section_heading.dart';
import 'package:testing_asg1/utils/constants/sizes.dart';

class TBillingAddressSection extends StatelessWidget {
  const TBillingAddressSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TSectionHeading(title: 'Shipping Address', buttonTitle: 'Change', onPressed: () {}),
        Text('Code with T', style: Theme.of(context).textTheme.bodyLarge),

        Row(
          children: [
            const Icon(Icons.phone, color:Colors.grey,size:16),
            const SizedBox(width: TSizes.spaceBtwItems),
            Text('+12-345-67890', style: Theme.of(context).textTheme.bodyMedium),
          ],
        ),

        const SizedBox(height: TSizes.spaceBtwItems/2),

        Row(
          children: [
            const Icon(Icons.location_history, color:Colors.grey,size:16),
            const SizedBox(width: TSizes.spaceBtwItems),
            Expanded(child: Text('+12-345-67890', style: Theme.of(context).textTheme.bodyMedium, softWrap: true)),
          ],
        ),


      ],
    );
  }
}