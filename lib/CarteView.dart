
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mini_projet/ProductModel.dart';


import 'Adresse.dart';
import 'CartController.dart';

import 'ProductsController.dart';

class CarteView extends StatelessWidget {
  ProductController product = Get.put(ProductController());
  CartController cart = Get.find();
  @override
  Widget build(BuildContext context) {
   return Obx(() =>SizedBox(
     height:600,
      child: (cart.test.isEmpty ?   Column(children: [
        Center(child:Image.asset("images/cart.jpg",width: 500,height: 550,)),


      ],

      ): ListView.builder(
       itemCount: cart.test.length,
         itemBuilder: (BuildContext context,int index){
         return ViewCart(controller: cart, product:cart.test.keys.toList()[index]
           , quantity:cart.test.values.toList()[index] , index: index,

         );
         }


   ))));
    throw UnimplementedError();
  }
}

class ViewCart extends StatelessWidget{
   final CartController controller;
 final Product product;
  final int quantity;
  final int index;
  const ViewCart({
    Key ? key,
    required this.controller,
    required this.product,
    required this.quantity,
    required this.index
});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Padding(padding: const EdgeInsets.symmetric(
      horizontal: 20.0,
      vertical: 10,
    ),
    child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [
      CircleAvatar(radius: 40,backgroundImage:  NetworkImage(product.thumbnail),

      ),
      SizedBox(width: 20,),
      Expanded(child: Text(product.title)),
      IconButton(onPressed: (){
        controller.removeProduct(product);
      }, icon: Icon(Icons.remove_circle)),
      Text("${quantity}"),
      IconButton(onPressed: (){ controller.addProduct(product);}, icon: Icon(Icons.add_circle)),
      IconButton(onPressed: (){ controller.removeAllProducts(product);}, icon: Icon(Icons.delete),color: Colors.red,)

    ],


    ),
    );

    throw UnimplementedError();
  }
}
class CartTotal extends StatelessWidget{
  CartController cart = Get.find();
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
   return  Obx(() => Container(padding: const EdgeInsets.symmetric(
     horizontal: 72.0,
   ),
     child: Row(
       mainAxisAlignment: MainAxisAlignment.spaceBetween,
       children: [
         Text("Total",
         style:TextStyle(
            fontSize: 14,
           fontWeight: FontWeight.bold,
         ),
         ),
if (cart.test.isEmpty)...[
  Text("0",
    style:TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.bold,
    ),
  ),

]
         else...[
     Obx(() =>Text(cart.Total.toString(),
         style:TextStyle(
           fontSize: 14,
           fontWeight: FontWeight.bold,
         ),
       )),
  Column(children: [ElevatedButton(onPressed:() {
    Get.to(CurrentLocationScreen());
  }, child:Text("Confirmer"))],)

       ]]),
     ));
    throw UnimplementedError();
  }

}

