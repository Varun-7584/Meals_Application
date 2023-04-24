import 'package:flutter/material.dart';
// import 'package:flutter/rendering.dart';
// import 'package:newmeals/myapp/myapp_models/product.dart';
import '../myapp_widgets/products_grid.dart';
// import 'package:newmeals/myapp/myapp_widgets/product_item.dart';
class ProductOverviewScreen extends StatelessWidget {
  static const String routeName = 'prdovr';

  @override
  Widget build(BuildContext context) {
    return
      Scaffold(
        appBar: AppBar(
          title: Text('MY Shop'),
        ),
        body: ProductsGrid()
          // body: new ProductsGrid(loadedProducts : loadedProducts)
      );
  }
}
