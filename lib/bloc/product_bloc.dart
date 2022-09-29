import 'dart:convert';
import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../model/product.dart';
import 'common_bloc.dart';
import 'package:http/http.dart' as http;

class ProductBloc extends Bloc<MyEvent, MyState> {
  ProductBloc() : super(StateInitialized()) {
    on<GetProductsEvent>(_onGetProducts);
  }

  void _onGetProducts(GetProductsEvent event, Emitter<MyState> emit) async {
    emit(StateLoading());

    final res = await http.get(
      Uri.parse("https://dummyjson.com/products"),
    );

    if (res.statusCode != HttpStatus.ok) {
      emit(StateError(message: res.body));
      return;
    }

    final json = jsonDecode(utf8.decode(res.bodyBytes));
    final products = (json['products'] as List).map((e) {
      return Product.fromJson(e);
    }).toList();

    emit(GetProductsStateSuccess(products: products));
  }
}

class GetProductsEvent extends MyEvent {}

class GetProductsStateSuccess extends MyState {
  List<Product> products;
  GetProductsStateSuccess({required this.products});
}
