class ProductDetail {
  final int id;
  final String nama;
  final int harga;
  final String tipe;
  final String konten;
  final String lebar;
  final String gramasi;
  final String packing;
  final String deskripsi;
  final String imgUrl;

  ProductDetail({
    required this.id,
    required this.nama,
    required this.harga,
    required this.tipe,
    required this.konten,
    required this.lebar,
    required this.gramasi,
    required this.packing,
    required this.deskripsi,
    required this.imgUrl,
  });

  // Factory constructor to create a Product from JSON
  factory ProductDetail.fromJson(Map<String, dynamic> json) {
    return ProductDetail(
      id: json['id'] as int,
      nama: json['nama'] as String,
      harga: json['harga'] as int,
      tipe: json['tipe'] as String,
      konten: json['konten'] as String,
      lebar: json['lebar'] as String,
      gramasi: json['gramasi'] as String,
      packing: json['packing'] as String,
      deskripsi: json['deskripsi'] as String,
      imgUrl: json['img_url'] as String, // Maps img_url to camelCase
    );
  }

  // Convert Product instance back to JSON (Useful for POST/PUT requests)
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'nama': nama,
      'harga': harga,
      'tipe': tipe,
      'konten': konten,
      'lebar': lebar,
      'gramasi': gramasi,
      'packing': packing,
      'deskripsi': deskripsi,
      'img_url': imgUrl,
    };
  }
}