import 'dart:convert';

import 'package:http/http.dart' as http;

import '/entities/category/category.dart';

class CategoriesRepository {
  Future<List<Category>> getCategories() async {
    try {
      var url =
          Uri.parse('https://vue-study.skillbox.cc/api/productCategories');
      var response = await http.get(url);
      var result = jsonDecode(utf8.decode(response.bodyBytes));
      return (result["items"] as List)
          .map((e) => CategoryDTO.fromJson(e).toCategory())
          .toList();
    } catch (e) {
      print(e);
      return [];
    }
  }
}
