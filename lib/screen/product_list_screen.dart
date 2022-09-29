import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_bloc/bloc/common_bloc.dart';
import 'package:test_bloc/bloc/product_bloc.dart';

class ProductListScreen extends StatefulWidget {
  const ProductListScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<ProductListScreen> createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  @override
  void initState() {
    super.initState();
    context.read<ProductBloc>().add(GetProductsEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Shops"),
      ),
      body: BlocConsumer<ProductBloc, MyState>(
        listener: (context, state) {
          if (state is StateError) {
            print('StateError: $state');
          }
        },
        builder: (context, state) {
          if (state is StateLoading) {
            return Center(
              child: Column(
                children: [
                  const CircularProgressIndicator(
                    color: Colors.black45,
                  ),
                  Text(state.toString())
                ],
              ),
            );
          } else if (state is GetProductsStateSuccess) {
            return ListView.builder(
              itemCount: state.products.length,
              itemBuilder: ((context, index) => ListTile(
                    title: Text(state.products[index].title),
                    subtitle: Text('Price ${state.products[index].price}'),
                    leading: Image.network(
                      state.products[index].thumbnail,
                      fit: BoxFit.cover,
                      width: 100.00,
                      height: 100.00,
                    ),
                  )),
            );
          } else {
            return const Text('Something went wrong');
          }
        },
      ),
    );
  }
}
