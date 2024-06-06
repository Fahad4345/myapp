// ignore_for_file: avoid_unnecessary_containers, non_constant_identifier_names, no_logic_in_create_state, dead_code

import 'package:flutter/material.dart';
import 'package:myapp/database/google_api.dart';
import 'package:myapp/model/favorite_cart.dart';
import 'package:myapp/model/item.dart';
import 'package:myapp/pages/Favorite_page.dart';
import 'package:myapp/pages/cartPage.dart';
import 'package:myapp/pages/components/cardtile.dart';
import 'package:myapp/model/cart.dart';
import 'package:myapp/pages/home.dart';
import 'package:myapp/pages/men.dart';

class kids extends StatefulWidget {
  const kids({super.key});

  @override
  State<kids> createState() => _kids();
}

class _kids extends State<kids> {
   
   //Add to  cart Function
   void addItemToCart(ItemInfo itemInfo) {
    Cart.userCart.add(itemInfo);
    print("hello");
  }
   
   //add to Favourite
   void addfavToCart(ItemInfo itemInfo) {
    F_cart.Fav_cart.add(itemInfo);
    print("he");
    
  }

   Future<List<ItemInfo>> dataFetched() async {
    if (Cart.itemshopKids.isEmpty) {
      await API.fetchFromDB();
      return Cart.itemshopKids;
    }
    return Cart.itemshopKids;
  }

  @override
  Widget build(BuildContext context) {
  return Scaffold(
     
     backgroundColor: Colors.grey[300],
    
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
                    icon: const Icon(Icons.home, color: Colors.white),
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
                        MaterialPageRoute(builder: (context) => const Home()));
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
                      MaterialPageRoute(builder: (context) => const Men()));
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
                      context, MaterialPageRoute(builder: (context) => const kids()));
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
                  print("object");
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> const CartPage()));
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
     
     // body
     body: Center(
        child: FutureBuilder(
          future: dataFetched(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                  itemCount: Cart.itemshopKids.length,
                  scrollDirection: Axis.vertical,
                  itemBuilder: ((context, index) {
                    return cardTile(
                        itemInfo: Cart.itemshopKids[index], onTap: () => addItemToCart(Cart.itemshopKids[index]), onTaps: () => addfavToCart(F_cart.Fav_cart[index]));
                  })
              );
            }
            return const CircularProgressIndicator();
          }
        ),
      ),
    );
  }
}
