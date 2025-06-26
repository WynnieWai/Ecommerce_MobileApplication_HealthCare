import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:testing_asg1/common/widgets/appbar/appbar.dart';
import 'package:testing_asg1/common/widgets/images/t_circular_image.dart';
import 'package:testing_asg1/common/widgets/shimmers/shimmer.dart';
import 'package:testing_asg1/common/widgets/texts/section_heading.dart';
import 'package:testing_asg1/features/personalization/controllers/user_controller.dart';
import 'package:testing_asg1/features/personalization/screens/profile/widgets/change_name.dart';
import 'package:testing_asg1/features/personalization/screens/profile/widgets/change_username.dart';
import 'package:testing_asg1/features/personalization/screens/profile/widgets/profile_menu.dart';
import 'package:testing_asg1/utils/constants/image_strings.dart';
import 'package:testing_asg1/utils/constants/sizes.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;

    return Scaffold(
      appBar: const TAppBar(title: Text('Profile'), showBackArrow: true),

      /// Body
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              //Profile Picture
              SizedBox(
                width: double.infinity,
                child: Column(
                  children: [
                    Obx(() {
                      final networkImage = controller.user.value.profilePicture;
                      final image = networkImage.isNotEmpty
                          ? networkImage
                          : TImages.user; // Fallback to default image if empty
                      return controller.imageUploading.value
                          ? const TShimmerEffect(width: 80, height: 80, radius: 80)
                          : TCircularImage(
                              image: image,
                              width: 80,
                              height: 80,
                              isNetworkImage: networkImage.isNotEmpty,
                            );                      
                    }),
                    TextButton(onPressed: ()=> controller.uploadUserProfilePicture(), child: const Text('Change Profile Picture')),
                  ],
                ),
              ),

              /// Details
              const SizedBox(height: TSizes.spaceBtwItems / 2),
              const Divider(), 
              const SizedBox(height: TSizes.spaceBtwItems),

              /// Heading Profile Info
              const TSectionHeading(title: "Profile Information",showActionButton: false),
              const SizedBox(height: TSizes.spaceBtwItems),

              // TProfileMenu(onPressed: () => Get.to(() => const ChangeName()), title: 'Name', value: controller.user.value.fullName),
              // TProfileMenu(onPressed: () => Get.to(() => const ChangeUsername()), title: 'Username', value: controller.user.value.userName),
                  Obx(() => TProfileMenu(
                  onPressed: () => Get.to(() => const ChangeName()),
                  title: 'Name',
                  value: controller.user.value.fullName,
                )),
                Obx(() => TProfileMenu(
                  onPressed: () => Get.to(() => const ChangeUsername()),
                  title: 'Username',
                  value: controller.user.value.userName,
                )),
              const SizedBox(height: TSizes.spaceBtwItems),
              const Divider(), 
              const SizedBox(height: TSizes.spaceBtwItems),

              /// Heading Personal Info
              const TSectionHeading(title: "Personal Information",showActionButton: false),
              const SizedBox(height: TSizes.spaceBtwItems),

              TProfileMenu(onPressed: (){}, title: 'User ID', value: controller.user.value.id, icon: Iconsax.copy),
              TProfileMenu(onPressed: (){}, title: 'E-mail', value: controller.user.value.email),
              TProfileMenu(onPressed: (){}, title: 'Phone number', value: controller.user.value.phoneNumber),
              // TProfileMenu(onPressed: (){}, title: 'Gender', value: 'Male'),             
              // TProfileMenu(onPressed: (){}, title: 'Date of Birth', value: '10 October 2000'),
              const Divider(),
              const SizedBox(height: TSizes.spaceBtwItems),

              Center(
                child: TextButton(
                  onPressed: () => controller.deleteAccountWarningPopup(),
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