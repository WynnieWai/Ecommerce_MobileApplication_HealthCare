import 'package:flutter/material.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:iconsax/iconsax.dart';
import 'package:testing_asg1/common/widgets/appbar/appbar.dart';
import 'package:testing_asg1/common/widgets/custom_shapes/containers/circular_container.dart';
import 'package:testing_asg1/common/widgets/images/t_circular_image.dart';
import 'package:testing_asg1/common/widgets/texts/section_heading.dart';
import 'package:testing_asg1/features/personalization/screens/profile/widgets/profile_menu.dart';
import 'package:testing_asg1/utils/constants/image_strings.dart';
import 'package:testing_asg1/utils/constants/sizes.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TAppBar(
        title: Text('Profile'),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding:EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              //Profile Picture
              SizedBox(
                width: double.infinity,
                child: Column(
                  children: [
                    const TCircularImage(image:TImages.user,width:80,height:80),
                    TextButton(onPressed: (){}, child: const Text('Change Profile Picture')),
                  ],
                )
              ),
              //Details
              const SizedBox(height: TSizes.spaceBtwItems / 2),
              const Divider(), 
              const SizedBox(height: TSizes.spaceBtwItems),
              const TSectionHeading(title: "Profile Information",showActionButton: false),
              const SizedBox(height: TSizes.spaceBtwItems),

              TProfileMenu(onPressed: (){}, title: 'Name', value: 'John Doe'),
              TProfileMenu(onPressed: (){}, title: 'Username', value: 'John_Doe'),

              const SizedBox(height: TSizes.spaceBtwItems),
              const Divider(), 
              const SizedBox(height: TSizes.spaceBtwItems),

              const TSectionHeading(title: "Personal Information",showActionButton: false),
              const SizedBox(height: TSizes.spaceBtwItems),

              TProfileMenu(onPressed: (){}, title: 'User ID', value: 'John Doe'),
              TProfileMenu(onPressed: (){}, title: 'E-mail', value: 'JohnDoe@gmail.com'),
              TProfileMenu(onPressed: (){}, title: 'Phone number', value: '+12-345-67890'),
              TProfileMenu(onPressed: (){}, title: 'Gender', value: 'Male'),             
              TProfileMenu(onPressed: (){}, title: 'Date of Birth', value: '10 October 2000'),
              const Divider(),
              const SizedBox(height: TSizes.spaceBtwItems),

              Center(
                child: TextButton(
                  onPressed: (){},
                  child: const Text('Close Account', style: TextStyle(color: Colors.red))                  
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}