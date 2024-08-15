class Cart {
  final int? id;
  final String? productId;
  final String? productName;
  final int? initialPrice;
  final int? productPrice;
  late final int? quantity;
  final String? image;

  Cart({
    this.id,
    required this.productId,
    required this.productName,
    required this.initialPrice,
    required this.productPrice,
    required this.quantity,
    required this.image,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'productId': productId,
      'productName': productName,
      'initialPrice': initialPrice,
      'productPrice': productPrice,
      'quantity': quantity,
      'image': image,
    };
  }

  factory Cart.fromMap(Map<String, dynamic> map) {
    return Cart(
      id: map['id'],
      productId: map['productId'],
      productName: map['productName'],
      initialPrice: map['initialPrice'],
      productPrice: map['productPrice'],
      quantity: map['quantity'],
      image: map['image'],
    );
  }
}
