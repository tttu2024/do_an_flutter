import 'dart:convert';

import 'package:do_an/models/account_model.dart';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

String url = 'http://10.0.2.2:8000/api/user/';


Future<Account?> information(int id) async {
  var uri=url+'$id';
  try{
    final response=await http.get(Uri.parse(uri));
    if(response.statusCode==200){
      Account ac=Account.fromJson(jsonDecode(response.body));
      return ac;
    }
    
  }catch(_){}
}
Future<Account> edit(String email ,String password , String fullName,String address,String phone,String id,context) async{
  Account result = Account(
    id:0,
   email:"",
   password:"",
    fullName:"",
    sex:1,
    address:"",
    phone:"",
    birthday:"",
    avatar:"",
    isAdmin:0,
    createdAt:"",
    updatedAt:"",
  );
  if(email.isNotEmpty && password.isNotEmpty && fullName.isNotEmpty && address.isNotEmpty &&phone.isNotEmpty )
  {
    final response = await http.post(Uri.parse(url + 'edit'),
    body: ({
      "id":id,
      "email": email,
      "password": password,
      "fullname":fullName,
      "address":address,
      "phone":phone
    }));
    if(response.statusCode==200){

        ScaffoldMessenger.of(context)
        
        .showSnackBar(const SnackBar(content: Text('Cập nhật thông tin thành công'),));
        

        // Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
        //                     builder: (context) =>  InfomationUser(id: result.id!)), (route) => false);
        Navigator.pop(context);

        
        
    }
    else
    {
      
      showDialog(context: context, 
      builder: (context)=>AlertDialog(
        title: const Text("Thông tin thay đổi không hợp lệ, vui lòng xem lại !"),
        // content:const Text("Vui lòng nhập đầy đủ thông tin"),
        actions:<Widget> [
          TextButton(child: const Text("Ok"),
          onPressed: (){
            Navigator.of(context).pop();
          },
           ),
        ],
      ));
    }
  }
  else{
    ScaffoldMessenger.of(context)
    .showSnackBar(const SnackBar(content: Text("Vui lòng nhập đầy đủ thông tin")));
  }
  return result;
}