import 'dart:convert';

import 'package:creonit_test/entities/basket/basket.dart';

import '/entities/product/product.dart';
import 'package:http/http.dart' as http;

class BasketRepository {
  Future<Basket> getBasket(String accessKey) async {
    try {
      var url = Uri.parse('https://vue-study.skillbox.cc/api/baskets');
      var response = await http.get(url);
      var result = jsonDecode(utf8.decode(response.bodyBytes));
      return BasketDTO.fromJson(result).toBasket();
    } catch (e) {
      return Basket(
          id: 0, items: [], user: BasketUser(id: 0, accessKey: accessKey));
    }
  }

  Future<Basket> addToBasket(String accessKey, int productId) async {
    try {
      var url = Uri.parse(
          'https://vue-study.skillbox.cc/api/baskets/products?userAccessKey=$accessKey');
      var response = await http.post(url,
          body: {"productId": productId.toString(), "quantity": "1"});
      var result = jsonDecode(utf8.decode(response.bodyBytes));
      return BasketDTO.fromJson(result).toBasket();
    } catch (e) {
      print(e);
      return Basket(
          id: 0, items: [], user: BasketUser(id: 0, accessKey: accessKey));
    }
  }

  Future<Basket> deleteFromBasket(String accessKey, int productId) async {
    try {
      var url = Uri.parse(
          'https://vue-study.skillbox.cc/api/baskets/products?userAccessKey=$accessKey');
      var response =
          await http.delete(url, body: {"productId": productId.toString()});
      var result = jsonDecode(utf8.decode(response.bodyBytes));
      return BasketDTO.fromJson(result).toBasket();
    } catch (e) {
      print(e);
      return Basket(
          id: 0, items: [], user: BasketUser(id: 0, accessKey: accessKey));
    }
  }
}
