class Option{
  String? food;
  String? price;
 
 
  
  Option({this.food, this.price});
  

  Option.fromJson(Map<String,dynamic> json)
  {
    food=json['food'];
    price=json['price'];
    
  }
}