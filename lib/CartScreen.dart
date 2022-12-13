import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'Adresse.dart';
import 'CartController.dart';
import 'CarteView.dart';

class CartScreen extends StatelessWidget {
  CartController cart = Get.put(CartController());


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    int x=cart.test.length;
  return Scaffold( appBar: AppBar(

      title: Center(child: Text('Cart')),backgroundColor: Colors.purpleAccent,
  ),
  body: SafeArea(
    child: Column(
      children: [

        CarteView(),
        CartTotal(),
        ]
)
  ));
    throw UnimplementedError();
  }
}

