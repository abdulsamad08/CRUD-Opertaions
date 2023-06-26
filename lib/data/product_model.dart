class Product {
  int? id;
  String? name;
  String? description;
  double? price;
  int? quantity;
  String? category;

  Product({
    this.id,
    this.name,
    this.description,
    this.price,
    this.quantity,
    this.category,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      price: json['price'],
      quantity: json['quantity'],
      category: json['category'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'price': price,
      'quantity': quantity,
      'category': category,
    };
  }
}
