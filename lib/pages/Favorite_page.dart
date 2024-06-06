// ignore_for_file: non_constant_identifier_names, prefer_const_constructors, dead_code

import 'package:flutter/material.dart';
import 'package:myapp/model/favorite_cart.dart';

import 'package:myapp/model/item.dart';
import 'package:myapp/pages/cartPage.dart';
import 'package:myapp/pages/components/cart_item.dart';
import 'package:myapp/pages/components/favorite_Item.dart';
import 'package:myapp/pages/home.dart';
import 'package:myapp/pages/kid.dart';
import 'package:myapp/pages/men.dart';

import '../model/cart.dart';

class Favorite extends StatelessWidget {
  const Favorite({super.key});
  @override
 
  Widget build(BuildContext context) {
  return Scaffold(
      
      backgroundColor: Colors.grey[200],
    
    //Appbar
    appBar: AppBar(
      leading: Builder(
        builder: (context) => IconButton(
          icon: const Icon(Icons.menu, color: Colors.white),
          onPressed: () {
            Scaffold.of(context).openDrawer();
          },
        )),
      backgroundColor: Colors.grey[900],
      title: const Center(
        child: Text(
          'Outfitters',
          style: TextStyle(
              fontSize: 55,
              fontWeight: FontWeight.w900,
              fontStyle: FontStyle.italic,
              color: Colors.white),
        ),
      )),
    
    //Drawer
    drawer: Drawer(
        backgroundColor: Colors.grey[900],
        child: Container(
          child: ListView(
            children: [
              DrawerHeader(
                  child: Container(
                child: const Center(
                  child: Text("Outfitter",
                      style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 50,
                          fontStyle: FontStyle.italic,
                          color: Colors.white70)),
                ),
              )),
              ListTile(
                  leading: IconButton(
                    icon: Icon(Icons.home, color: Colors.white),
                    onPressed: () {
                      Scaffold.of(context).openDrawer();
                    },
                  ),
                  title: const Text(
                    'Home',
                    style: TextStyle(color: Colors.white70),
                  ),
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Home()));
                  })
               ,
              ListTile(
                leading: IconButton(
                  icon: const Icon(Icons.male, color: Colors.white),
                  onPressed: () {
                    Scaffold.of(context).openDrawer();
                  },
                ),
                title: const Text('Men Collection',
                    style: TextStyle(color: Colors.white70)),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Men()));
                },
              ),
              ListTile(
                leading: IconButton(
                  icon: const Icon(Icons.male, color: Colors.white),
                  onPressed: () {
                    Scaffold.of(context).openDrawer();
                  },
                ),
                title: const Text('Kids Collection',
                    style: TextStyle(color: Colors.white70)),
                onTap: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => kids()));
                },
              ),
              ListTile(
                leading: IconButton(
                  icon: const Icon(Icons.shopping_bag, color: Colors.white),
                  onPressed: () {
                    Scaffold.of(context).openDrawer();
                  },
                ),
                title: const Text('Cart', style: TextStyle(color: Colors.white70)),
                onTap: () {
                  print("object");
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> CartPage()));
                },
              ),
              const SizedBox(height: 200),
              SizedBox(
                width: 100,
                height: 50,
                child: ElevatedButton(
                    onPressed: () {},
                    child: const Text('Admin Mode',
                        style: TextStyle(
                            color: Colors.black87,
                            fontWeight: FontWeight.bold))),
              ),
            ],
          ),
        ),
      ),
 
    //body
    //text heading
    //ListView                
    body: Column(children: [
      
      Padding(
        padding: EdgeInsets.symmetric(horizontal: 2.5),
        child: Column(children: [
          Text('My Favorite',
              style:
                  TextStyle(fontWeight: FontWeight.bold, fontSize: 24)),
          ListView.separated(
            itemCount: F_cart.Fav_cart.length,
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            itemBuilder: (context, index) {
            ItemInfo itemInfo = F_cart.Fav_cart[index];
            return FavoriteItem( index:index ,itemInfo: itemInfo);
          }, separatorBuilder: (BuildContext context, int index) {   return Divider(height: 3,thickness: 3,);},),
        ])),
    ]));
  }
}
