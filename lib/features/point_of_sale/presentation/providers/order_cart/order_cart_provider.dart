
import 'package:flutter_template/features/point_of_sale/domain/entities/product_entity.dart';
import 'package:flutter_template/features/point_of_sale/presentation/providers/order_cart/order_cart_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'order_cart_provider.g.dart';

@Riverpod(keepAlive: true)
class OrderCart extends _$OrderCart {

  @override
  OrderCartState build(){

    return OrderCartState();

  }

  void addProduct({required ProductEntity product}) {

    final updatedMap = Map<int, ProductEntity>.from(state.productList);
    updatedMap[product.id] = product; 
    state = state.copyWith(productList: updatedMap);

  }

  void removeProduct({required ProductEntity product}) {

    final updatedMap = Map<int, ProductEntity>.from(state.productList);
    updatedMap.remove(product.id); 
    state = state.copyWith(productList: updatedMap);

  }

  void updateProductQuantity({required ProductEntity product, required int quantity}) {

    final updatedMap = Map<int, ProductEntity>.from(state.productList);
    final updatedProduct = product.copyWith(quantity: quantity);
    updatedMap[product.id] = updatedProduct;
    state = state.copyWith(productList: updatedMap);
    
  }
  
  void cleanOrder(){

    state = state.copyWith(
      productList: {}
    );

  }
}