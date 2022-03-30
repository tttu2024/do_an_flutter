import 'dart:math';
import 'package:do_an/api/api_login.dart';

import 'package:do_an/models/account_model.dart';


import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  Account requestModel =Account(
     id:0,
   email:"",
   password:"",
  fullName:"",
    sex:null,
    address:"",
    phone:"",
    birthday:"",
    avatar:"",
    isAdmin:0,
    createdAt:"",
    updatedAt:"",
  );
  var _secureText=true;
  var emailController=TextEditingController();
  var passwordController=TextEditingController();
  bool _isObscure =true;
  @override
  void initState(){
    super.initState();
    requestModel;
  }
  Widget build(BuildContext context) {
  
    return Scaffold(
      appBar: AppBar(
  title: Text('Đăng nhập'),
  backgroundColor: Colors.red,
  ),
      body: SingleChildScrollView(
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
           SizedBox(height: 50,),
            Container(
              child: Image.asset('images/icon/login.JPG'),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                SizedBox(width: 23,),
                Container(
                  width: 360,
                  height: 100,
                  child:  Padding(
                    padding: EdgeInsets.all(15),
                    child: TextFormField(
                      
                      controller: emailController,
                      obscureText: false,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                        ),
                      
                        prefixIcon:Icon(
                         (Icons.person),
                        ),
                        labelText: 'Email/số điện thoại',
                        hintText: 'Email/số điện thoại',
                        labelStyle: TextStyle(
                            fontStyle: FontStyle.normal, fontSize: 20),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Container(
              width:360,
              child:  Padding(
                padding: EdgeInsets.all(15),
                child: TextFormField(
                  controller: passwordController,
                  onSaved: (input)=>requestModel.password=input!,
                  validator: (input)
                  =>(input)!.length<3?"Mật khẩu phải nhiều hơn 3 kí tự ":null,
                  obscureText: _secureText,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                    ),
                    
                    prefixIcon: Icon(
                      Icons.https,
                     
                    ),
                    suffixIcon: IconButton(
                      icon:Icon(_secureText?Icons.remove_red_eye:Icons.security) ,

                      onPressed:(){
                       setState(() {
                         _secureText=!_secureText;
                       });
                      }
                      ),
                    labelText: 'Password',
                    hintText: 'Mật khẩu',
                     labelStyle: TextStyle(
                            fontStyle: FontStyle.normal, fontSize: 20),
              )),
                ),
              ),
          
            const SizedBox(
              height: 30,
            ),
            Container(
              height: 35,
              width: 200,
              child: GestureDetector(
                onTap: () {
                login(emailController.text, passwordController.text, context);
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
                          "ĐĂNG  NHẬP",
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
            const SizedBox(
              height: 30,
            ),
            Row(mainAxisAlignment: MainAxisAlignment.start, children:  [
              SizedBox(
                width: 20,
              ),
              InkWell(child: Text("Bạn quên mật khẩu ?"),
              onTap: (){
                   Navigator.pushNamed(context, '/forgetpass');
              },),

              SizedBox(
                width: 100,
              ),    
              InkWell(
                child: Text(
                  "Đăng kí tài khoản ?",
                  style: TextStyle(color: Colors.blue,fontWeight: FontWeight.w700),
                ),
                onTap: (){
                  Navigator.pushNamed(context, '/signup');
                },
              ),
            ]),
            Row(mainAxisAlignment: MainAxisAlignment.start, children: const [
              SizedBox(
                height: 50,
              ),
              SizedBox(
                width: 130,
              ),
              Text("----------   Hoặc   ---------- "),
            ]),
            Row(
              children: [
                SizedBox(width:88),
                ElevatedButton(
                  onPressed: () {},
                  child: Image.asset('images/icon/facebook.jpg', width: 50),
                  style: ElevatedButton.styleFrom(
                    shape: CircleBorder(),
                  ),
                ),
                 SizedBox(width:60),
                ElevatedButton(
                  onPressed: () {},
                  child: Image.asset('images/icon/google.jpg', width: 50),
                  style: ElevatedButton.styleFrom(
                    shape: CircleBorder(),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
