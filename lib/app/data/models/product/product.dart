class Product {
  final String id;
  final String name;
  final String category;
  final double price;
  final double rating;
  final String imageUrl;
  final String description;
  final bool isHot;
  final String subtotal;

  const Product({
    required this.id,
    required this.name,
    required this.category,
    required this.price,
    required this.rating,
    required this.imageUrl,
    required this.description,
    required this.subtotal,
    this.isHot = false,
  });
}