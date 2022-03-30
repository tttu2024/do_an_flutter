import 'dart:convert';

import 'package:do_an/models/shipping_model.dart';


import 'package:http/http.dart' as http;

String url = 'http://10.0.2.2:8000/api/shipping';

Future<List<Shipping>> fetchShipping() async {
  List<Shipping> lstSp = [];
  try {
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      List js = json.decode(response.body);
      lstSp = js.map((e) => Shipping.fromJson(e)).toList();
    }
  } catch (_) {}
  return lstSp;
}