class Product {
  final String id;
  final String name;
  final String price;
  final String imgUrl;

  Product({required this.id, required this.name, required this.price, required this.imgUrl});factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'].toString(),
      name: json['nama'],
      price: json['harga'].toString(),
      imgUrl: json['img_url'] ?? '',
    );
  }
}