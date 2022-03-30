import 'dart:convert';

import 'package:do_an/models/product_model.dart';
import 'package:do_an/models/review_model.dart';

import 'package:http/http.dart' as http;

String url = 'http://10.0.2.2:8000/api/products';

Future<List<Product>> fetchFeaturedProduct() async {
  List<Product> lstPrd = [];
  try {
    final response = await http.get(Uri.parse(url + '/get-featured-product'));
    if (response.statusCode == 200) {
      List js = json.decode(response.body);
      lstPrd = js.map((e) => Product.fromJson(e)).toList();
    }
  } catch (_) {}
  return lstPrd;
}

Future<List<Product>> fetchNewProduct() async {
  List<Product> lstPrd = [];
  try {
    final response = await http.get(Uri.parse(url + '/get-new-product'));
    if (response.statusCode == 200) {
      List js = json.decode(response.body);
      lstPrd = js.map((e) => Product.fromJson(e)).toList();
    }
  } catch (_) {}
  return lstPrd;
}

Future<List<Product>> fetchProductByCategory(int id) async {
  List<Product> lstPrd = [];
  try {
    final response =
        await http.get(Uri.parse(url + '/get-by-category/' + id.toString()));
    if (response.statusCode == 200) {
      List datajs = json.decode(response.body);
      lstPrd = datajs.map((e) => Product.fromJson(e)).toList();
    }
  } catch (_) {}
  return lstPrd;
}

Future<List<Product>> fetchProductBySubCategory(int id) async {
  List<Product> lstPrd = [];

  try {
    final response = await http
        .get(Uri.parse(url + '/get-by-sub-category/' + id.toString()));
    if (response.statusCode == 200) {
      List js = json.decode(response.body);
      lstPrd = js.map((e) => Product.fromJson(e)).toList();
    }
  } catch (_) {}
  return lstPrd;
}

Future<Product> fetchDetailProduct(int id) async {
  Product? prd;
  try {
    final response = await http.get(Uri.parse(url + id.toString()));
    if (response.statusCode == 200) {
      List datajs = json.decode(response.body);
      prd = datajs.map((e) => Product.fromJson(e)).first;
    }
  } catch (_) {}
  return prd!;
}

Future<List<Review>> fetchReview(int id) async {
  List<Review> lstRv = [];
  try {
    final response = await http
        .get(Uri.parse('http://10.0.2.2:8000/api/review/' + id.toString()));
    if (response.statusCode == 200) {
      List datajs = json.decode(response.body);
      lstRv = datajs.map((e) => Review.fromJson(e)).toList();
    }
  } catch (_) {}
  return lstRv;
}

Future<bool> createRV(int acc, int prd, double vote, String comment,int id) async {
  final body = json.encode({
    'account_id': acc,
    'product_id': prd,
    'vote': vote,
    'comments': comment,
    'id' : id
  });
  try {
    final response = await http.post(
        Uri.parse('http://10.0.2.2:8000/api/review'),
        body: body,
        headers: {
          "accept": "application/json",
          "content-type": "application/json"
        });
    if (response.statusCode == 200) {
      return true;
    }
  } catch (_) {}
  return false;
}
