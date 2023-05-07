import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;

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
        title: const Text('Product List'),
        centerTitle: true,
        actions: [
          Center(
            child: badges.Badge(
              badgeContent: const Text('0', style: TextStyle(
                color: Colors.white,
              ),),
              badgeAnimation: const badges.BadgeAnimation.slide(animationDuration: Duration(milliseconds: 300)),
              position: badges.BadgePosition.topEnd(top: 0, end: 0),
              child: IconButton(
                icon: const Icon(Icons.shopping_bag_outlined),
                onPressed: () {},
              ),
            ),
          ),
          const SizedBox(width: 20.0,),
        ],



      ),
    );
  }
}
