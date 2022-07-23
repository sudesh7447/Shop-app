import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/providers/product.dart';

import '../providers/cart.dart';
import '../screens/product_detail.dart';

class ProductItem extends StatelessWidget {

  const ProductItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final productH = Provider.of<Product>(context);
    final carth = Provider.of<Cart>(context,listen: false);
    return Consumer<Product>(
      builder: (ctx , product , child) => ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: GridTile(
          child: GestureDetector(
            onTap: (){
              Navigator.of(context).pushNamed(ProductDetailScreen.RouteName ,arguments: product.id);
            },
            child: Image.network(
              product.imageUrl,
              fit: BoxFit.cover,
            ),
          ),
          footer: GridTileBar(
            backgroundColor: Colors.black87,
            leading: IconButton(
              icon: Icon(product.isFavourite ? Icons.favorite : Icons.favorite_border ),
              color: Theme.of(context).accentColor,
              onPressed: () {
                product.toggleFav();
              },
            ),
            title: Text(
              product.title,
              textAlign: TextAlign.center,
            ),
            trailing: IconButton(
              onPressed: () {
             carth.additems(product.id, product.title, product.price);
              },
              color: Colors.yellow,
              icon: Icon(Icons.shopping_cart_checkout),
            ),
          ),
        ),
      ) ,

    );
  }
}
