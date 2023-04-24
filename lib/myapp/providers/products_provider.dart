import 'package:flutter/material.dart';
import 'package:newmeals/myapp/providers/product.dart';
//mixin class
class Products with ChangeNotifier{
  List<Product> _items =[

    Product(
      id: 'p1',
      title: 'Red Shirt',
      description: 'A red shirt - it is pretty red!',
      price: 29.99,
      imageUrl:
      'https://assets.thehansindia.com/h-upload/2022/07/18/1303611-pro.webp',
    ),
    Product(
      id: 'p2',
      title: 'Trousers',
      description: 'A nice pair of trousers.',
      price: 59.99,
      imageUrl:
      'https://assets.thehansindia.com/h-upload/2022/07/18/1303611-pro.webp',
    ),
    Product(
      id: 'p3',
      title: 'Yellow Scarf',
      description: 'Warm and cozy - exactly what you need for the winter.',
      price: 19.99,
      imageUrl:
      'https://assets.thehansindia.com/h-upload/2022/07/18/1303611-pro.webp',
    ),
    Product(
      id: 'p4',
      title: 'A Pan',
      description: 'Prepare any meal you want.',
      price: 49.99,
      imageUrl:
      'https://assets.thehansindia.com/h-upload/2022/07/18/1303611-pro.webp',
    ),
    Product(
      id: 'p4',
      title: 'A Pan',
      description: 'Prepare any meal you want.',
      price: 49.99,
      imageUrl:
      'https://assets.thehansindia.com/h-upload/2022/07/18/1303611-pro.webp',
    ),
    Product(
      id: 'p4',
      title: 'A Pan',
      description: 'Prepare any meal you want.',
      price: 49.99,
      imageUrl:
      'https://assets.thehansindia.com/h-upload/2022/07/18/1303611-pro.webp',
    ),
    Product(
      id: 'p4',
      title: 'A Pan',
      description: 'Prepare any meal you want.',
      price: 49.99,
      imageUrl:
      'https://assets.thehansindia.com/h-upload/2022/07/18/1303611-pro.webp',
    ),
    Product(
      id: 'p4',
      title: 'A Pan',
      description: 'Prepare any meal you want.',
      price: 49.99,
      imageUrl:
      'https://assets.thehansindia.com/h-upload/2022/07/18/1303611-pro.webp',
    ),
  ];

  List<Product> get items {
    return [..._items];
  }
  Product findById(String id){
    return _items.firstWhere((prod) => prod.id == id );
  }
  void addProduct(){
    // _item.add(value);
    notifyListeners();
  }

}