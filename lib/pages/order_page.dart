
import 'package:flutter/material.dart';


// ignore: must_be_immutable
class OrderPage extends StatefulWidget {
  
  List listFood;
  List listPrice;
 
  OrderPage(this.listFood, this.listPrice, {super.key});
  @override
 
  // ignore: library_private_types_in_public_api
  _OrderPageState createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage>{
  
  calculate(){
    int totalPrice=0;
    for(var i=0; i<widget.listFood.length; i++){
      totalPrice+= int.parse(widget.listPrice[i]);
    }
    return totalPrice;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown.shade50,
      appBar: AppBar(
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
        backgroundColor: Colors.brown.shade50,
        title: const Text('Mi orden',style: TextStyle(color: Colors.black ),),
      ),
      body: Column(
        children: [
          Flexible(
            child: ListView.builder(
              itemCount: widget.listFood.length,
              itemBuilder: (_, index) {
          
                return ListTile(
                  /* leading: Text(MenuPage._MenuPageState.listFood[index].food.toString()), */
                  title:  Text(widget.listFood[index]),
                  trailing: Text(widget.listPrice[index]),
                  
                  onTap: () {
                    
                    showDialog(
                      context: context, 
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: const Text('¿Quieres aliminar este item?'),
                          content: Text(widget.listFood[index]),
                          actions:[
                            TextButton(
                              onPressed: (){
                                setState(() {
                                  /* counterDos=widget.counter--;
                                  widget.totalPrice -= int.parse(widget.listPrice[index].toString()); */
                                  widget.listFood.remove(widget.listFood[index]);
                                  widget.listPrice.remove(widget.listPrice[index]);
                                });
                                
                                Navigator.pop(context);

                              },
                              child: const Text('Elininar')

                            )
                          ],
                        );
                        
                      }
                    );
                  },
                );
          
              }
            ),
          ),

          Card(
            
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30,vertical: 15),
                  child: Text('Cantidad de roductos: ${widget.listFood.length}'),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Text('Precio: ${calculate().toString()}'),
                )
              ],
            ),
            
          ),

          Card(
            
            child: Column(
              children: [
                StreamBuilder(
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    return Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: TextField(
                        keyboardType: TextInputType.emailAddress,
                        decoration: const InputDecoration(
                          icon: Icon(Icons.watch),
                          hintText: '15/05/2025, 4:00pm',
                          labelText: 'Fecha y hora de la reserva',
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
                          icon: Icon(Icons.directions_walk),
                          hintText: 'En el lugar',
                          labelText: '¿Para llevar o comer en el lugar?',
                        ),
                        onChanged: (value){

                        },
                      ),
                    );
                  }
                )
              ],
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
              showDialog(
                context: context,
                builder: (context) => const AlertDialog(
                  backgroundColor: Colors.transparent,
                  title: Text('¡ORDEN ENVIADA!'),
                )
              );
            }, 
            child: const Text('Pedir orden',style: TextStyle(fontSize: 15))
          )
          
        ],
      ),
    );
  }
}

