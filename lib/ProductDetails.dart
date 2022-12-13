import 'package:badges/badges.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'Adresse.dart';
import 'CartController.dart';

import 'CartScreen.dart';
import 'CarteView.dart';
import 'Count.dart';
import 'ProductModel.dart';
import 'ProductsController.dart';

class ProductDetails extends StatelessWidget{
  ProductController product = Get.put(ProductController());
  MainScreenController controller=Get.put(MainScreenController());
  CartController cart = Get.put(CartController());

  ProductDetails({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold( appBar: AppBar(

          title: Center(child: Text('ProductDetails'),),backgroundColor: Colors.purpleAccent,
      ),

        body: GetBuilder<ProductController>(
            init: ProductController(),
            builder: (product) {
              final productData =
              product.productList[int.parse(product.index.toString())];
              return Container(child: Column( children: <Widget>[
                Center(child: Text("Category: "+"${productData.category}",style:const TextStyle(color: Colors.red,fontSize: 20),),),
                const SizedBox(height: 20),
                Center(child:Text("${productData.title}",style:const TextStyle(color: Colors.grey,fontSize: 18),)),
                CarouselSlider(
                  options: CarouselOptions(height: 400.0),
                  items: productData.images.map((i) {
                    return Builder(
                      builder: (BuildContext context) {
                        return Container(
                          width: MediaQuery.of(context).size.width,
                          margin: EdgeInsets.symmetric(horizontal: 5.0),
                          child: Image.network("$i"),
                        );
                      },
                    );
                  }).toList(),
                ),
                const SizedBox(height: 10),
                Center(child:Text("${productData.description}")),
                const SizedBox(height: 10),
                Text("Price: ${productData.price}"+"Dt", textAlign:TextAlign.right,),
                const SizedBox(height: 10),
                Text("Stock: ${productData.stock}",textAlign:TextAlign.right),


                Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [
                  Badge(
              badgeContent: Obx(() =>Text(
              '${cart.test.length.toString()}',
              style: TextStyle(
              fontFamily: 'Poppins',
              color: Colors.white,
              ),
              )),
              showBadge: true,
              shape: BadgeShape.circle,
              badgeColor: Colors.red,
              elevation: 4,
              padding: EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
              position: BadgePosition.topEnd(),
              animationType: BadgeAnimationType.scale,
              toAnimate: true,
              child: IconButton(
              icon: Icon(
              Icons.shopping_cart_outlined,
              color:Colors.purpleAccent,
              size: 30,
              ),
              onPressed: () {
              Navigator.push(
              context,
              MaterialPageRoute(
              builder: (context) => (CartScreen()),
              ),
              );
              },
              ),
              ),
                ElevatedButton(
                  onPressed: () async {
                    //cart.add(productData.id,productData.thumbnail, productData.title, productData.description, productData.price, controller.value.toInt());
                    cart.addProduct(productData);
                    //Get.to(CartScreen());
                  },
                  style: ElevatedButton.styleFrom(
                      primary: Colors.red,
                  ),
                  child: const Text("Add to Card "),
                ),
]),
              ]));

            }));
    throw UnimplementedError();
  }
}
