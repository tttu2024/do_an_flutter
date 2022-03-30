import 'dart:math';
import 'package:do_an/api/api_signin.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

enum GioiTinh { nam, nu }
GioiTinh _gioitinh = GioiTinh.nam;

class _SignUpState extends State<SignUp> {
  // bool valuefirst = false;
  // bool valuesecond = false;
  var _secureText = true;
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var fullnameController = TextEditingController();
  var addressController = TextEditingController();
  var sexController = TextEditingController();
  var phoneController = TextEditingController();
  final GlobalKey<FormState> _formkey =GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        child: Form(
          key: _formkey,
          child:Column(
            children:[
               const SizedBox(
              height: 50,
            ),
            Container(
              child: Image.asset('images/icon/logo.jpg'),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
                            height: 100,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: TextFormField(
                controller: fullnameController,
                keyboardType: TextInputType.text,
                validator: (value){
                          if(value!.isEmpty)
                          return "Vui lòng nhập họ tên !";

                        if(!RegExp(r'^[a-z A-Z]+$').hasMatch(value)){
                              //allow upper and lower case alphabets and space
                              return "Họ và tên không đúng !";
                          }else{
                             return null;
                          }
                        },
                style: TextStyle(color: Colors.black87),
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Họ và tên......',
                    hintStyle: TextStyle(color: Colors.black38, fontSize: 20)),
              ),
            ),
            Container(
                          height: 100,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: TextFormField(
                  validator: (value){
                             if(value!.isEmpty)
                             {
                               return "Email không được bỏ trống!";
                             }
                          if( !RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)){
                              return "Vui lòng nhập đúng email";
                          }else{
                             return null;
                          }
                        },
                controller: emailController,
                keyboardType: TextInputType.text,
                
                style: TextStyle(color: Colors.black87),
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Địa chỉ mail......',
                    hintStyle: TextStyle(color: Colors.black38, fontSize: 20)),
              ),
            ),
            Container(
                            height: 100,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: TextFormField(
                 validator: (value){
                          if(value!.isEmpty)
                          return "Sô điện thoại không được bỏ trống";

                           if(!RegExp( r'^(?:[+0][1-9])?[0-9]{10,12}$').hasMatch(value)){
                              return "Số điện thoại không hợp lệ";
                          }else{
                             return null;
                          }
                        },
                controller: phoneController,
                keyboardType: TextInputType.text,
                style: TextStyle(color: Colors.black87),
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Số điện thoại......',
                    hintStyle: TextStyle(color: Colors.black38, fontSize: 20)),
              ),
            ),
            Container(
                          height: 100,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: TextFormField(
                 validator: (value){
                             if(value!.isEmpty)
                             {
                               return "Mật khẩu không được bỏ trống !";
                             }
                          if( !RegExp(r'^(?=.*?).{3,}$').hasMatch(value)){
                              return "Mật khẩu phải dài hơn 3 kí tự";
                          }else{
                             return null;
                          }
                        },
                controller: passwordController,
                keyboardType: TextInputType.text,
                style: TextStyle(color: Colors.black87),
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Mật khẩu......',
                    hintStyle: TextStyle(color: Colors.black38, fontSize: 20)),
              ),
            ),
            Container(
              height: 100,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: TextFormField(
                controller: addressController,
                   validator: (value){
                          if(value!.isEmpty)
                          return "Vui lòng nhập địa chỉ cụ thể !";

                        if(!RegExp(r'^(?=.*?).{10,}$').hasMatch(value)){
                              //allow upper and lower case alphabets and space
                              return "Nhập đúng địa chỉ cụ thể, có ít nhất 10 ký tự !";
                          }else{
                             return null;
                          }
                        },
                keyboardType: TextInputType.text,
                style: TextStyle(color: Colors.black87),
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Địa chỉ cụ thể',
                    hintStyle: TextStyle(color: Colors.black38, fontSize: 20)),
              ),
            ),
            Row(
              children: [
                SizedBox(
                  width: 20,
                ),
                Text(
                  "Giới tính",
                  style: TextStyle(fontSize: 18),
                ),
              ],
            ),
            RadioListTile<GioiTinh>(
                title: const Text("Nam"),
                value: GioiTinh.nam,
                groupValue: _gioitinh,
                onChanged: (GioiTinh? value) {
                  setState(() {
                    _gioitinh = value!;
                  });
                }),
            RadioListTile<GioiTinh>(
                title: const Text("Nữ"),
                value: GioiTinh.nu,
                groupValue: _gioitinh,
                onChanged: (GioiTinh? value) {
                  setState(() {
                    _gioitinh = value!;
                  });
                }),
            const SizedBox(
              height: 15,
            ),
            Container(
              height: 35,
              width: 200,
              child: GestureDetector(
                onTap: () {
                  if(_formkey.currentState!.validate()){
                  int gioitinh = 0;
                  if (_gioitinh == GioiTinh.nu) 
                  gioitinh = 1;
 if(_formkey.currentState!.validate()){
                signin(
                      emailController.text,
                      passwordController.text,
                      fullnameController.text,
                      addressController.text,
                      phoneController.text,
                      gioitinh.toString(),
                      context);
 }
                  }
                },

                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.black,
                      style: BorderStyle.solid,
                      width: 1.0,
                    ),
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const <Widget>[
                      Center(
                        child: Text(
                          "ĐĂNG KÍ",
                          style: TextStyle(
                            color: Colors.red,
                            fontFamily: 'Montserrat',
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Text("------------ Hoặc ------------"),
            SizedBox(
              height: 10,
            ),
            GestureDetector(
              child: Container(
                height: 45,
                width: 250,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                  borderRadius: BorderRadius.circular(30.0),
                ),
                padding: EdgeInsets.all(10),
                child: Row(
                  children: [
                    Image.asset('images/icon/facebook.jpg', width: 30),
                    SizedBox(width: 15),
                    Text(
                      "Đăng nhập với facebook",
                      style: TextStyle(fontSize: 15),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            GestureDetector(
              child: Container(
                height: 45,
                width: 250,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                  borderRadius: BorderRadius.circular(30.0),
                ),
                padding: EdgeInsets.all(10),
                child: Row(
                  children: [
                    Image.asset('images/icon/google.jpg', width: 30),
                    SizedBox(width: 15),
                    Text(
                      "Đăng nhập với google",
                      style: TextStyle(fontSize: 15),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 30,
            )],
        ),
             
          )
          // mainAxisAlignment: MainAxisAlignment.cente
      ),
    );
  }
}
