import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:testing_asg1/common/widgets/appbar/appbar.dart';
import 'package:testing_asg1/features/personalization/screens/profile/update_name_controller.dart';
import 'package:testing_asg1/utils/constants/sizes.dart';
import 'package:testing_asg1/utils/constants/text_strings.dart';
import 'package:testing_asg1/utils/validators/validation.dart';

class ChangeUsername extends StatelessWidget {
  const ChangeUsername({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UpdateNameController());

    return Scaffold(
      /// Custom Appbar
      appBar: TAppBar(
        showBackArrow: true,
        title: Text('Change Username', style: Theme.of(context).textTheme.headlineSmall),
      ),
      body: Padding(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Headings
            Text(
              'Use real name for easy verification. This name will appear on several pages', 
              style: Theme.of(context).textTheme.labelMedium,
            ),
            const SizedBox(height: TSizes.spaceBtwSections),

            /// Text filed and button
            Form(
              key: controller.updateUserNameFormKey, 
              child: Column(
                children: [
                  /// Username Field
                  TextFormField(
                    controller: controller.userName,
                    validator: (value) => TValidator.validateEmptyText('Username', value),
                    expands: false,
                    decoration: const InputDecoration(
                      labelText: TTexts.username,
                      prefixIcon: Icon(Iconsax.user),
                    ),
                  ),
                ],
              )
            ),
            const SizedBox(height: TSizes.spaceBtwSections),

            /// Save Button 
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(onPressed: () => controller.updateUserName(), child: const Text('Save')),
            )
          ],
        ),
      ),
    );
  }
}