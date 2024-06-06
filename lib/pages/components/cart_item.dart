import 'package:flutter/material.dart';
import 'package:myapp/model/cart.dart';
import 'package:myapp/model/item.dart';
import 'package:myapp/pages/cartPage.dart';

class CartItem extends StatefulWidget {
  ItemInfo itemInfo;
  int index;
  
   CartItem({super.key, required this.itemInfo, required this.index});

  @override
  _cartItemState createState() => _cartItemState();
}

class _cartItemState extends State<CartItem> {
  @override
  Widget build(BuildContext context) {
    return ListTile( leading:Image.asset(widget.itemInfo.imagepath ?? "assets/images/1.jpg"),title:Text(widget.itemInfo.title),subtitle: Text(widget.itemInfo.price),trailing: IconButton(icon: const Icon(Icons.remove,), onPressed: () {
      Cart.userCart.removeAt(widget.index);
    },),);
  }
}
