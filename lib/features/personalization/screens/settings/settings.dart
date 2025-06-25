import "package:flutter/material.dart";
import "package:get/get.dart";
import "package:iconsax/iconsax.dart";
import "package:testing_asg1/common/widgets/appbar/appbar.dart";
import "package:testing_asg1/common/widgets/custom_shapes/containers/primary_header_container.dart";
import "package:testing_asg1/common/widgets/list_tiles/settings_menu_tile.dart";
import "package:testing_asg1/common/widgets/list_tiles/user_profile_tile.dart";
import "package:testing_asg1/common/widgets/texts/section_heading.dart";
import "package:testing_asg1/data/repositories/authentication/authentication_repository.dart";
import "package:testing_asg1/features/personalization/screens/address/address.dart";
import "package:testing_asg1/features/personalization/screens/faq/frequent_ask_question.dart";
import "package:testing_asg1/features/personalization/screens/profile/profile.dart";
import "package:testing_asg1/features/shop/screens/cart/cart.dart";
import "package:testing_asg1/features/shop/screens/order/order.dart";
import "package:testing_asg1/utils/constants/colors.dart";
import "package:testing_asg1/utils/constants/sizes.dart";

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  bool isGeolocationOn = true;
  bool isSafeModeOn = true;
  bool isHDImageQualityOn = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            TPrimaryHeaderContainer(
              child: Column(
                children: [
                  TAppBar(
                    title: Text(
                      'Account',
                      style: Theme.of(context).textTheme.headlineMedium!.apply(color: TColors.white),
                    ),
                  ),
                  TUserProfileTile(onPressed: () => Get.to(() => const ProfileScreen())),
                  const SizedBox(height: TSizes.spaceBtwSections),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(TSizes.defaultSpace),
              child: Column(
                children: [
                  const TSectionHeading(title: 'Account Setting', showActionButton: false),
                  const SizedBox(height: TSizes.spaceBtwItems),
                  TSettingsMenuTile(icon: Iconsax.safe_home, title: 'My Addresses', subTitle: 'Set shopping delivery address', onTap: () => Get.to(() => const UserAddressScreen())),
                  TSettingsMenuTile(icon: Iconsax.shopping_cart, title: 'My Cart', subTitle: 'Add,remove products and move to checkout', onTap: () => Get.to(() => const CartScreen())),
                  TSettingsMenuTile(icon: Iconsax.bag_tick, title: 'My Orders', subTitle: 'In-progress and Completed Orders', onTap: () => Get.to(() => const OrderScreen())),
                  TSettingsMenuTile(icon: Iconsax.message_question, title: 'FAQs', subTitle: 'Find answers to common questions', onTap: () => Get.to(() => const FrequentAskQuestion()),),
                  TSettingsMenuTile(icon: Iconsax.discount_shape, title: 'My Coupons', subTitle: 'List of all the discounted coupons'),
                  TSettingsMenuTile(icon: Iconsax.notification, title: 'Notifications', subTitle: 'Set any kind of notification message'),
                  TSettingsMenuTile(icon: Iconsax.security_card, title: 'Account Privacy', subTitle: 'Manage data usage and connected accounts'),

                  SizedBox(height: TSizes.spaceBtwSections),
                  TSectionHeading(title: 'App Settings', showActionButton: false),
                  SizedBox(height: TSizes.spaceBtwItems),
                  //TSettingsMenuTile(icon: Iconsax.document_upload, title: 'Load Data', subTitle: 'Upload Data to your Cloud Firebase'),

                  TSettingsMenuTile(
                    icon: Iconsax.location,
                    title: 'Geolocation',
                    subTitle: 'Set recommendation based on location',
                    trailing: Switch(
                      value: isGeolocationOn,
                      onChanged: (value) {
                        setState(() {
                          isGeolocationOn = value;
                        });
                      },
                    ),
                  ),

                  TSettingsMenuTile(
                    icon: Iconsax.security_user,
                    title: 'Safe Mode',
                    subTitle: 'Search result is safe for all pages',
                    trailing: Switch(
                      value: isSafeModeOn,
                      onChanged: (value) {
                        setState(() {
                          isSafeModeOn = value;
                        });
                      },
                    ),
                  ),

                  TSettingsMenuTile(
                    icon: Iconsax.image,
                    title: 'HD Image Quality',
                    subTitle: 'Set all quality to be seen',
                    trailing: Switch(
                      value: isHDImageQualityOn,
                      onChanged: (value) {
                        setState(() {
                          isHDImageQualityOn = value;
                        });
                      },
                    ),
                  ),

                  const SizedBox(height: TSizes.spaceBtwSections),
                  SizedBox(
                    width: double.infinity,
                    child: OutlinedButton(
                      onPressed: () async {
                        try {
                          await AuthenticationRepository.instance.logout();
                          Get.snackbar('Logout Successful', 'You have been logged out.', snackPosition: SnackPosition.BOTTOM);
                        } catch (e) {
                          Get.snackbar('Logout Failed', e.toString(), snackPosition: SnackPosition.BOTTOM);
                        }
                      },
                      child: const Text('Logout'),
                    ),
                  ),

                  const SizedBox(height: TSizes.spaceBtwSections * 2.5),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
