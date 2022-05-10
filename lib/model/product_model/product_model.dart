class ProductModel {
  final int id;
  final String name;
  final String modelNo;
  final double price;
  final double rating;
  final int ratingCount;
  final String description;
  final List<String> images;

  ProductModel({
    required this.id,
    required this.name,
    required this.modelNo,
    required this.price,
    required this.rating,
    required this.ratingCount,
    required this.description,
    required this.images,
  });
  static List<ProductModel> demoProducts = [
    ProductModel(
      id: 1,
      name: 'Studio 3 Wireless',
      modelNo: 'Mi-Cc-790',
      price: 369,
      rating: 3,
      ratingCount: 89,
      description:
      'Studio orem Ipsum is simply dummy text of the printing and typesetting industry. orem Ipsum is simply dummy text of the printing and typesetting industry.',
      images: [
        'assets/image/headphone1.png',
        'assets/image/headphone2.png',
        'assets/image/headphone3.png',
      ],
    ),
    ProductModel(
      id: 2,
      name: 'Studio 7 Wireless',
      modelNo: 'Tionic-G80',
      price: 299,
      rating: 4,
      ratingCount: 89,
      description:
      'Studio orem Ipsum is simply dummy text of the printing and typesetting industry. orem Ipsum is simply dummy text of the printing and typesetting industry.',
      images: [
        'assets/image/headphone2.png',
        'assets/image/headphone3.png',
        'assets/image/headphone1.png',
      ],
    ),
  ];

  static List<ProductModel> bestSelling = [
    ProductModel(
      id: 3,
      name: 'Studio 7 Wireless',
      modelNo: 'Tionic-G80',
      price: 299,
      rating: 4,
      ratingCount: 89,
      description:
      'Studio orem Ipsum is simply dummy text of the printing and typesetting industry. orem Ipsum is simply dummy text of the printing and typesetting industry.',
      images: [
        'assets/image/headphone1.png',
        'assets/image/headphone2.png',
        'assets/image/headphone3.png',
      ],
    ),
  ];
}



