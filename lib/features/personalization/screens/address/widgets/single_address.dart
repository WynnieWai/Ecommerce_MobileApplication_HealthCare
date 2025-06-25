import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:iconsax/iconsax.dart';
import 'package:testing_asg1/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:testing_asg1/features/personalization/controllers/address_controller.dart';
import 'package:testing_asg1/features/personalization/models/address_model.dart';
import 'package:testing_asg1/utils/constants/colors.dart';
import 'package:testing_asg1/utils/constants/sizes.dart';
import 'package:testing_asg1/utils/helpers/helper_functions.dart';

class TSingleAddress extends StatelessWidget{
  const TSingleAddress({
    super.key,
    required this.address,
    required this.onTap,
    required this.onDelete,
  });

  final AddressModel address;
  final VoidCallback onTap;
  final VoidCallback onDelete;

  @override
  Widget build(BuildContext context){
    final controller = AddressController.instance;
    final dark=THelperFunctions.isDarkMode(context);

    return Obx(
      (){ 
        final selectedAddressId = controller.selectedAddress.value.id;
        final selectedAddress = selectedAddressId == address.id;

        return InkWell(
        onTap:onTap,
        child: TRoundedContainer(
          padding: const EdgeInsets.all(TSizes.md),
          width:double.infinity,
          showBorder: true,
          backgroundColor: selectedAddress?TColors.primary.withOpacity(0.25):Colors.transparent,
          borderColor: selectedAddress
            ?Colors.transparent
            :dark
              ?TColors.darkerGrey
              :TColors.grey,
          margin: EdgeInsets.only(bottom: TSizes.spaceBtwItems),

          // child: Stack(
          //   children: [
          //     Positioned(
          //       right:5,
          //       top:0,
          //       child: Icon(
          //         selectedAddress?Iconsax.tick_circle5:null,
          //         color: selectedAddress
          //           ?dark
          //             ?TColors.light
          //             :TColors.dark
          //           :null,
          //       ),
          //     ),

          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Left Side: Address Info
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      address.name,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    const SizedBox(height: TSizes.sm),
                    Text(
                      address.formattedPhoneNo,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    const SizedBox(height: TSizes.sm / 2),
                    // 🆕 Custom formatted address
                    Text(
                      '${address.street}, ${address.postalCode}',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    const SizedBox(height: 2),
                    Text(
                      '${address.city}, ${address.state}, ${address.country}',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    // Text(
                    //   address.toString(),
                    //   softWrap: true,
                    //   style: Theme.of(context).textTheme.bodyMedium,
                    // ),
                  ],
                ),
              ),

              const SizedBox(width: TSizes.spaceBtwItems),

              // Right Side: Icons
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (selectedAddress)
                    Icon(
                      Iconsax.tick_circle5,
                      color: dark ? TColors.light : TColors.dark,
                    ),
                  const SizedBox(width: TSizes.sm),
                  IconButton(
                    icon: const Icon(Icons.delete, color: Colors.red),
                    onPressed: onDelete,
                    tooltip: 'Delete Address',
                    padding: EdgeInsets.zero,
                    constraints: const BoxConstraints(),
                  ),
                ],
              ),

              // Column(
              //   children: [
              //     if (selectedAddress)
              //       Icon(
              //         Iconsax.tick_circle5,
              //         color: dark ? TColors.light : TColors.dark,
              //       ),
              //     IconButton(
              //       icon: const Icon(Icons.delete, color: Colors.red),
              //       onPressed: onDelete,
              //       tooltip: 'Delete Address',
              //       padding: EdgeInsets.zero,
              //       constraints: const BoxConstraints(),
              //     ),
              //   ],
              // ),
            ],
          ),


          // child: Stack(
          //   children: [
          //     // Right-top: Tick icon and delete button in a column
          //     Positioned(
          //       right: 0,
          //       top: 0,
          //       child: Column(
          //         children: [
          //           Icon(
          //             selectedAddress ? Iconsax.tick_circle5 : null,
          //             color: selectedAddress
          //                 ? dark
          //                     ? TColors.light
          //                     : TColors.dark
          //                 : null,
          //           ),
          //           IconButton(
          //             icon: Icon(
          //               Icons.delete,
          //               color: Colors.red,
          //             ),
          //             onPressed: onDelete,
          //             tooltip: 'Delete Address',
          //             padding: EdgeInsets.zero,
          //             constraints: BoxConstraints(),
          //           ),
          //         ],
          //       ),
          //     ),
        
          //     Column(
          //       crossAxisAlignment: CrossAxisAlignment.start,
          //       children: [
          //         Text(
          //           address.name,
          //           maxLines: 2,
          //           overflow: TextOverflow.ellipsis,
          //           style: Theme.of(context).textTheme.titleLarge,
          //         ),
          //         const SizedBox(height:TSizes.sm/2),
          //         Text(address.formattedPhoneNo,maxLines: 1,overflow: TextOverflow.ellipsis),
          //         const SizedBox(height: TSizes.sm/2),
          //         Text(address.toString(),softWrap: true),
          //       ],
          //     )
          //   ],
          // ),
        ),
      );
      }
    );
  }
}