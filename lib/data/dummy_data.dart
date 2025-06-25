
import '../features/shop/models/category_model.dart';
import '../utils/constants/image_strings.dart';

class TDummyData {
  // /// -- Banners
  // static final List<BannerModel> banners = [
  //   BannerModel(imageUrl: TImages.myBanner1, targetScreen: TRoutes.order, active: true),
  //   BannerModel(imageUrl: TImages.myBanner2, targetScreen: TRoutes.order, active: true),
  //   BannerModel(imageUrl: TImages.myBanner3, targetScreen: TRoutes.order, active: true),
  // ];

  /// -- User
  // static final UserModel user = UserModel(

  // );

  /// -- Cart
  // static final CartModel cart = CartModel();

  /// -- Order
  // static final List<OrderModel> orders = [];

  /// -- List of all Categories
  static final List<CategoryModel> categories = [
    CategoryModel(id: '1', name: 'Health', image: TImages.healthIcon, isFeatured: true),
    CategoryModel(id: '2', name: 'Skin Care', image: TImages.skinCareIcon, isFeatured: true),
    CategoryModel(id: '3', name: 'Personal Care', image: TImages.personalCareIcon, isFeatured: true),
    CategoryModel(id: '4', name: 'Hair Care', image: TImages.hairCareIcon, isFeatured: true),
    CategoryModel(id: '5', name: 'Baby Care', image: TImages.babyCareIcon, isFeatured: true),
    CategoryModel(id: '6', name: 'Household', image: TImages.houseHoldIcon, isFeatured: true),

    /// subcategories
    /// Health
    CategoryModel(id: '7', name: 'Health Supplements', image: TImages.healthIcon, parentId: '1', isFeatured: false),
    CategoryModel(id: '8', name: 'First Aid', image: TImages.healthIcon, parentId: '1', isFeatured: false),
    CategoryModel(id: '9', name: 'Home Health Care', image: TImages.healthIcon, parentId: '1', isFeatured: false),
    CategoryModel(id: '10', name: 'Over the Counter', image: TImages.healthIcon, parentId: '1', isFeatured: false),
    CategoryModel(id: '11', name: 'Medical Devices', image: TImages.healthIcon, parentId: '1', isFeatured: false),

    /// Skin Care
    CategoryModel(id: '12', name: 'Facial Care', image: TImages.skinCareIcon, parentId: '2', isFeatured: false),
    CategoryModel(id: '13', name: 'Hand & Body', image: TImages.skinCareIcon, parentId: '2', isFeatured: false),
    CategoryModel(id: '14', name: 'Sun Care', image: TImages.skinCareIcon, parentId: '2', isFeatured: false),

    /// Personal Care
    CategoryModel(id: '15', name: 'Bath Care', image: TImages.personalCareIcon, parentId: '3', isFeatured: false),
    CategoryModel(id: '16', name: 'Oral Care', image: TImages.personalCareIcon, parentId: '3', isFeatured: false),
    CategoryModel(id: '17', name: 'Feminine Hygiene', image: TImages.personalCareIcon, parentId: '3', isFeatured: false),
    CategoryModel(id: '18', name: 'Men\'s Grooming', image: TImages.personalCareIcon, parentId: '3', isFeatured: false),
    CategoryModel(id: '19', name: 'Deodorants', image: TImages.personalCareIcon, parentId: '3', isFeatured: false),

    /// Hair Care
    CategoryModel(id: '20', name: 'Shampoo', image: TImages.hairCareIcon, parentId: '4', isFeatured: false),
    CategoryModel(id: '21', name: 'Conditioner', image: TImages.hairCareIcon, parentId: '4', isFeatured: false),
    CategoryModel(id: '22', name: 'Hair Treatment', image: TImages.hairCareIcon, parentId: '4', isFeatured: false),
    CategoryModel(id: '23', name: 'Styling', image: TImages.hairCareIcon, parentId: '4', isFeatured: false),
    
    /// Baby Care
    CategoryModel(id: '24', name: 'Baby Bath and Hair', image: TImages.babyCareIcon, parentId: '5', isFeatured: false),
    CategoryModel(id: '25', name: 'Baby Skin Care', image: TImages.babyCareIcon, parentId: '5', isFeatured: false),
    CategoryModel(id: '26', name: 'Baby Diapers', image: TImages.babyCareIcon, parentId: '5', isFeatured: false),
    CategoryModel(id: '27', name: 'Baby Food', image: TImages.babyCareIcon, parentId: '5', isFeatured: false),

    /// Household
    CategoryModel(id: '28', name: 'Cleaning', image: TImages.houseHoldIcon, parentId: '6', isFeatured: false),
    CategoryModel(id: '29', name: 'Bathroom', image: TImages.houseHoldIcon, parentId: '6', isFeatured: false),
    CategoryModel(id: '30', name: 'Household Sundries', image: TImages.houseHoldIcon, parentId: '6', isFeatured: false),
  ];

  /// -- List of all Products
  // static final List<ProductModel> products = [
  //   ProductModel(
  //     id: '001',
  //     title: 'Green Nike sports shoe',
  //     stock: 15,
  //     price: 135,
  //     isFeatured: true,
  //     thumbnail: TImages.productImage1,
  //     description: 'Green Nike sports shoe',
  //     brand: BrandModel(id: '1', image: TImages.nikeLogo, name: 'Nike', productsCount: 265, isFeatured: true),
  //     images: [TImages.productImage1, TImages.productImage23, TImages.productImage21, TImages.productImage9],
  //     salePrice: 30,
  //     sku: 'ABR4568',
  //     categoryId: '1',
  //     productType: 'Shoes',
  //     productAttributes: [
  //       ProductAttributeModel(name: 'Color', values: ['Green', 'Black', 'Red']),
  //       ProductAttributeModel(name: 'Size', values: ['EU 30', 'EU 32', 'EU 34']),
  //     ],
  //     productVariations: [
  //       ProductVariationModel(
  //         id: '1',
  //         stock: 34,
  //         price: 134,
  //         salePrice: 122.6,
  //         image: TImages.productImage1,
  //         description: 'This is a Product description for Green Nike sports shoe.',
  //         attributeValues: {'Color': 'Green', 'Size': 'EU 34'},
  //       ),
  //       ProductVariationModel(
  //         id: '2',
  //         stock: 15,
  //         price: 132,
  //         image: TImages.productImage23,
  //         attributeValues: {'Color': 'Black', 'Size': 'EU 32'},
  //       ),
  //       ProductVariationModel(
  //         id: '3',
  //         stock: 0,
  //         price: 234,
  //         image: TImages.productImage23,
  //         attributeValues: {'Color': 'Black', 'Size': 'EU 34'},
  //       ),
  //       ProductVariationModel(
  //         id: '4',
  //         stock: 222,
  //         price: 232,
  //         image: TImages.productImage1,
  //         attributeValues: {'Color': 'Green', 'Size': 'EU 32'},
  //       ),
  //     ],

      
  //   ),
  // ];
}