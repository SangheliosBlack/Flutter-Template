class ProductEntity {

  String sku;
  int id;
  String description;
  String name;
  bool hasParciality;
  double pricePf;
  String imgUrl;
  int quantity;

  ProductEntity({
    required this.sku,
    required this.id,
    required this.description,
    required this.hasParciality,
    required this.pricePf,
    required this.imgUrl,
    required this.quantity,
    required this.name
  });

  double get subTotal{

    return (pricePf * quantity);

  }

  ProductEntity copyWith({
    String? sku,
    int? id,
    String? description,
    String? name,
    bool? hasParciality,
    double? pricePf,
    String? imgUrl,
    int? quantity
  }) {
    return ProductEntity(
      sku: sku ?? this.sku,
      id: id ?? this.id,
      description: description ?? this.description,
      name: name ?? this.name,
      hasParciality: hasParciality ?? this.hasParciality,
      pricePf: pricePf ?? this.pricePf,
      imgUrl: imgUrl ?? this.imgUrl,
      quantity : quantity ?? this.quantity
    );
  }

}
