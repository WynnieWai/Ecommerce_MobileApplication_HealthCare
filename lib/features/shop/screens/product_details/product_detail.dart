import 'package:flutter/material.dart';
import 'package:testing_asg1/common/widgets/custom_shapes/curved_edges/curved_edges_widget.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/helpers/helper_functions.dart';

class ProductDetailScreen extends StatelessWidget {
  const ProductDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            /// 1 - Product Image Slider
            TCurvedEdgeWidget(
              child: Container(
                color: dark ? TColors.darkerGrey : TColors.light,
                child: const Stack(
                  children: [
                    /// Main Large Image
                    SizedBox(child: Image(image: AssetImage(TImages.productImage1))),
                  ],
                ),
              ),
            ),

            /// 2 - Product Details
          ],
        ),
      ),
    );
  }
}