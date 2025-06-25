import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

void uploadDummyProducts() async {
  final firestore = FirebaseFirestore.instance;
    // for (int i = 14; i <= 54; i++) {
    final productId = '103'; // "014" ~ "054"

    final dummyProduct = {
      'Title': 'Dettol Antibacterial Body Wash Lasting Fresh 950g',
      'Stock': 66,
      'Price': 18.50,
      'IsFeatured': true,
      'Thumbnail': 'https://firebasestorage.googleapis.com/v0/b/ecommerceapp-87f00.firebasestorage.app/o/ProductImage%2FPersonal%20Care%2FBath%20Care%2FDettol%2Fdettol-fresh.png?alt=media&token=dd0752e9-c629-432c-9303-e00bfdabed69',
      'Brand': {
        'Id': 'B010',
        'Image': 'https://firebasestorage.googleapis.com/v0/b/ecommerceapp-87f00.firebasestorage.app/o/BrandLogo%2FDettol%2Fdettol-logo.png?alt=media&token=9be05064-07ef-400a-974c-85617c63d181',
        'Name': 'Dettol',
        'ProductsCount': 100,
        'IsFeatured': true
      },
      'Images': [
        'https://firebasestorage.googleapis.com/v0/b/ecommerceapp-87f00.firebasestorage.app/o/ProductImage%2FPersonal%20Care%2FBath%20Care%2FDettol%2Fdettol-fresh.png?alt=media&token=dd0752e9-c629-432c-9303-e00bfdabed69'
        
      ],
      'Description': 'Dettol Antibacterial Body Wash Lasting Fresh 950g combines Dettol’s trusted germ protection with crisp menthol to deliver up to 12 hours of odour protection, leaving your skin feeling clean, healthy, and refreshingly cool. For best results, apply a small amount onto a shower puff or your palm, lather onto the body, and rinse thoroughly with water.',
      'SalePrice':18.50,
      'SKU': 'Dettol SKU',
      'CategoryId': 'C014',
      'ProductType': 'ProductType.variable',
      'ProductAttributes': [
        {
          'Name': 'Size',
          'Values': ['950g']
        },
      ],
      'ProductVariations': [
        {
          'Id': '1',
          'Stock': 66,
          'Price':18.50,
          'SKU': '950g SKU',
          'SalePrice': 18.50,
          'Image': 'https://firebasestorage.googleapis.com/v0/b/ecommerceapp-87f00.firebasestorage.app/o/ProductImage%2FPersonal%20Care%2FBath%20Care%2FDettol%2Fdettol-fresh.png?alt=media&token=dd0752e9-c629-432c-9303-e00bfdabed69',
          'Description': 'Dettol Antibacterial Body Wash Lasting Fresh 950g combines Dettol’s trusted germ protection with crisp menthol to deliver up to 12 hours of odour protection, leaving your skin feeling clean, healthy, and refreshingly cool. For best results, apply a small amount onto a shower puff or your palm, lather onto the body, and rinse thoroughly with water.',
          'AttributeValues': {'Size': '950g'}
        },
         
      ]
    };

    await firestore.collection('Products').doc(productId).set(dummyProduct);
    debugPrint('✅ Uploaded dummy product with ID: $productId');
  }
// }
