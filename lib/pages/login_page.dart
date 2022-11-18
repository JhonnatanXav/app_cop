import 'package:application1/pages/menu_page.dart';
import 'package:application1/pages/register_page.dart';
import 'package:flutter/material.dart';

// ignore: use_key_in_widget_constructors
class LoginPage extends StatefulWidget{
  static String id = 'login_page';

  @override
  // ignore: library_private_types_in_public_api
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage>{
  @override
  Widget build(BuildContext context){
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.brown.shade50,
        appBar: AppBar(elevation: 0,backgroundColor: Colors.brown.shade50,),
        body: Center(
          child: Column(
            children: [
              
              Image.asset('images/cop_logo.png',
              height: 200.0,
              ),
              const SizedBox(height: 15,),
              _userTextField(),
              const SizedBox(height: 15,),
              _passwordTextField(),
              const SizedBox(height: 20,),
              _bottonLogin(),
              _bottonRegister(),
            ],
          ),
        ),
      ),
    );
  }
  
  Widget _userTextField() {
    return StreamBuilder(
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: TextField(
            keyboardType: TextInputType.emailAddress,
            decoration: const InputDecoration(
              icon: Icon(Icons.email),
              hintText: 'ejemplo@email.com',
              labelText: 'correo electronico',
            ),
            onChanged: (value){

            },
          ),
        );
      }
    );
  }
  
  Widget _passwordTextField() {
    return StreamBuilder(
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: TextField(
            keyboardType: TextInputType.emailAddress,
            obscureText: true,
            decoration: const InputDecoration(
              icon: Icon(Icons.password),
              hintText: 'contraseña',
              labelText: 'contraseña',
            ),
            onChanged: (value){
              
            },
          ),
        );
      }
    );
  }
  
  Widget _bottonLogin() {
    return StreamBuilder(
      builder: (BuildContext context, AsyncSnapshot snapshot){
        return ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.brown.shade800,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
          ),
          
          onPressed: () {
            
            Navigator.push(context, MaterialPageRoute(builder: (_)=> const MenuPage()));
           
          },  
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 15),
            child: const Text('Iniciar sesión',style: TextStyle(fontSize: 15)),

          ),
        );
      }
    );
  }
  Widget _bottonRegister() {
    return StreamBuilder(
      builder: (BuildContext context, AsyncSnapshot snapshot){
        return TextButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (_)=> const RegisterPage()));
          },  
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 15),
            child: const Text('Registrase',style: TextStyle(fontSize: 15,color: Colors.black),),
          ),
        );
      }
    );
  }
  
}