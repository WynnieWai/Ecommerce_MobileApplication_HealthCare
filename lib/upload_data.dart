import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

void uploadDummyProducts() async {
  final firestore = FirebaseFirestore.instance;
    // for (int i = 14; i <= 54; i++) {
    final productId = '087'; // "014" ~ "054"

    final dummyProduct = {
      'Title': 'Dove Sakura Blossom Body Wash 1L',
      'Stock': 10,
      'Price': 27.50,
      'IsFeatured': true,
      'Thumbnail': 'https://firebasestorage.googleapis.com/v0/b/ecommerceapp-87f00.firebasestorage.app/o/ProductImage%2FPersonal%20Care%2FBath%20Care%2FDove%2Fdove-sakura.png?alt=media&token=35b8c5eb-6a2c-496f-a8d9-483e9883f5a2',
      'Brand': {
        'Id': 'B002',
        'Image': 'https://firebasestorage.googleapis.com/v0/b/ecommerceapp-87f00.firebasestorage.app/o/BrandLogo%2FDove%2Fdove-logo.jpg?alt=media&token=d5941392-2044-436d-86a5-f3dccca66e5d',
        'Name': 'Dove',
        'ProductsCount': 10,
        'IsFeatured': true
      },
      'Images': [
        'https://firebasestorage.googleapis.com/v0/b/ecommerceapp-87f00.firebasestorage.app/o/ProductImage%2FPersonal%20Care%2FBath%20Care%2FDove%2Fdove-sakura.png?alt=media&token=35b8c5eb-6a2c-496f-a8d9-483e9883f5a2'
        
      ],
      'Description': 'Dove Sakura Blossom Body Wash 1L is enriched with Japanese-style pinkish sakura and rice water essence to gently cleanse and deeply hydrate the skin. It leaves your skin feeling plump, tender, and subtly scented after each shower. The nourishing formula replenishes moisture, making it ideal for daily use. Simply pour into your hand, lather, massage over the body, and rinse off with water for soft, refreshed skin.',
      'SalePrice':27.50,
      'SKU': 'SKU087',
      'CategoryId': 'C014',
      'ProductType': 'ProductType.variable',
      'ProductAttributes': [
        {
          'Name': 'Size',
          'Values': ['1000ml']
        },
      ],
      'ProductVariations': [
        {
          'Id': '1',
          'Stock': 10,
          'Price':27.50,
          'SKU': '1000ml SKU',
          'SalePrice': 27.50,
          'Image': 'https://firebasestorage.googleapis.com/v0/b/ecommerceapp-87f00.firebasestorage.app/o/ProductImage%2FPersonal%20Care%2FBath%20Care%2FDove%2Fdove-sakura.png?alt=media&token=35b8c5eb-6a2c-496f-a8d9-483e9883f5a2',
          'AttributeValues': {'Size': '1000ml'}
        }
      ]
    };

    await firestore.collection('Products').doc(productId).set(dummyProduct);
    debugPrint('✅ Uploaded dummy product with ID: $productId');
  }
// }
