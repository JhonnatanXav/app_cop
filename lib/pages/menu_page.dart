import 'dart:convert';

import 'package:application1/classes/option.dart';
import 'package:application1/pages/order_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


class MenuPage extends StatefulWidget {
   const MenuPage({super.key});

  @override
  
  // ignore: library_private_types_in_public_api
  _MenuPageState createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  var listFood =[];
  var listPrice =[];
 

  Future<List<Option>> readJsonData() async {
    final String jsonData = await rootBundle.loadString('assets/foods.json');
    final list = json.decode(jsonData) as List<dynamic>;

    return list.map((e) => Option.fromJson(e)).toList();
  }
  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
      backgroundColor: Colors.brown.shade50,
      appBar: AppBar(
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
        backgroundColor: Colors.brown.shade50,
        title: const Text('Menú',style: TextStyle(color: Colors.black ),),
      ),
      body: FutureBuilder(
        future: readJsonData(),

        builder: (context, data){
  
          if(data.hasError){
            return Center(child: Text("${data.error}"));
          } else if(data.hasData){
            var items = data.data as List<Option>;
            
            return Column(
              children: [
                
                Row(
                  children:[
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        
                        // ignore: prefer_const_literals_to_create_immutables
                        children: [
                          const Text('CAFETERÍA',style: TextStyle(fontSize: 26,fontWeight: FontWeight.w800)),
                          const Text('CUP OF COFFEE',style: TextStyle(fontSize: 26,fontWeight: FontWeight.w800)),
                          const Text('Escoge lo que más te guste:',style: TextStyle(fontSize: 18,fontWeight: FontWeight.w500))
                        ]
                      ),
                    ),
                    
                    Image.asset('images/cop_logo.png',
                        height: 110),
                    
                  ],
                ),
                
                Flexible(
                  child: ListView.builder(
                    itemCount: items.length,
                    itemBuilder: (_, index) {
                
                      return ListTile(
                        /* leading: Text(items[index].food.toString()), */
                        title: Text(items[index].food.toString()),
                        trailing: Text(items[index].price.toString()),
                        onTap: () { 
                          listFood.add(items[index].food.toString());
                          listPrice.add(items[index].price.toString());
                          showDialog(
                            context: context,
                            builder: (context) => const AlertDialog(
                              backgroundColor: Colors.transparent,
                              title: Text('¡PRODUCTO AGREGADO!'),
                             
                            )
                          );
                        },
                        
                      );
                        
                    }
                  ),
                ),

                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.brown.shade800,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute<void>(
                      builder: (BuildContext context){
                      return  OrderPage(listFood,listPrice);
                    }));
                    
                  }, 
                  child: const Text('   Ver orden   ',style: TextStyle(fontSize: 15),)
                )

              ],
            );
          } else {
            return const Center(child: CircularProgressIndicator(),);
          }
        },
      ),
      
    );
  }
}
