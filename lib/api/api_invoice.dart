import 'dart:convert';

import 'package:do_an/models/account_model.dart';
import 'package:do_an/models/invoice_model.dart';
import 'package:do_an/providers/cart_provider.dart';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

String url = 'http://10.0.2.2:8000/api/invoices/';

Future<List<Invoice>> fetchInvoice(int id, int status) async {
  List<Invoice> lstInv = [];
  try {
    final response = await http
        .get(Uri.parse(url + id.toString() + '/' + status.toString()));
    if (response.statusCode == 200) {
      List js = json.decode(response.body);
      lstInv = js.map((e) => Invoice.fromJson(e)).toList();
    }
  } catch (_) {}
  return lstInv;
}

Future<bool> isCreate(int id, String address, BuildContext context) async {
  final cart = Provider.of<CartProvider>(context, listen: false);
  final getData = await cart.getData();
  List<Map<String, dynamic>> value = [];
  for (var item in getData) {
    value.add({
      "product_id": "${item.productId}",
      "quantity": "${item.quantity}",
      "price": "${item.unitPrice}"
    });
  }
  final body = json.encode({
    "account_id": id,
    "address": address,
    "total": "${cart.getTotal()}",
    "data": value
  });
  final response = await http.post(Uri.parse(url + 'createInv'),
      body: body,
      headers: {
        "accept": "application/json",
        "content-type": "application/json"
      });

  if (response.statusCode == 200) return true;
  return false;
}

Future<bool> isCancel(int id) async {
  try {
    final response = await http
        .get(Uri.parse(url + 'cancel/' + id.toString()));
    if (response.statusCode == 200) {
      return true;
    }
  } catch (_) {}
  return false;
}