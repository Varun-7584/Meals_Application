import 'package:flutter/material.dart';
import 'package:newmeals/myapp/myapp_screens/product_detail_screen.dart';
import 'package:provider/provider.dart';

import '../providers/product.dart';

class ProductItem extends StatefulWidget {
  @override
  State<ProductItem> createState() => _ProductItemState();
}

class _ProductItemState extends State<ProductItem> {
  // late final String id;
  @override
  Widget build(BuildContext context) {
    final product = Provider.of<Product>(context , listen: true );
    //no  200 , if changed
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: GridTile(
        child: GestureDetector(
          onTap: () {
          //   Navigator.of(context).push(
          //       MaterialPageRoute(builder: (ctx) => ProductDetailScreen(title),),);
          ///rather than doing this and making a constructor on product_detail_Screen
            ///create a named route
            Navigator.of(context).pushNamed(ProductDetailScreen.routeName ,
            arguments: product.id );
            ///after the argument create a modal route in product details screen \

           },
          child: Image.network(
            product.imageUrl,
            fit: BoxFit.cover,
          ),
        ),
        footer: GridTileBar(
          backgroundColor: Colors.black87,
          leading: IconButton(
            icon: Icon(product.isFavorite ? Icons.favorite :Icons.favorite_border),
            onPressed: () {
              product.toggleFavoriteStatus();
            },
            color: Colors.green.shade700,
          ),
          title: Text(
            product.title,
            textAlign: TextAlign.center,
          ),
          trailing: IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () {},
            color: Colors.green.shade700,
          ),
        ),
      ),
    );
  }
}
