import 'package:chapter_13/cart_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:badges/badges.dart' as badges;

import 'cart_model.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Products'),
        centerTitle: true,
        actions: [
          Center(
            child: badges.Badge(
              badgeContent: Consumer<CartProvider>(
                builder: (context, value, child) {
                  return Text(
                    value.getCounter().toString(),
                    style: const TextStyle(
                      color: Colors.white,
                    ),
                  );
                },
              ),
              badgeAnimation: const badges.BadgeAnimation.slide(
                  animationDuration: Duration(milliseconds: 300)),
              position: badges.BadgePosition.topEnd(top: 0, end: 0),
              child: IconButton(
                icon: const Icon(Icons.shopping_bag_outlined),
                onPressed: () {},
              ),
            ),
          ),
          const SizedBox(
            width: 20.0,
          ),
        ],
      ),
      body: Column(
        children: [
          FutureBuilder(
              future: cart.getData(),
              builder: (context, AsyncSnapshot<List<Cart>> snapshot) {
                if (snapshot.hasData) {
                  return Expanded(
                      child: ListView.builder(
                    itemCount: snapshot.data?.length,
                    itemBuilder: (context, index) {
                      return Card(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Image(
                                      height: 100,
                                      width: 100,
                                      image: NetworkImage(snapshot
                                          .data![index].image
                                          .toString())),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Expanded(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          snapshot.data![index].productName
                                              .toString(),
                                          style: const TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w500),
                                        ),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        Text(
                                          snapshot.data![index].unitTag
                                                  .toString() +
                                              " " +
                                              r"$" +
                                              snapshot.data![index].productPrice
                                                  .toString(),
                                          style: const TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w500),
                                        ),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        Align(
                                          alignment: Alignment.centerRight,
                                          child: InkWell(
                                              child: Container(
                                                height: 35,
                                                width: 100,
                                                decoration: BoxDecoration(
                                                    color: Colors.green,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5)),
                                                child: const Center(
                                                  child: Text(
                                                    'Add to cart',
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              onTap: () {}),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      );
                    },
                  ));
                }
              })
        ],
      ),
    );
  }
}


// import 'package:badges/badges.dart' as badges;
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'cart_model.dart';
// import 'cart_provider.dart';
// import 'db_helper.dart';
//
//
// class CartScreen extends StatefulWidget {
//   const CartScreen({Key? key}) : super(key: key);
//
//   @override
//   _CartScreenState createState() => _CartScreenState();
// }
//
// class _CartScreenState extends State<CartScreen> {
//
//   DBHelper? dbHelper = DBHelper();
//
//   @override
//   Widget build(BuildContext context) {
//     final cart  = Provider.of<CartProvider>(context);
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Shopping Cart'),
//         centerTitle: true,
//         actions: [
//           Center(
//           child: badges.Badge(
//               badgeContent: Consumer<CartProvider>(
//                 builder: (context, value, child) {
//                   return Text(
//                     value.getCounter().toString(),
//                     style: const TextStyle(
//                       color: Colors.white,
//                     ),
//                   );
//                 },
//               ),
//               badgeAnimation: const badges.BadgeAnimation.slide(
//                   animationDuration: Duration(milliseconds: 300)),
//               position: badges.BadgePosition.topEnd(top: 0, end: 0),
//               child: IconButton(
//                 icon: const Icon(Icons.shopping_bag_outlined),
//                 onPressed: () {},
//               ),
//             ),
//           ),
//           const SizedBox(width: 20.0)
//         ],
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(10.0),
//         child: Column(
//           children: [
//             FutureBuilder(
//                 future:cart.getData() ,
//                 builder: (context , AsyncSnapshot<List<Cart>> snapshot){
//                   if(snapshot.hasData){
//
//                     if(snapshot.data!.isEmpty){
//                       return Align(
//                         alignment: Alignment.center,
//                         child: Column(
//                           children: [
//                             const Image(
//                               image: AssetImage('images/empty_cart.png'),
//                             ),
//                             const SizedBox(height: 20,),
//                             Text('Your cart is empty 😌' ,style: Theme.of(context).textTheme.headlineSmall),
//                             const SizedBox(height: 20,),
//                             Text('Explore products and shop your\nfavourite items' , textAlign: TextAlign.center ,style: Theme.of(context).textTheme.titleSmall)
//
//                           ],
//                         ),
//                       );
//                     }else {
//                       return Expanded(
//                         child: ListView.builder(
//                             itemCount: snapshot.data!.length,
//                             itemBuilder: (context, index){
//                               return Card(
//                                 child: Padding(
//                                   padding: const EdgeInsets.all(8.0),
//                                   child: Column(
//                                     mainAxisAlignment: MainAxisAlignment.center,
//                                     crossAxisAlignment: CrossAxisAlignment.start,
//                                     children: [
//                                       Row(
//                                         mainAxisAlignment: MainAxisAlignment.start,
//                                         crossAxisAlignment: CrossAxisAlignment.center,
//                                         mainAxisSize: MainAxisSize.max,
//                                         children: [
//                                           Image(
//                                             height: 100,
//                                             width: 100,
//                                             image: NetworkImage(snapshot.data![index].image.toString()),
//                                           ),
//                                           const SizedBox(width: 10,),
//                                           Expanded(
//                                             child: Column(
//                                               mainAxisAlignment: MainAxisAlignment.start,
//                                               crossAxisAlignment: CrossAxisAlignment.start,
//                                               children: [
//                                                 Row(
//                                                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                                   children: [
//                                                     Text(snapshot.data![index].productName.toString() ,
//                                                       style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
//                                                     ),
//                                                     InkWell(
//                                                         onTap: (){
//                                                           dbHelper!.delete(snapshot.data![index].id!);
//                                                           cart.removerCounter();
//                                                           cart.removeTotalPrice(double.parse(snapshot.data![index].productPrice.toString()));
//                                                         },
//                                                         child: const Icon(Icons.delete))
//                                                   ],
//                                                 ),
//
//                                                 const SizedBox(height: 5,),
//                                                 Text(snapshot.data![index].unitTag.toString() +" "+r"$"+ snapshot.data![index].productPrice.toString() ,
//                                                   style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
//                                                 ),
//                                                 const SizedBox(height: 5,),
//                                                 Align(
//                                                   alignment: Alignment.centerRight,
//                                                   child: InkWell(
//                                                     onTap: (){
//
//
//                                                     },
//                                                     child:  Container(
//                                                       height: 35,
//                                                       width: 100,
//                                                       decoration: BoxDecoration(
//                                                           color: Colors.green,
//                                                           borderRadius: BorderRadius.circular(5)
//                                                       ),
//                                                       child:  Padding(
//                                                         padding: const EdgeInsets.all(4.0),
//                                                         child: Row(
//                                                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                                           children: [
//                                                             InkWell(
//                                                                 onTap: (){
//
//                                                                   int quantity =  snapshot.data![index].quantity! ;
//                                                                   int price = snapshot.data![index].initialPrice!;
//                                                                   quantity--;
//                                                                   int? newPrice = price * quantity ;
//
//                                                                   if(quantity > 0){
//                                                                     dbHelper!.updateQuantity(
//                                                                         Cart(
//                                                                             id: snapshot.data![index].id!,
//                                                                             productId: snapshot.data![index].id!.toString(),
//                                                                             productName: snapshot.data![index].productName!,
//                                                                             initialPrice: snapshot.data![index].initialPrice!,
//                                                                             productPrice: newPrice,
//                                                                             quantity: quantity,
//                                                                             unitTag: snapshot.data![index].unitTag.toString(),
//                                                                             image: snapshot.data![index].image.toString())
//                                                                     ).then((value){
//                                                                       newPrice = 0 ;
//                                                                       quantity = 0;
//                                                                       cart.removeTotalPrice(double.parse(snapshot.data![index].initialPrice!.toString()));
//                                                                     }).onError((error, stackTrace){
//                                                                       print(error.toString());
//                                                                     });
//                                                                   }
//
//                                                                 },
//                                                                 child: const Icon(Icons.remove , color: Colors.white,)),
//                                                             Text( snapshot.data![index].quantity.toString(), style: const TextStyle(color: Colors.white)),
//                                                             InkWell(
//                                                                 onTap: (){
//                                                                   int quantity =  snapshot.data![index].quantity! ;
//                                                                   int price = snapshot.data![index].initialPrice!;
//                                                                   quantity++;
//                                                                   int? newPrice = price * quantity ;
//
//                                                                   dbHelper!.updateQuantity(
//                                                                       Cart(
//                                                                           id: snapshot.data![index].id!,
//                                                                           productId: snapshot.data![index].id!.toString(),
//                                                                           productName: snapshot.data![index].productName!,
//                                                                           initialPrice: snapshot.data![index].initialPrice!,
//                                                                           productPrice: newPrice,
//                                                                           quantity: quantity,
//                                                                           unitTag: snapshot.data![index].unitTag.toString(),
//                                                                           image: snapshot.data![index].image.toString())
//                                                                   ).then((value){
//                                                                     newPrice = 0 ;
//                                                                     quantity = 0;
//                                                                     cart.addTotalPrice(double.parse(snapshot.data![index].initialPrice!.toString()));
//                                                                   }).onError((error, stackTrace){
//                                                                     print(error.toString());
//                                                                   });
//                                                                 },
//                                                                 child: const Icon(Icons.add , color: Colors.white,)),
//
//                                                           ],
//                                                         ),
//                                                       ),
//                                                     ),
//                                                   ),
//                                                 )
//                                               ],
//                                             ),
//                                           )
//
//                                         ],
//                                       )
//                                     ],
//                                   ),
//                                 ),
//                               );
//                             }),
//                       );
//                     }
//
//                   }
//                   return Text('') ;
//                 }),
//             Consumer<CartProvider>(builder: (context, value, child){
//               return Visibility(
//                 visible: value.getTotalPrice().toStringAsFixed(2) == "0.00" ? false : true,
//                 child: Column(
//                   children: [
//                     ReusableWidget(title: 'Sub Total', value: r'$'+value.getTotalPrice().toStringAsFixed(2),),
//                     const ReusableWidget(title: 'Discout 5%', value: r'$'+'20',),
//                     ReusableWidget(title: 'Total', value: r'$'+value.getTotalPrice().toStringAsFixed(2),)
//                   ],
//                 ),
//               );
//             })
//           ],
//         ),
//       ) ,
//     );
//   }
// }
//
//
// class ReusableWidget extends StatelessWidget {
//   final String title , value ;
//   const ReusableWidget({required this.title, required this.value});
//
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 4),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           Text(title , style: Theme.of(context).textTheme.titleSmall,),
//           Text(value.toString() , style: Theme.of(context).textTheme.titleSmall,)
//         ],
//       ),
//     );
//   }
// }