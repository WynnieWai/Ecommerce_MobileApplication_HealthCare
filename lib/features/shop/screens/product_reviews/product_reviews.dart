import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:iconsax/iconsax.dart';
import 'package:testing_asg1/common/widgets/appbar/appbar.dart';
import 'package:testing_asg1/common/widgets/products/ratings/rating_indicator.dart';
import 'package:testing_asg1/features/shop/screens/product_reviews/widgets/progress_indicator_and_rating.dart';
import 'package:testing_asg1/features/shop/screens/product_reviews/widgets/rating_progress_indicator.dart';
import 'package:testing_asg1/features/shop/screens/product_reviews/widgets/user_review_card.dart';
import 'package:testing_asg1/utils/constants/colors.dart';
import 'package:testing_asg1/utils/constants/sizes.dart';
import 'package:testing_asg1/utils/device/device_utility.dart';

class ProductReviewsScreen extends StatelessWidget {
  const ProductReviewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /// -- Appbar
      appBar: TAppBar(title: Text('Reviews & Ratings'), showBackArrow: true),
      
      /// -- Body
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Ratings and reviews are verified and are from people who use the same type of device that you use."),
              SizedBox(height: TSizes.spaceBtwItems),

              /// Overall Product Ratings 
              const TOverallProductRating(),
              const TRatingBarIndicator(rating: 3.5),
              Text("12,611", style: Theme.of(context).textTheme.bodySmall),
              const SizedBox(height: TSizes.spaceBtwItems),

              /// User Reviews List 
              const UserReviewCard(),
              const UserReviewCard(),
              const UserReviewCard(),
              const UserReviewCard(),
            ],
          ),
        ),
      ),
    );
  }
}



