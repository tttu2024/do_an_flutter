import 'package:do_an/bottom_navigator/bottom.dart';

import 'package:http/http.dart' as http;
import 'package:do_an/models/account_model.dart';
import 'dart:convert';
import 'package:flutter/material.dart';

String urlLogin = 'http://10.0.2.2:8000/api/login';

Future<Account> login(String email, String password, context) async {
  Account result = Account(
    id: 0,
    email: "",
    password: "",
    fullName: "",
    sex: 1,
    address: "",
    phone: "",
    birthday: "",
    avatar: "",
    isAdmin: 0,
    createdAt: "",
    updatedAt: "",
  );
  if (email.isNotEmpty && password.isNotEmpty) {
    final response = await http.post(Uri.parse(urlLogin),
        body: ({
          "email": email,
          "password": password,
          "phone": email,
        }));
    if (response.statusCode == 200) {
      result = Account.fromJson(json.decode(response.body));

      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text('Login Successfull')));
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
              builder: (context) => Bottom(
                    acc: result,
                  )),
          (route) => false);
    } else {
      showDialog(
          context: context,
          builder: (context) => AlertDialog(
                title: const Text("Đăng nhập thất bai"),
                content:
                    const Text("Vui lòng nhập lại tài khoản hoặc mật khẩu"),
                actions: <Widget>[
                  TextButton(
                    child: const Text("Ok"),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ));
    }
  } else {
    ScaffoldMessenger.of(context)
        .showSnackBar(const SnackBar(content: Text("Black field not allowed")));
  }
  return result;
}
