class Product{
  final int id;
  final String name, details;
  final int price;
  final int vender;
  final image;

  Product(this.id, this.name, this.details, this.price, this.vender, this.image);

  Product.fromJson(Map<String, dynamic> json):
    id = json['id'],
    name = json['name'],
    details = json['details'],
    price = json['price'],
    vender = json['vender'],
    image = json['image'];

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'details': details,
    'price': price,
    'vender': vender,
    'image': image,
  };
  
}