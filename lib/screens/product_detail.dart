import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/product.dart';
import '../providers/products_provider.dart';

class ProductDetailScreen extends StatelessWidget {
  // final Product product;
  static const RouteName = "/product-detail";

  const ProductDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final productid = ModalRoute.of(context)!.settings.arguments as String;
    final loadedproduct = Provider.of<Products>(context).findById(productid);

    return Scaffold(
      appBar: AppBar(
        title: Text(loadedproduct.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 300,
              width: double.infinity,
              child: Image.network(
                loadedproduct.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 10,),
            Text(loadedproduct.price.toString() , style: TextStyle(color: Colors.grey ,fontSize: 30),),
            SizedBox(height: 10,),
            Text(loadedproduct.description ,textAlign: TextAlign.center, softWrap: true,style: TextStyle(),)
          ],
        ),
      ),
    );
  }
}
