import 'package:flutter/material.dart';

class cartItem {
  final String id;
  final String title;
  final int quantity;
  final double price;

  cartItem(
      {required this.id,
      required this.title,
      required this.quantity,
      required this.price});
}

class Cart with ChangeNotifier {
   final Map<String, cartItem> _items={};

  Map<String, cartItem> get items {
    print(_items[0]);
    return {..._items};
  }

  int get itemsCt {
    return _items.length;
  }

  double get TotalAmount{
    double tot = 0;
    _items.forEach((key, value) {
      tot+= value.quantity * value.price;
    });
    return tot;
  }

  void additems(String ProductID , String title , double price){
    print(ProductID);
    print(title);
    print(price);
      if(_items.containsKey(ProductID)){
        print("Hello");
        _items.update(ProductID, (existingItem) => cartItem(id: existingItem.id, title: existingItem.title, quantity: existingItem.quantity+1  , price: existingItem.price));
      }
      else{
        print("Hello123");
        _items.putIfAbsent(ProductID, () {
          print("ho $ProductID");
          return cartItem(id: DateTime.now().toString(), title: title, quantity: 1, price: price);
        });
        print("_items[0");
        print(_items[0]?.title);
      }
      notifyListeners();
  }
 void removeItem (productId){
    _items.remove(productId);
    notifyListeners();
 }
}

