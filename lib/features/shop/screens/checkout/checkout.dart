import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:testing_asg1/common/widgets/appbar/appbar.dart';
import 'package:testing_asg1/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:testing_asg1/common/widgets/products/cart/coupon_widget.dart';
import 'package:testing_asg1/common/widgets/success_screen/success_screen.dart';
import 'package:testing_asg1/features/shop/screens/cart/widgets/cart_items.dart';
import 'package:testing_asg1/features/shop/screens/checkout/widgets/billing_address_section.dart';
import 'package:testing_asg1/features/shop/screens/checkout/widgets/billing_amount_section.dart';
import 'package:testing_asg1/features/shop/screens/checkout/widgets/billing_payment_section.dart';
import 'package:testing_asg1/navigation_menu.dart';
import 'package:testing_asg1/utils/constants/colors.dart';
import 'package:testing_asg1/utils/constants/image_strings.dart';
import 'package:testing_asg1/utils/constants/sizes.dart';
import 'package:testing_asg1/utils/helpers/helper_functions.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Scaffold(
      appBar: TAppBar(showBackArrow:true, title:Text('Order Review', style: Theme.of(context).textTheme.headlineSmall)),
      body:SingleChildScrollView(
        child:Padding(
          padding:const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              const TCartItems(showAddRemoveButton: false),
              const SizedBox(height: TSizes.spaceBtwSections),

              // Coupon TextField
              TCouponCode(),
              const SizedBox(height: TSizes.spaceBtwSections),

              // Billing Section
              TRoundedContainer(
                showBorder: true,
                padding: const EdgeInsets.all(TSizes.md),
                backgroundColor: dark ?TColors.black: TColors.white,
                child: Column(
                  children: [
                    //Pricing
                    TBillingAmountSection(),
                    const SizedBox(height: TSizes.spaceBtwItems),


                    //Divider
                    const Divider(),
                    const SizedBox(height: TSizes.spaceBtwItems),

                    //Payment Method
                    TBillingPaymentSection(),
                    const SizedBox(height: TSizes.spaceBtwItems),

                    //Address
                    const TBillingAddressSection(),
                    const SizedBox(height: TSizes.spaceBtwItems),

                  ],                 
                ),
              ),
            ],
          )
       )
      ),
    
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: ElevatedButton(
          onPressed: ()=>Get.to(
            ()=> SuccessScreen(
              image: TImages.successfulPaymentIcon,
              title: 'Payment Successful',
              subTitle: 'Your item will be delivered to you soon',
              onPressed: ()=> Get.offAll(()=> const NavigationMenu()),
            )
          ), 
        child: Text('Checkout \$256.0')),
      ),
    );
  }
}

