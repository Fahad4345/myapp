// ignore_for_file: non_constant_identifier_names, prefer_const_constructors, dead_code

import 'package:flutter/material.dart';

import 'package:myapp/model/item.dart';
import 'package:myapp/pages/Favorite_page.dart';
import 'package:myapp/pages/components/cart_item.dart';
import 'package:myapp/pages/home.dart';
import 'package:myapp/pages/kid.dart';
import 'package:myapp/pages/men.dart';

import '../model/cart.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => CartPageState();
}

class CartPageState extends State<CartPage> {

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(

      backgroundColor: Colors.grey[200],
      
      //AppBar
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
        child: ListView(
          children: [
            DrawerHeader(
                child: const Center(
                  child: Text("Outfitter",
                      style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 50,
                          fontStyle: FontStyle.italic,
                          color: Colors.white70)),
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
                icon: const Icon(Icons.favorite, color: Colors.white),
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
              ),
              title: const Text('Favorites',
                  style: TextStyle(color: Colors.white70)),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const Favorite()));
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
     
     //Body 
      //Text heading
      //ListView                
      body: Column(children: [
      
      Padding(
        padding: EdgeInsets.symmetric(horizontal: 2.5),
        child: Column(children: [
          Text('My Cart',
              style:
                  TextStyle(fontWeight: FontWeight.bold, fontSize: 24)),
          ListView.separated(
            itemCount: Cart.userCart.length,
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            itemBuilder: (context, index) {
            ItemInfo itemInfo = Cart.userCart[index];
            return CartItem(index: index, itemInfo: itemInfo);
          }, separatorBuilder: (BuildContext context, int index) {   return Divider(height: 3,thickness: 3,);},),
        ])),
    ]));
  }
}
