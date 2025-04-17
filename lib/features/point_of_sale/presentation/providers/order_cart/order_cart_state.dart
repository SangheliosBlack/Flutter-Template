import 'package:flutter_template/core/core.dart';
import 'package:flutter_template/features/clients/domain/entities/client_entity.dart';
import 'package:flutter_template/features/point_of_sale/domain/entities/entities.dart';
import 'package:nullable_absent/nullable_absent.dart';

class OrderCartState {
  
  final Map<int, ProductEntity> productList;
  final bool deliveyAdded;
  final ClientEntity? clientSelected;

  OrderCartState({
    this.productList = const {},
    this.deliveyAdded = false,
    this.clientSelected 
  });

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

    return (deliveyAdded ? 30 : 0) +  productList.values.fold(
      0.0,
      (sum, product) => sum + (product.pricePf * product.quantity),
    );
  }

  OrderCartState copyWith({
    Map<int, ProductEntity>? productList,
    bool? deliveyAdded,
    NullableAbsent<ClientEntity> clientSelected = const NullableAbsent.absent(),
  }) {
    return OrderCartState(
      productList: productList ?? this.productList,
      deliveyAdded: deliveyAdded ?? this.deliveyAdded,
      clientSelected: NullableAbsent(this.clientSelected).apply(clientSelected),
    );
  } 

}


