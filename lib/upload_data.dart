import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

void uploadDummyProducts() async {
  final firestore = FirebaseFirestore.instance;
    // for (int i = 14; i <= 54; i++) {
    final productId = '083'; // "014" ~ "054"

    final dummyProduct = {
      'Title': 'Orita Gel Air Freshener Fresh Linen 170g',
      'Stock': 150,
      'Price': 6.30,
      'IsFeatured': true,
      'Thumbnail': 'https://firebasestorage.googleapis.com/v0/b/ecommerceapp-87f00.firebasestorage.app/o/ProductImage%2FHousehold%2FHouseholdSundries%2FOrita%2Forita-air-fresh.png?alt=media&token=f603e757-f394-459c-a9b4-0d6eb6d6738e',
      'Brand': {
        'Id': 'B033',
        'Image': 'https://firebasestorage.googleapis.com/v0/b/ecommerceapp-87f00.firebasestorage.app/o/BrandLogo%2FOrita%2Forita-logo.png?alt=media&token=b13550bc-ac02-44e7-968a-b4b3253a2b21',
        'Name': 'Orita',
        'ProductsCount': 150,
        'IsFeatured': true
      },
      'Images': [
        'https://firebasestorage.googleapis.com/v0/b/ecommerceapp-87f00.firebasestorage.app/o/ProductImage%2FHousehold%2FHouseholdSundries%2FOrita%2Forita-air-fresh.png?alt=media&token=f603e757-f394-459c-a9b4-0d6eb6d6738e'
        
      ],
      'Description': 'Orita Gel Air Freshener Fresh Linen 170g is a convenient and stylish way to freshen up your home with a clean, refreshing linen scent. Its spiral container design allows you to control the intensity of fragrance diffusion. To use, tear along the perforation, grip the top and bottom, then twist and lift to open. Ideal for use in bedrooms, bathrooms, or closets. Contains ingredients such as aqua, fragrance, and gelling agents. Do not ingest or apply to skin. Avoid eye contact, rinse thoroughly and seek medical advice if it occurs.',
      'SalePrice':6.30,
      'SKU': 'SKU083',
      'CategoryId': 'C027',
      'ProductType': 'ProductType.variable',
      'ProductAttributes': [
        {
          'Name': 'Size',
          'Values': ['170g']
        },
      ],
      'ProductVariations': [
        {
          'Id': '1',
          'Stock':150,
          'Price':6.30,
          'SKU': '170g SKU',
          'SalePrice': 6.30,
          'Image': 'https://firebasestorage.googleapis.com/v0/b/ecommerceapp-87f00.firebasestorage.app/o/ProductImage%2FHousehold%2FHouseholdSundries%2FOrita%2Forita-air-fresh.png?alt=media&token=f603e757-f394-459c-a9b4-0d6eb6d6738e',
          'AttributeValues': {'Size': '170g'}
        }
      ]
    };

    await firestore.collection('Products').doc(productId).set(dummyProduct);
    debugPrint('✅ Uploaded dummy product with ID: $productId');
  }
// }
