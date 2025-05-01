import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:testing_asg1/utils/constants/sizes.dart';
import 'package:testing_asg1/utils/constants/text_strings.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(), 
      body: Padding(
        padding: EdgeInsets.all(TSizes.defaultSpace), 
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Headings
            Text(TTexts.forgetPasswordTitle, style: Theme.of(context).textTheme.headlineMedium),
            const SizedBox(height: TSizes.spaceBtwItems), 
            Text(TTexts.forgetPasswordSubTitle, style: Theme.of(context).textTheme.labelMedium), 
            const SizedBox(height: TSizes.spaceBtwSections * 2),
            
            /// Text field
            TextFormField(
              decoration: InputDecoration(labelText: TTexts.email, prefixIcon: Icon(Iconsax.direct_right)),
            )
            
            /// Submit Button
          ],
        ),
      ),
    );
  }
}