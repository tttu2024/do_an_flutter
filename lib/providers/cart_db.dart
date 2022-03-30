import 'dart:io';

import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import 'package:do_an/models/cart_model.dart';

class DBHelper {
  static Database? _db;

  Future<Database> get db async {
    if (_db != null) {
      return _db!;
    }
    _db = await initDatabase();
    return _db!;
  }

  initDatabase() async {
    Directory documentDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentDirectory.path, 'cart.db');
    var db = await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
    );
    return db;
  }

  _onCreate(Database db, int version) async {
    await db.execute(
        'CREATE TABLE cart (id INTEGER PRIMARY KEY AUTOINCREMENT, productId INTEGER, productName TEXT, unitPrice INTEGER,quantity INTEGER, totalPrice INTEGER,image TEXT)');
  }

  Future<Cart> insert(Cart cart) async {
    var dbClient = await db;
    await dbClient.insert(
        'cart',
        cart.toMap());
    return cart;
  }

  Future<List<Cart>> getCartList() async {
    var dbClient = await db;
    final List<Map<String, Object?>> queryResult = await dbClient.query('cart');
    return queryResult.map((e) => Cart.fromMap(e)).toList();
  }

  Future<int> delete(int id) async {
    var dbClient = await db;
    return await dbClient.delete('cart', where: 'id=?', whereArgs: [id]);
  }

  Future<int> updateQuantity(Cart cart) async {
    var dbClient = await db;
    return await dbClient
        .update('cart', cart.toMap(), where: 'id=?', whereArgs: [cart.id]);
  }

  Future<int> isItem(int id) async {
    var dbClient = await db;
    int? count = Sqflite.firstIntValue(await dbClient.rawQuery('SELECT COUNT(*) FROM cart WHERE productId=?', [id]));
    return count!;
    
  }

  Future<int> updateItem(int id) async {
    var dbClient = await db;
    final raw =
        await dbClient.query('cart', where: 'productId=?', whereArgs: [id]);
    final cart = raw.map((e) => Cart.fromMap(e)).toList();
    int quantity = cart[0].quantity!;
    quantity++;
    int newTotalPrice = cart[0].unitPrice! * quantity;
    return await dbClient.rawUpdate('''
      UPDATE cart
      SET totalPrice=?,quantity=?
      WHERE productId=?
    ''', [newTotalPrice, quantity, id]);
  }

  Future<bool> deleteAllCart()async{
 var dbClient = await db;
 final result= await dbClient.delete('cart');
 return result!=0;
}
}
