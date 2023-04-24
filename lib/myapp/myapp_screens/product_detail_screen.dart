import 'package:flutter/material.dart';
import 'package:newmeals/myapp/providers/products_provider.dart';
import 'package:provider/provider.dart';


class ProductDetailScreen extends StatelessWidget {
 // late final String title ;
 //  ProductDetailScreen(this.title);
  ///instead of creating a constructor extract the argument down in build :-
  static const routeName = '/product-detail-screen';
  @override
  Widget build(BuildContext context) {
  final productId =  ModalRoute.of(context)?.settings.arguments as String;
  final loadedProduct = Provider.of<Products>
    (context , listen: false )
      .findById(productId);
  //final loadedProduct = Provider.of<Products>(context).items.firstWhere((prod) =>prod.id == productId );
  //we can get access to the products of the particular id
  //listen is for the loaded widget
    return Scaffold(
      appBar: AppBar(
        title: Text(loadedProduct.title),
      ),
    );
  }
}
