import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mini_projet/ProductsController.dart';
import 'AuthentificationController.dart';
import 'CarteView.dart';
import 'ProductDetails.dart';
import 'ProductModel.dart';

class session extends StatelessWidget {

  session({super.key});

  final AuthController controller = Get.put(AuthController());
  ProductController product = Get.put(ProductController());

  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
        appBar: AppBar(
        title: const Center(child:Text("Session")),backgroundColor: Colors.purpleAccent,
    ),
      drawer: Drawer(
        child: ListView(
            children: [
        const DrawerHeader(
        decoration: BoxDecoration(
        gradient: LinearGradient(
            colors: [Colors.white, Colors.grey]),
      ), child:CircleAvatar(
        backgroundColor: Colors.white,
        backgroundImage: NetworkImage(
            "https://cdn.dribbble.com/users/119277/screenshots/2383884/ecom-cart.gif")),
    ),

    ListTile(
    title:  Text("${controller.user}")),
     ListTile(title: ElevatedButton(
    onPressed: () async {
    controller.signOut();},style: ElevatedButton.styleFrom(
         primary: Colors.purple),
    child: const Text("Sign out")
    ),)])
    ),
        body:
        PageView.builder(
    itemCount: product.productList.length,
    itemBuilder: (con, index) {
    final products =
    product.productList[index];
    return GestureDetector(
        onTap: () {
          product.index(index);
          Get.to(ProductDetails());
        },
         child:Container(
           child: Column( children: <Widget>[
             Center(child:Text("${products.category} ",style:const TextStyle(color: Colors.red,fontSize: 20),),),
             const SizedBox(height: 10),
           Center(child:Text("${products.title} ",style:const TextStyle(color: Colors.greenAccent,fontSize: 16),),),
             const SizedBox(height: 10),
             Image.network(products.images[0],alignment: Alignment.center,width: 700,height: 600,),
       ]),

    ));
    }
    )));
}
}
