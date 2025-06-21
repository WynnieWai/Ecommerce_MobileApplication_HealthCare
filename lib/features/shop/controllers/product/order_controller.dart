import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:testing_asg1/common/widgets/success_screen/success_screen.dart';
import 'package:testing_asg1/data/repositories/authentication/authentication_repository.dart';
import 'package:testing_asg1/data/repositories/order/order_repository.dart';
import 'package:testing_asg1/features/personalization/controllers/address_controller.dart';
import 'package:testing_asg1/features/shop/controllers/product/cart_controller.dart';
import 'package:testing_asg1/features/shop/controllers/product/checkout_controller.dart';
import 'package:testing_asg1/features/shop/models/order_model.dart';
import 'package:testing_asg1/navigation_menu.dart';
import 'package:testing_asg1/utils/constants/enums.dart';
import 'package:testing_asg1/utils/constants/image_strings.dart';
import 'package:testing_asg1/utils/popups/full_screen_loader.dart';
import 'package:testing_asg1/utils/popups/loaders.dart';

class OrderController extends GetxController {
  static OrderController get instance => Get.find();

  // Variables
  final cartController = CartController.instance;
  final addressController = AddressController.instance;
  final checkoutController = CheckoutController.instance;
  final orderRepository = Get.put(OrderRepository());

  // Fetch user's order history
  Future<List<OrderModel>> fetchUserOrders() async {
    try {
      final userOrders = await orderRepository.fetchUserOrders();
      return userOrders;
    } catch (e) {
      TLoaders.warningSnackBar(title: 'Oh Snap!', message: e.toString());
      return [];
    }
  }

  // Add methods for order processing
  // Add methods for order processing
  void processOrder(double totalAmount) async {
    try {
      // Check if address is selected
      if (addressController.selectedAddress.value.id.isEmpty) {
        TLoaders.errorSnackBar(
          title: 'No Address',
          message: 'Please select a shipping address before proceeding.',
        );
        return;
      }
      // Start Loader
      TFullScreenLoader.openLoadingDialog('Processing your order', TImages.pencilAnimation);

      // Get user authentication Id
      final userId = AuthenticationRepository.instance.authUser?.uid;
      if (userId == null || userId.isEmpty) return;
      
      //if (userId.isEmpty) return;

      // Add Details
      final order = OrderModel(
        // Generate a unique ID for the order
        id: UniqueKey().toString(),
        userId: userId,
        status: OrderStatus.pending,
        totalAmount: totalAmount,
        orderDate: DateTime.now(),
        paymentMethod: checkoutController.selectedPaymentMethod.value.name,
        address: addressController.selectedAddress.value,
        // Set Dates as needed
        deliveryDate: DateTime.now(),
        items: cartController.cartItems.toList(),
      );

      // Save the order to Firestore
      await orderRepository.saveOrder(order, userId);

      // Update the cart status
      cartController.clearCart();

      // Show Success screen
      Get.off(() => SuccessScreen(
        image: TImages.orderCompletedAnimation,
        title: 'Payment Success!',
        subTitle: 'Your item will be shipped soon!',
        onPressed: () => Get.offAll(() => const NavigationMenu()),
      ));
    } catch (e) {
      TLoaders.warningSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }

}
