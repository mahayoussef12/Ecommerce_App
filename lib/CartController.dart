
import 'package:flutter/material.dart';
import 'package:get/get.dart';


import 'ProductModel.dart';

class CartController extends GetxController {

  var test={}.obs;

  addProduct(Product product){
    if (test.containsKey(product)){
      test[product]+=1;
    }
    else{
      test[product]=1;
    }
    Get.snackbar(
      "Add",
      "Added product",
      icon: Icon(Icons.add_circle, color: Colors.white),
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.redAccent,
      borderRadius: 20,
      margin: EdgeInsets.all(15),
      colorText: Colors.white,
      duration: Duration(seconds: 1),
      isDismissible: true,
      forwardAnimationCurve: Curves.easeOutBack,

    );
  }
  get Products => test;

  void removeProduct(Product product) {
    if (test.containsKey(product)&& test[product]==1){
      test.removeWhere((key, value) => key == product);

    }
    else{
      test[product]-=1;
    }
    Get.snackbar("Remove product", "remove",snackPosition: SnackPosition.BOTTOM,duration: Duration(seconds: 1));
  }
  void removeAllProducts(Product product){
    test.remove(product);
    Get.snackbar(
      "Remove",
      "Remove product",
      icon: Icon(Icons.remove_shopping_cart, color: Colors.white),
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.redAccent,
      borderRadius: 20,
      margin: EdgeInsets.all(15),
      colorText: Colors.white,
      duration: Duration(seconds: 1),
      isDismissible: true,

      forwardAnimationCurve: Curves.easeOutBack,

    );
  }
  void remove(){
    test.entries.map((product) => test.remove(product.key));
    Get.snackbar(
      "Remove",
      "Remove product",
      icon: Icon(Icons.remove_shopping_cart, color: Colors.white),
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.redAccent,
      borderRadius: 20,
      margin: EdgeInsets.all(15),
      colorText: Colors.white,
      duration: Duration(seconds: 1),
      isDismissible: true,

      forwardAnimationCurve: Curves.easeOutBack,

    );


  }
  checkout() {
    test.clear();

    Get.snackbar(
      "Success",
      "Successfully checked out the cart",
      icon: Icon(Icons.check_circle_outlined, color: Colors.white),
      snackPosition: SnackPosition.TOP,
      backgroundColor: Colors.redAccent,
      borderRadius: 20,
      margin: EdgeInsets.all(15),
      colorText: Colors.white,
      duration: Duration(seconds: 2),
      isDismissible: true,

      forwardAnimationCurve: Curves.easeOutBack,

    );

  }
  get ProductSupTotal =>test.entries.map((product) => product.key.price=product.value).toList();
  get Total=>test.entries.map((product) => product.key.price*product.value).toList().reduce((value, element) => value+element).toStringAsFixed(2);

}
