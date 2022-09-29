class ProductResponse {
  List<Product> products;
  ProductResponse({required this.products});

  factory ProductResponse.fromJson(Map<String, dynamic> json) =>
      ProductResponse(products: json['products']);
}

class Product {
  int id;
  String title;
  double price;
  String thumbnail;

  Product(
      {required this.id,
      required this.title,
      required this.price,
      required this.thumbnail});

  factory Product.fromJson(Map<String, dynamic> json) => Product(
      id: json['id'],
      title: json['title'],
      price: double.parse(json['price'].toString()),
      thumbnail: json['thumbnail']);
}
