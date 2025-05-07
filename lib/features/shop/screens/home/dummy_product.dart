import '../../../../utils/constants/image_strings.dart';

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
    title: 'Cetaphil Baby Wash & Shampoo 230ml',
    brand: 'Cetaphil',
    price: '38.96',
    imageUrl: TImages.productImage4,
    isFavorite: true
  ),
  Product(
    id: '2',
    title: 'Pantene Pro-Vitamin Conditioner Silky Smooth 300ml',
    brand: 'Pantene',
    price: '11.92',
    imageUrl: TImages.productImage26,
    isFavorite: false,
  ),
  Product(
    id: '3',
    title: 'Vitahealth Vitamin D3 1000Iu 60\'s + 30\'s',
    brand: 'Vitahealth',
    price: '60.90',
    imageUrl: TImages.productImage57,
    isFavorite: true,
  ),
  Product(
    id: '4',
    title: 'Vicks Vaporub 50g',
    brand: 'Vicks',
    price: '17.50',
    imageUrl: TImages.productImage86,
  ),
];

final List<Product> wishlistProducts = [
  Product(
    id: '1',
    title: 'Cetaphil Baby Wash & Shampoo 230ml',
    brand: 'Cetaphil',
    price: '38.96',
    imageUrl: TImages.productImage4,
    isFavorite: true
  ),
  Product(
    id: '2',
    title: 'Vitahealth Vitamin D3 1000Iu 60\'s + 30\'s',
    brand: 'Vitahealth',
    price: '60.90',
    imageUrl: TImages.productImage57,
    isFavorite: true,
  ),
  Product(
    id: '3',
    title: 'Darlie Double Action Fresh + Clean Toothpaste Original Strong Mint 175g',
    brand: 'Darlie',
    price: '11.69',
    imageUrl: TImages.productImage109,
    isFavorite: true,
  ),
  Product(
    id: '4',
    title: 'Simple Kind To Skin Soothing Toner 200ml',
    brand: 'Simple',
    price: '14.16',
    imageUrl: TImages.productImage118,
    isFavorite: true,
  ),
  Product(
    id: '5',
    title: 'Cetaphil Baby Daily Lotion 400ml',
    brand: 'Cetaphil',
    price: '77.77',
    imageUrl: TImages.productImage23,
    isFavorite: true,
  ),
  Product(
    id: '6',
    title: 'ORITA Baking Soda Laundry Detergent',
    brand: 'Orita',
    price: '20.90',
    imageUrl: TImages.productImage144,
    isFavorite: true,
  ),
  Product(
    id: '7',
    title: 'L\'Oreal Elseve Total Repair 5 Mask 200ml',
    brand: 'L\'Oreal',
    price: '31.20',
    imageUrl: TImages.productImage35,
    isFavorite: true,
  ),
];


final Map<String, List<Product>> productsByCategory = {
  'Health': [
    Product(
      id: 'h1',
      title: 'Koolfever Cooling Gel For Children 6s + 2s',
      brand: 'Koolfever',
      price: '16.60',
      imageUrl: TImages.productImage51, // Replace with actual image
    ),
    Product(
      id: 'h2',
      title: 'Vitahealth Vitamin D3 1000Iu 60\'s + 30\'s',
      brand: 'Vitahealth',
      price: '60.90',
      imageUrl: TImages.productImage57,
      isFavorite: true,
    ),
    Product(
      id: 'h3',
      title: 'Ebene Bio-Ray Knee Guard With Tourmaline Xl (1 PairBeige Colour)',
      brand: 'Ebene',
      price: '131.25',
      imageUrl: TImages.productImage67,
      isFavorite: false,
    ),
    Product(
      id: 'h4',
      title: 'Alltest Covid 19 Antigen Rapid Test (Box)',
      brand: 'Alltest',
      price: '3.50',
      imageUrl: TImages.productImage80,
      isFavorite: false,
    ),
    Product(
      id: 'h5',
      title: 'PANADOL Soluble Paracetamol Pain Relief 500mg 20S Effervescent Tablet',
      brand: 'Panadol',
      price: '17.10',
      imageUrl: TImages.productImage88,
      isFavorite: false,
    ),
    Product(
      id: 'h6',
      title: 'Vicks Vaporub 50g',
      brand: 'Vicks',
      price: '17.50',
      imageUrl: TImages.productImage86,
    ),
    // Add more health products...
  ],
  'Skin Care': [
    Product(
      id: 's1',
      title: 'Simple Kind To Skin Soothing Toner 200ml',
      brand: 'Simple',
      price: '14.16',
      imageUrl: TImages.productImage118,
      isFavorite: true,
    ),
    Product(
      id: 's2',
      title: 'Rosken Dry Skin Lotion 75ml x 2',
      brand: 'Rosken',
      price: '23.60',
      imageUrl: TImages.productImage129,
    ),
    Product(
      id: 's3',
      title: 'Clinelle Uv Defense Spf50 Pa+++ 30ml',
      brand: 'Cinelle',
      price: '30.54',
      imageUrl: TImages.productImage134,
    ),
    // Add more skin care products...
  ],
  'Personal Care': [
    Product(
      id: 'p1',
      title: 'Lifebuoy Activ Fresh Antibacterial Handwash 200ml',
      brand: 'Lifebuoy',
      price: '4.83',
      imageUrl: TImages.productImage93,
    ),
    Product(
      id: 'p2',
      title: 'Salt Of The Earth Natural Deodorant Spray Unscented 100ml',
      brand: 'Salt of The Earth',
      price: '31.28',
      imageUrl: TImages.productImage100,
    ),
    Product(
      id: 'p3',
      title: 'Cosmoderm Licorice Feminine Hygiene Wash 375ml',
      brand: 'Cosmoderm',
      price: '16.15',
      imageUrl: TImages.productImage102,
    ),
    Product(
      id: 'p4',
      title: 'Darlie Double Action Fresh + Clean Toothpaste Original Strong Mint 175g',
      brand: 'Darlie',
      price: '11.69',
      imageUrl: TImages.productImage109,
      isFavorite: true,
    ),
    // Add more personal care products...
  ],
  'Hair Care': [
    Product(
      id: 'hc1',
      title: 'Pantene Pro-Vitamin Conditioner Silky Smooth 300ml',
      brand: 'Pantene',
      price: '11.92',
      imageUrl: TImages.productImage26,
      isFavorite: false,
    ),
    Product(
      id: 'hc2',
      title: 'L\'Oreal Elseve Total Repair 5 Mask 200ml',
      brand: 'L\'Oreal',
      price: '31.20',
      imageUrl: TImages.productImage35,
      isFavorite: true,
    ),
    Product(
      id: 'hc3',
      title: 'Head & Shoulder Shampoo Clean & Balance 300ml',
      brand: 'Head & Shoulder',
      price: '20.90',
      imageUrl: TImages.productImage39,
      isFavorite: false,
    ),
    Product(
      id: 'hc4',
      title: 'Gatsby Set & Keep Spray Super Hard 180g',
      brand: 'Gatsby',
      price: '20.90',
      imageUrl: TImages.productImage44,
      isFavorite: false,
    ),
    // Add more hair care products...
  ],
  'Baby Care': [
    Product(
      id: 'b1',
      title: 'Cetaphil Baby Wash & Shampoo 230ml',
      brand: 'Cetaphil',
      price: '38.96',
      imageUrl: TImages.productImage4,
      isFavorite: true
    ),
    Product(
      id: 'b2',
      title: 'Drypers Wee Wee Dry S (8X22S) G13',
      brand: 'Drypers',
      price: '17.90',
      imageUrl: TImages.productImage10,
      isFavorite: false,
    ),
    Product(
      id: 'b3',
      title: 'Wunderbaby Freeze Dried Banana 20G',
      brand: 'Drypers',
      price: '11.83',
      imageUrl: TImages.productImage14,
      isFavorite: false,
    ),
    Product(
      id: 'b4',
      title: 'Cetaphil Baby Daily Lotion 400ml',
      brand: 'Cetaphil',
      price: '77.77',
      imageUrl: TImages.productImage23,
      isFavorite: true,
    ),
    // Add more baby care products...
  ],
  'Household': [
    Product(
      id: 'hh1',
      title: 'Ambi Pur Gel Fresh Lavender 180G X 2 Twin Pack',
      brand: 'Ambi Pur',
      price: '16.93',
      imageUrl: TImages.productImage139,
    ),
    Product(
      id: 'hh2',
      title: 'ORITA Charcoal Dehumidifier 3X800ml',
      brand: 'Orita',
      price: '10.43',
      imageUrl: TImages.productImage153,
    ),
    Product(
      id: 'hh3',
      title: 'ORITA Baking Soda Laundry Detergent',
      brand: 'Orita',
      price: '20.90',
      imageUrl: TImages.productImage144,
      isFavorite: true,
    ),
    // Add more household products...
  ],
};
