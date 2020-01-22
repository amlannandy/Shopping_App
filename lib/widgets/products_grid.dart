import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/products.dart';
import '../widgets/product_item.dart';

class ProductsGrid extends StatelessWidget {

  final bool showFavorites;

  ProductsGrid(this.showFavorites);

  @override
  Widget build(BuildContext context) {

    final productData = Provider.of<Products>(context);
    final products = showFavorites ? productData.favorites : productData.items;

    return GridView.builder(
        padding: const EdgeInsets.all(10),
        itemCount: products.length,
        itemBuilder: (ctx, index) => ChangeNotifierProvider.value(
          //builder: (ctx) => products[index],
          value: products[index],
          child: ProductItem(),
        ),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3/2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
      );
  }
}