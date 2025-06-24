import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

void uploadDummyProducts() async {
  final firestore = FirebaseFirestore.instance;
    // for (int i = 14; i <= 54; i++) {
    final productId = '056'; // "014" ~ "054"

    final dummyProduct = {
      'Title': 'Pantene No Rinse Conditioner Perfect On Instasmooth (40ml x 12)',
      'Stock': 20,
      'Price': 64.50,
      'IsFeatured': true,
      'Thumbnail': 'https://firebasestorage.googleapis.com/v0/b/ecommerceapp-87f00.firebasestorage.app/o/ProductImage%2FHair%20Care%2FHair%20Treatment%2FPantene%2Fpantene-hair-treatment.png?alt=media&token=e8e04586-3b63-494f-85f1-468dba094e1b',
      'Brand': {
        'Id': 'B035',
        'Image': 'https://firebasestorage.googleapis.com/v0/b/ecommerceapp-87f00.firebasestorage.app/o/BrandLogo%2FPantene%2Fpantene-logo.png?alt=media&token=ad9eb46f-9ad0-40d3-987c-2d49d19cf0ed',
        'Name': 'Pantene',
        'ProductsCount': 88,
        'IsFeatured': true
      },
      'Images': [
        'https://firebasestorage.googleapis.com/v0/b/ecommerceapp-87f00.firebasestorage.app/o/ProductImage%2FHair%20Care%2FHair%20Treatment%2FPantene%2Fpantene-hair-treatment.png?alt=media&token=e8e04586-3b63-494f-85f1-468dba094e1b'
        
      ],
      'Description': 'Pantene No Rinse Conditioner Perfect On Instasmooth (40ml x 12) is a lightweight, leave-in conditioner designed for instant smoothness and all-day protection. Infused with Collagen Repair & Smooth technology, it helps tame flyaways, reduce frizz, and keep hair soft and manageable. Ideal for use on damp hair at home before brushing or as an on-the-go touch-up. Use just one coin-sized drop (2ml) per application, applying from mid-length to ends while avoiding the scalp. Not a toy—keep out of reach of children.',
      'SalePrice':64.50,
      'SKU': 'SKU056',
      'CategoryId': 'C019',
      'ProductType': 'ProductType.variable',
      'ProductAttributes': [
        {
          'Name': 'Size',
          'Values': ['12 packs']
        },
      ],
      'ProductVariations': [
        {
          'Id': '1',
          'Stock': 88,
          'Price':64.50,
          'SKU': '12packs SKU',
          'SalePrice': 64.50,
          'Image': 'https://firebasestorage.googleapis.com/v0/b/ecommerceapp-87f00.firebasestorage.app/o/ProductImage%2FHair%20Care%2FHair%20Treatment%2FPantene%2Fpantene-hair-treatment.png?alt=media&token=e8e04586-3b63-494f-85f1-468dba094e1b',
          'Description': 'Pantene No Rinse Conditioner Perfect On Instasmooth (40ml x 12) is a lightweight, leave-in conditioner designed for instant smoothness and all-day protection. Infused with Collagen Repair & Smooth technology, it helps tame flyaways, reduce frizz, and keep hair soft and manageable. Ideal for use on damp hair at home before brushing or as an on-the-go touch-up. Use just one coin-sized drop (2ml) per application, applying from mid-length to ends while avoiding the scalp. Not a toy—keep out of reach of children.',
          'AttributeValues': {'Size': '12 packs'}
        },
         
      ]
    };

    await firestore.collection('Products').doc(productId).set(dummyProduct);
    debugPrint('✅ Uploaded dummy product with ID: $productId');
  }
// }
