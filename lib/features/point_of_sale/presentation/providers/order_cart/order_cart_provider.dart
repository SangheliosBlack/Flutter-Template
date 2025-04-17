
import 'package:flutter_template/core/core.dart';
import 'package:flutter_template/core/utils/extensions/to_nullable.dart';
import 'package:flutter_template/features/clients/domain/entities/client_entity.dart';
import 'package:flutter_template/features/point_of_sale/domain/entities/product_entity.dart';
import 'package:flutter_template/features/point_of_sale/presentation/providers/order_cart/order_cart_state.dart';
import 'package:nullable_absent/nullable_absent.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'order_cart_provider.g.dart';

@Riverpod(keepAlive: true)
class OrderCart extends _$OrderCart {

  @override
  OrderCartState build(){

    return OrderCartState();

  }

    void setClient({required ClientEntity client}) {

      state = state.copyWith(clientSelected: NullableAbsent(client));


    }

    void removeClient() {

      state = state.copyWith(clientSelected: NullableAbsent(null));

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

  void updateDeliveryAdded(){

    final lastValue = state.deliveyAdded;

    state = state.copyWith(
      deliveyAdded: !lastValue
    );

  }
  
  void cleanOrder(){

    state = state.copyWith(
      productList: {}
    );

  }
}