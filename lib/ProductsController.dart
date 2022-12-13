import 'dart:convert';

import 'package:get/get.dart';

import 'package:http/http.dart' as http;
import 'ProductModel.dart';
import 'ProductService.dart';


class ProductController extends GetxController {
  var  productList = <Product>[].obs;
var index=0.obs;
  final count = 0.obs;
   void getProducts() async {
     try {
       var aproducts = await ApiServices.fetchProducts();
       productList.assignAll(aproducts!);
     } finally {

     }
   }
  @override
  Future<void> onInit() async {
    getProducts();
    super.onInit();


  }
}