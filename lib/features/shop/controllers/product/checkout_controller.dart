import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:testing_asg1/common/widgets/texts/section_heading.dart';
import 'package:testing_asg1/features/shop/controllers/product/cart_controller.dart';
import 'package:testing_asg1/features/shop/models/payment_model_model.dart';
import 'package:testing_asg1/features/shop/screens/checkout/widgets/payment_tile.dart';
import 'package:testing_asg1/utils/constants/image_strings.dart';
import 'package:testing_asg1/utils/constants/sizes.dart';
import 'package:testing_asg1/utils/popups/loaders.dart';

class CheckoutController extends GetxController {
  static CheckoutController get instance => Get.find();

  final Rx<PaymentMethodModel> selectedPaymentMethod = PaymentMethodModel.empty().obs;

  @override
  void onInit() {
    selectedPaymentMethod.value = PaymentMethodModel(name: 'Paypal', image: TImages.paypal);
    super.onInit();
  }

  Future<dynamic> selectPaymentMethod(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      builder: (_) => SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(TSizes.lg),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TSectionHeading(title: 'Select Payment Method', showActionButton: false),
              SizedBox(height: TSizes.spaceBtwSections),
              TPaymentTile(paymentMethod: PaymentMethodModel(name: 'Paypal',image:TImages.paypal)),
              const SizedBox(height: TSizes.spaceBtwItems/2),
              TPaymentTile(paymentMethod: PaymentMethodModel(name: 'Google Pay', image: TImages.googlePay)),
              const SizedBox(height: TSizes.spaceBtwItems / 2),
              TPaymentTile(paymentMethod: PaymentMethodModel(name: 'Apple Pay', image: TImages.applePay)),
              const SizedBox(height: TSizes.spaceBtwItems / 2),
              TPaymentTile(paymentMethod: PaymentMethodModel(name: 'VISA', image: TImages.visa)),
              const SizedBox(height: TSizes.spaceBtwItems / 2),
              TPaymentTile(paymentMethod: PaymentMethodModel(name: 'Master Card', image: TImages.masterCard)),
              const SizedBox(height: TSizes.spaceBtwItems / 2),
              TPaymentTile(paymentMethod: PaymentMethodModel(name: 'Paytm', image: TImages.paytm)),
              const SizedBox(height: TSizes.spaceBtwItems / 2),
              TPaymentTile(paymentMethod: PaymentMethodModel(name: 'Paystack', image: TImages.paystack)),
              const SizedBox(height: TSizes.spaceBtwItems / 2),
              TPaymentTile(paymentMethod: PaymentMethodModel(name: 'Credit Card', image: TImages.creditCard)),
              const SizedBox(height: TSizes.spaceBtwItems/2),
              const SizedBox(height: TSizes.spaceBtwSections),

            ],
          ),
        ),
      ),
    );
  }

  Future<bool> deductItemsFromFirebase() async {
      final firestore = FirebaseFirestore.instance;
      final cartItems = CartController.instance.cartItems;
      bool allSuccess = true;

      for (final cartItem in cartItems) {
        try {
          final productRef = firestore.collection('Products').doc(cartItem.productId);
          final productSnapshot = await productRef.get();

          if (!productSnapshot.exists) {
            TLoaders.errorSnackBar(title: 'Error', message: 'Product not found');
            allSuccess = false;
            continue;
          }

          final data = productSnapshot.data() as Map<String, dynamic>;
          final variations = List<Map<String, dynamic>>.from(data['ProductVariations'] ?? []);

          final variationIndex = variations.indexWhere((v) => v['Id'] == cartItem.variationId);
          if (variationIndex == -1) {
            TLoaders.errorSnackBar(title: 'Error', message: 'Variation not found');
            allSuccess = false;
            continue;
          }

          final currentStock = variations[variationIndex]['Stock'] ?? 0;
          if (currentStock < cartItem.quantity) {
            TLoaders.errorSnackBar(
              title: 'Out of stock',
              message: 'Not enough stock for ${cartItem.title}',
            );
            allSuccess = false;
            continue;
          }


          // Deduct stock
          variations[variationIndex]['Stock'] = currentStock - cartItem.quantity;
          await productRef.update({'ProductVariations': variations});


          if (variations[variationIndex]['Stock']==0){
            await productRef.update({'IsFeatured':false});
          }
        } catch (e) {
          TLoaders.errorSnackBar(title: 'Error', message: 'Error updating stock: $e');
          allSuccess = false;
        }
      }
      return allSuccess;
  }
}
