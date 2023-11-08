import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../screens/product_detail_screen.dart';
import '../providers/product.dart';
class ProductItem extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {
    Provider.of<Product>(context);
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: GridTile(
        child: GestureDetector(
          onTap: () {
            Navigator.of(context).pushNamed(
              ProductDetailScreen.routeName,
              arguments: id,
            );
          },
          child: Image.network(
            imageUrl,
            fit: BoxFit.cover,
          ),
        ),
        footer: GridTileBar(
          backgroundColor: Colors.black87,
          leading: IconButton(
            icon: Icon(Icons.favorite_border_outlined),
            color: Theme.of(context).accentColor,
            onPressed: () {

            },
          ),
          title: Text(
            title,
            textAlign: TextAlign.center,
          ),
          trailing: IconButton(
            icon: Icon(
              Icon.shopping_cart,
              ),
              onPressed: () {},
              color: Theme.of(context).accentColor,
          ),
        ),
      ),
    );
  }
}
