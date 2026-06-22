class Product {
  final String id;
  final String name;
  final String price;
  final String img_url;

  Product({required this.id, required this.name, required this.price, required this.img_url});factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'].toString(),
      name: json['nama'],
      price: json['harga'].toString(),
      img_url: json['img_url'] ?? '',
    );
  }
}