import 'package:do_an/models/cart_model.dart';
import 'package:do_an/providers/cart_db.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CartProvider with ChangeNotifier {
  DBHelper db = DBHelper();

  int _total = 0;
  get total => _total;

  late Future<List<Cart>> _cart;
  Future<List<Cart>> get cart => _cart;
  Future<List<Cart>> getData() async {
    _cart = db.getCartList();
    return _cart;
  }

  void setPrefItem() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.setInt('total_price', _total);
    notifyListeners();
  }

  void getPrefItem() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    _total = prefs.getInt('total_price') ?? 0;
    notifyListeners();
  }

  void addTotal(int unitPrice) {
    _total += unitPrice;
    setPrefItem();
    notifyListeners();
  }

  void removeTotal(int unitPrice) {
    _total -= unitPrice;
    setPrefItem();
    notifyListeners();
  }

  void resetTotal() {
    _total = 0;
    setPrefItem();
    notifyListeners();
  }

  int getTotal() {
    getPrefItem();
    return _total;
  }
}
