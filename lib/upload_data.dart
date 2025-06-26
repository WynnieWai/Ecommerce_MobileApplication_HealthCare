import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

void uploadDummyProducts() async {
  final firestore = FirebaseFirestore.instance;
    // for (int i = 14; i <= 54; i++) {
    final productId = '097'; // "014" ~ "054"

    final dummyProduct = {
      'Title': 'Alltest Vaginal Ph Rapid Test (Vaginal Discharge) 1s',
      'Stock': 100,
      'Price': 21.90,
      'IsFeatured': true,
      'Thumbnail': 'https://firebasestorage.googleapis.com/v0/b/ecommerceapp-87f00.firebasestorage.app/o/ProductImage%2FHealth%2FMedic%20Device%2FAll%20Test%2Falltest-vaginal.png?alt=media&token=5e0669ec-5841-4ed4-b475-a646f82a403d',
      'Brand': {
        'Id': 'B001',
        'Image': 'https://firebasestorage.googleapis.com/v0/b/ecommerceapp-87f00.firebasestorage.app/o/BrandLogo%2FAlltest%2Falltest-logo.jpg?alt=media&token=ea0fc21f-b3fb-4c80-be00-3342ad1f03bd',
        'Name': 'AllTest',
        'ProductsCount': 100,
        'IsFeatured': true
      },
      'Images': [
        'https://firebasestorage.googleapis.com/v0/b/ecommerceapp-87f00.firebasestorage.app/o/ProductImage%2FHealth%2FMedic%20Device%2FAll%20Test%2Falltest-vaginal.png?alt=media&token=5e0669ec-5841-4ed4-b475-a646f82a403d'
        
      ],
      'Description': 'The Alltest Vaginal pH Rapid Test is a quick and reliable dry chemical test designed to semi-quantitatively detect vaginal pH levels using a swab sample, aiding in the diagnosis of bacterial vaginosis. By measuring the pH of vaginal secretions, it helps distinguish between normal and abnormal pH levels, which can be indicative of infections. The test involves collecting a vaginal swab, applying the sample to the test panel, and comparing the resulting color change with a reference scale. Results should be read while the swab area is still moist for accuracy. It is essential to follow the instructions carefully for proper sample collection and handling.',
      'SalePrice':21.90,
      'SKU': 'All Test SKU',
      'CategoryId': 'C010',
      'ProductType': 'ProductType.variable',
      'ProductAttributes': [
        {
          'Name': 'Size',
          'Values': ['1 piece']
        },
      ],
      'ProductVariations': [
        {
          'Id': '1',
          'Stock': 100,
          'Price':21.90,
          'SKU': '1 piece SKU',
          'SalePrice': 21.90,
          'Image': 'https://firebasestorage.googleapis.com/v0/b/ecommerceapp-87f00.firebasestorage.app/o/ProductImage%2FHealth%2FMedic%20Device%2FAll%20Test%2Falltest-vaginal.png?alt=media&token=5e0669ec-5841-4ed4-b475-a646f82a403d',
          'AttributeValues': {'Size': '1 piece'}
        },
         
      ]
    };

    await firestore.collection('Products').doc(productId).set(dummyProduct);
    debugPrint('✅ Uploaded dummy product with ID: $productId');
  }
// }
