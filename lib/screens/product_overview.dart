import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/providers/product.dart';
import 'package:shop/providers/products_provider.dart';
import 'package:shop/screens/cart_screen.dart';
import 'package:shop/widgets/badge.dart';
import 'package:shop/widgets/products_item.dart';

import '../providers/cart.dart';
import '../providers/products_grid.dart';

enum Filter { Favourites, all }

class ProductOverviewScreen extends StatefulWidget {
  ProductOverviewScreen({Key? key}) : super(key: key);

  @override
  State<ProductOverviewScreen> createState() => _ProductOverviewScreenState();
}

class _ProductOverviewScreenState extends State<ProductOverviewScreen> {
  var showonlyfav = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MyShop'),
        actions: [
          PopupMenuButton(
              onSelected: (Filter selectedvalue) {
                setState(() {
                  if (selectedvalue == Filter.Favourites) {
                    showonlyfav = true;
                  } else {
                    showonlyfav = false;
                  }
                });
              },
              icon: Icon(Icons.more_vert),
              itemBuilder: (_) => [
                    PopupMenuItem(
                      child: Text('Show Favourites'),
                      value: Filter.Favourites,
                    ),
                    PopupMenuItem(
                      child: Text('Show All'),
                      value: Filter.all,
                    ),
                  ]),
          Consumer<Cart>(
            builder: (_ , carth, e) => Badge(
                child: e!,
                value: carth.itemsCt.toString(),
                color: Colors.yellow),
            child: IconButton(
                onPressed: () {
                  Navigator.of(context).pushNamed(CartScreen.routeName);
                }, icon: Icon(Icons.shopping_cart)),
          )
        ],
      ),
      body: ProductsGrid(
        showfavs: showonlyfav,
      ),
    );
  }
}
