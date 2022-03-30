//
import 'dart:math';
import 'package:do_an/api/api_account.dart';
import 'package:do_an/models/account_model.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class EditUser extends StatefulWidget {
  final int id;
  const EditUser({Key? key, required this.id}) : super(key: key);

  @override
  _EditUserState createState() => _EditUserState(this.id);
}

class _EditUserState extends State<EditUser> {
  final int id;

  var _secureText = true;
  final GlobalKey<FormState> _formkey =GlobalKey<FormState>();
  _EditUserState(this.id);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Account?>(
      future: information(id),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          var emailController =
              TextEditingController(text: snapshot.data!.email);
          var passwordController =
              TextEditingController(text: snapshot.data!.password);
          var fullnameController =
              TextEditingController(text: snapshot.data!.fullName);
          var addressController =
              TextEditingController(text: snapshot.data!.address);
          var phoneController =
              TextEditingController(text: snapshot.data!.phone);
            
          return Scaffold(
              appBar: AppBar(
                title: Text("Sửa thông tin cá nhân"),
                backgroundColor: Colors.red,
                leading: InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Icon(Icons.keyboard_arrow_left)),
              ),
              body: SingleChildScrollView(
                  keyboardDismissBehavior:ScrollViewKeyboardDismissBehavior.onDrag,
                  child:Form(
                    key: _formkey,
                    child: 
                  
                   Column(
                    children: [
                      SizedBox(
                        height: 30,
                      ),
                      Row(
                        children: [
                          SizedBox(width: 20),
                          Text(
                            "Họ tên :",
                            style: TextStyle(fontSize: 19),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 0,
                      ),
                      Container(
                        width: 380,
                        child: TextFormField(
                          controller: fullnameController,
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
                          obscureText: false,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(1.0),
                            ),
                            prefixIcon: Icon(
                              (Icons.person),
                            ),
                            labelStyle: TextStyle(
                                fontStyle: FontStyle.normal, fontSize: 20),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Row(
                        children: [
                          SizedBox(width: 20),
                          Text(
                            "Email :",
                            style: TextStyle(fontSize: 19),
                          ),
                        ],
                      ),
                      Container(
                        width: 380,
                        child: TextFormField(
                          controller: emailController,
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
                          obscureText: false,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(1.0),
                            ),
                            prefixIcon: Icon(
                              (Icons.person),
                            ),
                            labelStyle: TextStyle(
                                fontStyle: FontStyle.normal, fontSize: 20),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Row(
                        children: [
                          SizedBox(width: 20),
                          Text(
                            "Mật khẩu :",
                            style: TextStyle(fontSize: 19),
                          ),
                        ],
                      ),
                      Container(
                        width: 380,
                        child: TextFormField(
                          controller: passwordController,
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
                          obscureText: _secureText,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(1.0),
                            ),
                            prefixIcon: Icon(
                              (Icons.person),
                            ),
                            suffixIcon: IconButton(
                                icon: Icon(_secureText
                                    ? Icons.remove_red_eye
                                    : Icons.security),
                                onPressed: () {
                                  setState(() {
                                    _secureText = !_secureText;
                                  });
                                }),
                            labelStyle: TextStyle(
                                fontStyle: FontStyle.normal, fontSize: 20),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Row(
                        children: [
                          SizedBox(width: 20),
                          Text(
                            "Số điện thoại :",
                            style: TextStyle(fontSize: 19),
                          ),
                        ],
                      ),
                      Container(
                        width: 380,
                        child: TextFormField(
                          controller: phoneController,
                         
                          obscureText: false,
                          validator: (value){
                          if(value!.isEmpty)
                          return "Sô điện thoại không được bỏ trống";

                           if(!RegExp( r'^(?:[+0][1-9])?[0-9]{10,12}$').hasMatch(value)){
                              return "Số điện thoại không hợp lệ";
                          }else{
                             return null;
                          }
                        },
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(1.0),
                            ),
                            prefixIcon: Icon(
                              (Icons.person),
                            ),
                            labelStyle: TextStyle(
                                fontStyle: FontStyle.normal, fontSize: 20),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Row(
                        children: [
                          SizedBox(width: 20),
                          Text(
                            "Địa chỉ cụ thể :",
                            style: TextStyle(fontSize: 19),
                          ),
                        ],
                      ),
                      Container(
                        width: 380,
                        child: TextFormField(
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
                          controller: addressController,
                          obscureText: false,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(1.0),
                            ),
                            prefixIcon: Icon(
                              (Icons.person),
                            ),
                            labelStyle: TextStyle(
                                fontStyle: FontStyle.normal, fontSize: 20),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        height: 35,
                        width: 200,
                        child: GestureDetector(
                          onTap: () {
                            if(_formkey.currentState!.validate()){
                            edit(
                                emailController.text,
                                passwordController.text,
                                fullnameController.text,
                                addressController.text,
                                phoneController.text,
                                id.toString(),
                                context);
                            }
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.circular(30.0),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const <Widget>[
                                Center(
                                  child: Text(
                                    "Lưu thay đổi",
                                    style: TextStyle(
                                      color: Colors.white,
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
                    ],
                  )
                  )));
        }
        return Container();
      },
    );
  }
}
