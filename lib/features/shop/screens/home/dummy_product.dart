import '../../../../utils/constants/image_strings.dart';

// class Product {
//   final String title;
//   final String brand;
//   final String price;
//   final String imageUrl;

//   Product({
//     required this.title,
//     required this.brand,
//     required this.price,
//     required this.imageUrl,
//   });
// }

class Product {
  final String id; // Add this for better identification
  final String title;
  final String brand;
  final String price;
  final String imageUrl;
  final bool isFavorite; // Optional: to track favorite status

  Product({
    required this.id,
    required this.title,
    required this.brand,
    required this.price,
    required this.imageUrl,
    this.isFavorite = false,
  });
}


final List<Product> products = [
  Product(
    id: '1',
    title: 'Green Nike Air Shoes',
    brand: 'Nike',
    price: '35.0',
    imageUrl: TImages.productImage80,
  ),
  Product(
    id: '2',
    title: 'Red Adidas Running Shoes',
    brand: 'Adidas',
    price: '45.0',
    imageUrl: TImages.productImage81,
  ),
  Product(
    id: '3',
    title: 'Blue Puma Sneakers',
    brand: 'Puma',
    price: '30.0',
    imageUrl: TImages.productImage82,
  ),
  Product(
    id: '4',
    title: 'Black Reebok Classics',
    brand: 'Reebok',
    price: '40.0',
    imageUrl: TImages.productImage83,
  ),
];

final List<Product> wishlistProducts = [
  Product(
    id: '1',
    title: 'Green Nike Air Shoes',
    brand: 'Nike',
    price: '35.0',
    imageUrl: TImages.productImage50,
  ),
  Product(
    id: '2',
    title: 'Red Adidas Running Shoes',
    brand: 'Adidas',
    price: '45.0',
    imageUrl: TImages.productImage51,
  ),
  Product(
    id: '3',
    title: 'Blue Puma Sneakers',
    brand: 'Puma',
    price: '30.0',
    imageUrl: TImages.productImage52,
  ),
  Product(
    id: '4',
    title: 'Black Reebok Classics',
    brand: 'Reebok',
    price: '40.0',
    imageUrl: TImages.productImage53,
  ),
];

// all_products & Sortable_products - using products

// Category_tab.dart
final Map<String, List<Product>> productsByCategory = {
  'Health': [
    Product(
      id: 'h1',
      title: 'Vitamin C Supplements',
      brand: 'HealthPlus',
      price: '12.99',
      imageUrl: TImages.productImage1, // Replace with actual image
    ),
    Product(
      id: 'h2',
      title: 'Protein Powder',
      brand: 'MuscleTech',
      price: '24.99',
      imageUrl: TImages.productImage2,
    ),
    // Add more health products...
  ],
  'Skin Care': [
    Product(
      id: 's1',
      title: 'Moisturizing Cream',
      brand: 'Cetaphil',
      price: '15.99',
      imageUrl: TImages.productImage3,
    ),
    Product(
      id: 's2',
      title: 'Sunscreen SPF 50',
      brand: 'Neutrogena',
      price: '12.49',
      imageUrl: TImages.productImage4,
    ),
    // Add more skin care products...
  ],
  'Personal Care': [
    Product(
      id: 'p1',
      title: 'Electric Toothbrush',
      brand: 'Oral-B',
      price: '39.99',
      imageUrl: TImages.productImage5,
    ),
    // Add more personal care products...
  ],
  'Hair Care': [
    Product(
      id: 'hc1',
      title: 'Shampoo for Dry Hair',
      brand: 'Pantene',
      price: '8.99',
      imageUrl: TImages.productImage6,
    ),
    // Add more hair care products...
  ],
  'Baby Care': [
    Product(
      id: 'b1',
      title: 'Baby Diapers',
      brand: 'Pampers',
      price: '19.99',
      imageUrl: TImages.productImage7,
    ),
    // Add more baby care products...
  ],
  'Household': [
    Product(
      id: 'hh1',
      title: 'Laundry Detergent',
      brand: 'Tide',
      price: '14.99',
      imageUrl: TImages.productImage8,
    ),
    // Add more household products...
  ],
};