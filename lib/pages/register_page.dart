
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
   const RegisterPage({super.key});

  @override
  
  // ignore: library_private_types_in_public_api
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown.shade50,
      appBar: AppBar(
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
        backgroundColor: Colors.brown.shade50,
        title: const Text('Registro',style: TextStyle(color: Colors.black ),),
      ),
      body: Column(
        children: [
          const SizedBox(height: 25,),
          StreamBuilder(
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              return Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: TextField(
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                    icon: Icon(Icons.text_fields),
                    labelText: 'Nombre',
                  ),
                  onChanged: (value){

                  },
                ),
              );
            }
          ),
          StreamBuilder(
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              return Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: TextField(
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                    icon: Icon(Icons.email),
                    labelText: 'Correo electrónico',
                  ),
                  onChanged: (value){

                  },
                ),
              );
            }
          ),
          StreamBuilder(
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              return Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: TextField(
                  obscureText: true,
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                    icon: Icon(Icons.password),
                    labelText: 'Contraseña',
                  ),
                  onChanged: (value){

                  },
                ),
              );
            }
          ),
          const SizedBox(height: 15,),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.brown.shade800,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
            ),
            onPressed: () {
              
              
            }, 
            child: const Text('   Registrarse   ',style: TextStyle(fontSize: 15),)
          )
        ],
      ),
    );
  }
}
