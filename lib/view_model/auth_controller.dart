import 'package:flutter/material.dart';
import 'package:http/http.dart';

class Auth_Controller with ChangeNotifier{


  bool _isLoading=false;
  bool get isLoading=>_isLoading;


  setisLoading(bool value ){
    _isLoading=value;
    notifyListeners();
  }

  void AuthApi(String email , String password)async{
    setisLoading(true);
   try{
     Response response=await post(Uri.parse('https://reqres.in/api/login'),
       body:{
          'email': email,
          'password': password,
     });
     if(response.statusCode==200){
       print("Suvessfullly authenticated");
       setisLoading(false);
     }else{
       print(" Failed");
       setisLoading(false);


     }

   } catch(e){
      print("Error : $e");
      setisLoading(false);

   }
  }
}