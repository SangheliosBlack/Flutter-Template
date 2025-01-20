import 'package:flutter_template/features/point_of_sale/domain/entities/entities.dart';

class OrderCartState {
  
  final Map<int, ProductEntity> productList;

  OrderCartState({this.productList = const {}});

  OrderCartState addProduct(ProductEntity product) {
    final updatedMap = Map<int, ProductEntity>.from(productList);
    updatedMap[product.id] = product;
    return copyWith(productList: updatedMap);
  }

  OrderCartState removeProduct(int productId) {
    final updatedMap = Map<int, ProductEntity>.from(productList);
    updatedMap.remove(productId);
    return copyWith(productList: updatedMap);
  }

  bool isProductInCart(int productId) {
    return productList.containsKey(productId);
  }

  int getProductQuantity(int productId) {
    return productList[productId]?.quantity ?? 0;
  }

  double calculateTotalAmount() {
    return productList.values.fold(
      0.0,
      (sum, product) => sum + (product.pricePf * product.quantity),
    );
  }

  OrderCartState copyWith({
    Map<int, ProductEntity>? productList
  }) {
    return OrderCartState(
      productList: productList ?? this.productList
    );
  }

  

}