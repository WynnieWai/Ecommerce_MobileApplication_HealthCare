import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:iconsax/iconsax.dart';
import 'package:testing_asg1/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:testing_asg1/features/shop/controllers/product/order_controller.dart';
import 'package:testing_asg1/navigation_menu.dart';
import 'package:testing_asg1/utils/constants/colors.dart';
import 'package:testing_asg1/utils/constants/image_strings.dart';
import 'package:testing_asg1/utils/constants/sizes.dart';
import 'package:testing_asg1/utils/helpers/cloud_helper_functions.dart';
import 'package:testing_asg1/utils/helpers/helper_functions.dart';
import 'package:testing_asg1/utils/loaders/animation_loader.dart';

class TOrderListItems extends StatelessWidget{
  const TOrderListItems({super.key});

  @override
  Widget build(BuildContext context){
    final controller =Get.put (OrderController());
    final dark=THelperFunctions.isDarkMode(context);
    
    return FutureBuilder(
      future: controller.fetchUserOrders(),
      builder: (_, snapshot) {
      // Nothing Found Widget
      final emptyWidget = TAnimationLoaderWidget(
        text: 'Whoops! No Orders Yet!',
        animation: TImages.orderCompletedAnimation,
        showAction: true,
        actionText: 'Let\'s fill it',
        onActionPressed: () => Get.off(() => const NavigationMenu()),
      );

      // Helper Function: Handle Loader, No Record, OR ERROR Message
      final response = TCloudHelperFunctions.checkMultiRecordState(snapshot: snapshot, nothingFound: emptyWidget);
      if (response != null) return response;

      // Congratulations! Record Found
      final orders = snapshot.data!;

        return ListView.separated(
          shrinkWrap: true,
          itemCount:orders.length,
          separatorBuilder: (_,index)=>const SizedBox(height:TSizes.spaceBtwItems),
          itemBuilder:(_,index){
          final order = orders[index];

          return TRoundedContainer(
            showBorder: true,
            padding: const EdgeInsets.all(TSizes.md),
            backgroundColor: THelperFunctions.isDarkMode(context) ? TColors.dark : TColors.light,

            //backgroundColor: dark?TColors.dark:TColors.light,

            child: Column(
            //  mainAxisSize: MainAxisSize.min,
              children: [
                // -- Row 1 Top Row
                Row(
                  children: [
                    // 1 - Icon
                    const Icon(Iconsax.ship),
                    const SizedBox(width: TSizes.spaceBtwItems/2),
          
                    // 2 - Status & Date
                    Expanded(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            order.orderStatusText,
                            overflow: TextOverflow.ellipsis,
                            style: Theme.of(context).textTheme.bodyLarge!.apply(color: TColors.primary,fontWeightDelta: 1),
                            ),
                          Text(order.formattedOrderDate,style: Theme.of(context).textTheme.headlineSmall),
                          //Text('07 Nov 2024',style: Theme.of(context).textTheme.headlineSmall),
                        ],
                      ),
                    ),
          
                    // 3 - Icon
                    IconButton(onPressed: (){}, icon: const Icon(Iconsax.arrow_right_34,size:TSizes.iconSm)),
                  ],
                ),
                const SizedBox(height: TSizes.spaceBtwItems),
          
                // Row 2
                Row(
                  children: [
                      Expanded(
                        child: Row(
                        children: [
                          // 1 - Icon
                          const Icon(Iconsax.tag),
                          const SizedBox(width: TSizes.spaceBtwItems/2),

                          //Order
                          Flexible(
                            child:Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children:[
                                Text(
                                  'Order',
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style:Theme.of(context).textTheme.labelMedium,
                                  
                                ),
                                Text(
                                  order.id,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style:Theme.of(context).textTheme.titleMedium,
                                ),

                              ],
                            )
                         )
                                      
                        //   // 2 - Status & Date
                        //   Expanded(
                        //     child: Column(
                        //       mainAxisSize: MainAxisSize.min,
                        //       crossAxisAlignment: CrossAxisAlignment.start,
                        //       children: [
                        //         Text(
                        //           'Order',
                        //           style: Theme.of(context).textTheme.labelMedium,
                        //           ),
                            
                        //         Text('[#256f2]',style: Theme.of(context).textTheme.titleMedium),
                        //       ],
                        //     ),
                        //   )
                        ], 
                      ),
                    ),

                    //Delivery Date
                    /// Delivery Date
                    Expanded(
                      child: Row(
                        children: [
                          // 1 - Icon
                          const Icon(Iconsax.calendar),
                          const SizedBox(width: TSizes.spaceBtwItems / 2),

                          /// Status & Date
                          Flexible(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Shipping Date',
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: Theme.of(context).textTheme.labelMedium,
                                ),
                                Text(
                                  order.formattedDeliveryDate,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: Theme.of(context).textTheme.titleMedium,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    )

                    // // 3 - Icon                          
          
                    // Expanded(
                    //   child: Row(
                    //     children: [
                    //       // 1 - Icon
                    //       const Icon(Iconsax.calendar),
                    //       const SizedBox(width: TSizes.spaceBtwItems/2),
                      
                    //       // 2 - Status & Date
                    //       Expanded(
                    //         child: Column(
                    //           mainAxisSize: MainAxisSize.min,
                    //           crossAxisAlignment: CrossAxisAlignment.start,
                    //           children: [
                    //             Text(
                    //               'Shipping Date',
                    //               style: Theme.of(context).textTheme.labelMedium,
                    //               ),
                            
                    //             Text('03 Feb 2025',style: Theme.of(context).textTheme.titleMedium),
                    //           ],
                    //         ),
                    //       )
                    //     ],
                    //   ),
                    // ),
                  ],
                )
              ],
            ),
          );
          }
        
        );
      }
    );
  }
}