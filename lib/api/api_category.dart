import 'dart:convert';

import 'package:do_an/models/category_model.dart';


import 'package:http/http.dart' as http;

String url = 'http://10.0.2.2:8000/api/categories';

Future<List<Category>> fetchCategory() async {
  List<Category> lstCtg = [];
  try {
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      List js = json.decode(response.body);
      lstCtg = js.map((e) => Category.fromJson(e)).toList();
    }
  } catch (_) {}
  return lstCtg;
}