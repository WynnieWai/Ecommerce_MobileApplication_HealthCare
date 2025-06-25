import 'package:flutter/material.dart';
import 'package:testing_asg1/common/widgets/images/t_rounded_image.dart';
import 'package:testing_asg1/common/widgets/texts/t_brand_title_text_verified_icon.dart';
import 'package:testing_asg1/features/shop/models/cart_item_model.dart';
import 'package:testing_asg1/utils/constants/colors.dart';
import 'package:testing_asg1/utils/constants/sizes.dart';
import 'package:testing_asg1/utils/helpers/helper_functions.dart';

class TCartItem extends StatelessWidget {
  const TCartItem({
    super.key, 
    required this.cartItem,
  });

  final CartItemModel cartItem;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Product Image
        TRoundedImage(
          imageUrl: cartItem.image ?? '',
          width: 60,
          height: 60,
          isNetworkImage: true,
          padding: const EdgeInsets.all(TSizes.sm),
          backgroundColor: THelperFunctions.isDarkMode(context)? TColors.darkerGrey : TColors.light
        ),
        const SizedBox(width: TSizes.spaceBtwItems),

        // Product Info
        // 📝 Product Info
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Brand
              TBrandTitleWithVerifiedIcon(title: cartItem.brandName ?? ''),
              const SizedBox(height: 4),

              // Product title (smaller)
              Text(
                cartItem.title,
                style: Theme.of(context).textTheme.bodyMedium,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 4),

              // // Size Info (e.g., Size 125ml)
              // Text.rich(
              //   TextSpan(
              //     children: (cartItem.selectedVariation ?? {}).entries.map(
              //       (e) => TextSpan(
              //         children: [
              //           TextSpan(
              //             text: '${e.key}: ',
              //             style: Theme.of(context).textTheme.bodySmall,
              //           ),
              //           TextSpan(
              //             text: '${e.value}',
              //             style: Theme.of(context).textTheme.bodyMedium,
              //           ),
              //         ],
              //       ),
              //     ).toList(),
              //   ),
              // ),

              // Size and Quantity (inline)
              Row(
                children: [
                  Text(
                    'Size: ${cartItem.selectedVariation?['Size'] ?? 'N/A'}',
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  const SizedBox(width: 12),
                  Text(
                    'Qty: ${cartItem.quantity}',
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ],
              ),
              
              const SizedBox(height: 4),

              // Product Price
              Text(
                '\$${cartItem.price.toStringAsFixed(2)}',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ],
          ),
        ),
        
        // // Title and Price & Size
        // Expanded(
        //   child: Column(
        //     mainAxisSize: MainAxisSize.min,
        //     crossAxisAlignment: CrossAxisAlignment.start,
        //     children: [
        //       TBrandTitleWithVerifiedIcon( title: cartItem.brandName ?? ''),
        //       Flexible(child: TProductTitleText(title: cartItem.title, maxLines: 1)),
          
        //       Text.rich(TextSpan(
        //         children: (cartItem.selectedVariation ?? {}).entries.map(
        //           (e) => TextSpan(
        //             children: [
        //               TextSpan(text: ' ${e.key} ', style: Theme.of(context).textTheme.bodySmall),
        //               TextSpan(text: '${e.value} ', style: Theme.of(context).textTheme.bodyLarge),
        //             ],
        //           ),
        //         ).toList(),
        //       ))
        //     ],
        //   ),
        // )
      ],
    );
  }
}