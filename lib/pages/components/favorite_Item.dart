import 'package:flutter/material.dart';
import 'package:myapp/model/favorite_cart.dart';
import 'package:myapp/model/item.dart';
import 'package:myapp/pages/Favorite_page.dart';


class FavoriteItem extends StatefulWidget {
  ItemInfo itemInfo;
  int index;
   FavoriteItem({super.key, required this.itemInfo, required this.index});

  @override
  _FavoriteItemState createState() => _FavoriteItemState();
}

class _FavoriteItemState extends State<FavoriteItem> {
  @override
  Widget build(BuildContext context) {
    return ListTile( leading:Image.asset(widget.itemInfo.imagepath ?? "assets/images/1.jpg"),title:Text(widget.itemInfo.title),subtitle: Text(widget.itemInfo.price),trailing: IconButton(icon: const Icon(Icons.remove,), onPressed: () {   F_cart.Fav_cart.removeAt(widget.index);},),);
  }
}

