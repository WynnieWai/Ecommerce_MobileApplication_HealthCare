import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:testing_asg1/common/widgets/icons/t_circular_icon.dart';
import 'package:testing_asg1/features/shop/controllers/product/cart_controller.dart';
import 'package:testing_asg1/utils/constants/colors.dart';
import 'package:testing_asg1/utils/constants/enums.dart';
import 'package:testing_asg1/utils/helpers/helper_functions.dart';
import 'package:testing_asg1/utils/popups/loaders.dart';

import '../../../../../utils/constants/sizes.dart';
import '../../../models/product_model.dart';

class TBottomAddToCart extends StatelessWidget {
  const TBottomAddToCart({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final controller = CartController.instance;
    controller.updateAlreadyAddedProductCount(product);
    final dark = THelperFunctions.isDarkMode(context);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: TSizes.defaultSpace, vertical: TSizes.defaultSpace / 2),
      decoration: BoxDecoration(
        color: dark ? TColors.darkerGrey : TColors.light,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(TSizes.cardRadiusLg),
          topRight: Radius.circular(TSizes.cardRadiusLg),
        )
      ),
      child: Obx(
      () {
        final isVariable = product.productType == ProductType.variable.toString();
        final selectedVariation = controller.variationController.selectedVariation.value;
        final stock = isVariable ? selectedVariation.stock : product.stock;

        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                TCircularIcon(
                  icon: Iconsax.minus,
                  backgroundColor: TColors.darkGrey,
                  width: 40,
                  height: 40,
                  color: TColors.white,
                  onPressed: controller.productQuantityInCart.value > 0
                      ? () => controller.productQuantityInCart.value -= 1
                      : null,
                ),
                const SizedBox(width: TSizes.spaceBtwItems),
                Text(controller.productQuantityInCart.value.toString(),
                    style: Theme.of(context).textTheme.titleSmall),
                const SizedBox(width: TSizes.spaceBtwItems),
                TCircularIcon(
                icon: Iconsax.add,
                backgroundColor: TColors.black,
                width: 40,
                height: 40,
                color: TColors.white,
                onPressed: () {
                  if (controller.productQuantityInCart.value < stock) {
                    controller.productQuantityInCart.value += 1;
                  } else {
                    TLoaders.warningSnackBar(
                      title: 'Stock Limit Reached',
                      message: 'You have reached the maximum stock for this item.',
                    );
                  }
                },
              ),

              ],
            ),
            ElevatedButton(
              onPressed: controller.productQuantityInCart.value > 0
                  ? () => controller.addToCart(product)
                  : null,
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.all(TSizes.md),
                backgroundColor: TColors.black,
                side: const BorderSide(color: TColors.black),
              ),
              child: const Text('Add to Cart'),
            ),
          ],
        );
      },
    ),

    );
  }
}