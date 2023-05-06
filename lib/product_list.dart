import 'package:flutter/material.dart';
import 'package:badges/badges.dart';

class ProductListScreen extends StatefulWidget {
  const ProductListScreen({Key? key}) : super(key: key);

  @override
  State<ProductListScreen> createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Product List"),
        centerTitle: true,
        actions: [

          Icon(Icons.shopping_bag_outlined), SizedBox(width: 20.0,)

        ],
      ),
    );
  }
}
