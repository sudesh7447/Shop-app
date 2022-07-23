
import 'package:flutter/material.dart';
import 'package:shop/providers/products_provider.dart';
import 'package:shop/widgets/products_item.dart';
import 'package:provider/provider.dart';
import 'product.dart';

class ProductsGrid extends StatelessWidget {
  final bool showfavs;
  const ProductsGrid({
    Key? key, required this.showfavs
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final productData = Provider.of<Products>(context);
    final allproducts = showfavs ? productData.favs : productData.items;

    return GridView.builder(
        padding: EdgeInsets.all(10),
        // ignore: prefer_const_constructors
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 3 / 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10),
        itemCount: allproducts.length,
        itemBuilder: (ctx, i) => ChangeNotifierProvider.value(value:  allproducts[i],child: ProductItem()));
  }
}
