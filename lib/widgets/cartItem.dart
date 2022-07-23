// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/cart.dart';

class CartItem extends StatelessWidget {
  const CartItem(
      {Key? key,
      required this.id,
      required this.title,
      required this.quantity,
      required this.price, required this.productId,})
      : super(key: key);
  final String id;
  final String productId;
  final String title;
  final int quantity;
  final double price;
  @override
  Widget build(BuildContext context) {
    return Dismissible(
      direction: DismissDirection.endToStart,
      key: ValueKey(id),
      onDismissed: (direction){
        Provider.of<Cart>(context,listen: false).removeItem(productId);
      },
      background: Container(
        color: Theme.of(context).errorColor,
        padding: EdgeInsets.only(right: 20),
        alignment: Alignment.centerRight,
        child: Icon(
          Icons.delete,
          color: Colors.white,
        ),
      ),
      child: Card(
        margin: EdgeInsets.symmetric(horizontal: 15, vertical: 4),
        child: Padding(
          padding: EdgeInsets.all(8),
          child: ListTile(
            leading: CircleAvatar(
              child: Text(price.toString() ,style: TextStyle(fontSize: 15),),
            ),
            title: Text(title),
            subtitle: Text('Total : ₹ ' + (price * quantity).toString()),
            trailing: Text('$quantity x'),
          ),
        ),
      ),
    );
  }
}
