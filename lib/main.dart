import 'package:flutter/material.dart';
import 'package:test_bloc/bloc/product_bloc.dart';

import 'screen/product_list_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() => runApp(const MainApp());

class MainApp extends StatelessWidget {
  const MainApp({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProductBloc(),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Shop",
        home: ProductListScreen(),
      ),
    );
  }
}
