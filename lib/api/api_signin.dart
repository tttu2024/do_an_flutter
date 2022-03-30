import 'package:do_an/pages/user/infomationuser.dart';
import 'package:do_an/pages/user/login.dart';
import 'package:http/http.dart' as http;
import 'package:do_an/models/account_model.dart';
import 'package:flutter/material.dart';

String urlLogin = 'http://10.0.2.2:8000/api/signin';

Future<Account> signin(String email, String password, String fullName,
    String address, String phone, String sex, context) async {
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
  if (email.isNotEmpty &&
      password.isNotEmpty &&
      fullName.isNotEmpty &&
      address.isNotEmpty &&
      phone.isNotEmpty) {
    final response = await http.post(Uri.parse(urlLogin),
        body: ({
          "email": email,
          "password": password,
          "fullname": fullName,
          "address": address,
          "sex": sex,
          "phone": phone
        }));
    if (response.statusCode == 200) {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text('Signin Successfull')));
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => LoginScreen()),
          (route) => false);
    } else {
      showDialog(
          context: context,
          builder: (context) => AlertDialog(
                title: const Text("Đăng kí thất bai"),
                // content:const Text("Vui lòng nhập đầy đủ thông tin"),
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
    ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Vui lòng nhập đầy đủ thông tin")));
  }
  return result;
}
