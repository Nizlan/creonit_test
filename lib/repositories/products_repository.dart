import 'dart:convert';

import '/entities/product/product.dart';
import 'package:http/http.dart' as http;

class ProductsRepository {
  Future<List<Product>> getProducts(int categoryId, int page) async {
    try {
      var url = Uri.parse(
          'https://vue-study.skillbox.cc/api/products?categoryId=$categoryId&page=$page');
      var response = await http.get(url);
      var result = jsonDecode(utf8.decode(response.bodyBytes));
      List<Product> items = (result["items"] as List)
          .map((e) => ProductDTO.fromJson(e).toProduct())
          .toList();
      List<Product> itemsFourTimes = List.generate(
          items.length * 4, (index) => items[index % items.length]);
      return itemsFourTimes;
    } catch (e) {
      return [];
    }
  }
}
