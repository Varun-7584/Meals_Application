import 'package:flutter/material.dart';
import 'package:newmeals/myapp/myapp_widgets/product_item.dart';
import 'package:newmeals/myapp/providers/products_provider.dart';
import 'package:provider/provider.dart';
class ProductsGrid extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final productsData = Provider.of<Products>(context);
    final products = productsData.items;
    return
      GridView.builder(
        padding: const EdgeInsets.all(10.0),
        //how the grid should be structured
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3 / 3,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemBuilder: (ctx, i) =>
        ChangeNotifierProvider.value(
          value: products[i],
          // create: (c) => products[i],
         child:   ProductItem(
                // products[i].id,
                // products[i].title,
                // products[i].imageUrl
            ),
      ),
        itemCount: products.length,);
  }
}