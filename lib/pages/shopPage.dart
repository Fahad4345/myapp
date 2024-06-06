import 'package:another_carousel_pro/another_carousel_pro.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:myapp/model/cart.dart';
import 'package:myapp/model/item.dart';
import 'package:myapp/pages/Favorite_page.dart';
import 'package:myapp/pages/cartPage.dart';
import 'package:myapp/pages/components/ShopTile.dart';
import 'package:myapp/pages/components/homeTile.dart';
import 'package:myapp/pages/home.dart';
import 'package:myapp/pages/kid.dart';
import 'package:myapp/pages/men.dart';





class Shoppage extends StatefulWidget {
  const Shoppage({super.key});
    @override
  State<Shoppage> createState ()=> _Shoppage();
}
class _Shoppage extends State<Shoppage> {
//add to cart function
  void addItemToCart(ItemInfo itemInfo) {
    Cart.userCart.add(itemInfo);
 
  }
  @override
  Widget build(BuildContext context) {
      
return Scaffold(appBar: 
  
  
  AppBar(
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
                  icon: const Icon(Icons.male, color: Colors.white),
                  onPressed: () {
                    Scaffold.of(context).openDrawer();
                  },
                ),
                title: const Text('Mens Collection',
                    style: TextStyle(color: Colors.white70)),
                onTap: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => const Men()));
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
     
        bottomNavigationBar: Container(
        color: Colors.black,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 20),
          child: GNav(
            backgroundColor: Colors.black,
            color: Colors.white,
            activeColor: Colors.white,
            gap: 8,
            tabBackgroundColor: Colors.grey.shade800,
            padding: const EdgeInsets.all(16),
            tabs: 
            const [
              GButton(icon: Icons.home,text: "Home",),
              GButton(icon: Icons.favorite,text: "Favorite"),
              GButton(icon: Icons.search,text: "Search"),
              GButton(icon: Icons.shopping_bag,text: "Cart"
              )
              ]
              ,
              ),
        ),
      ),
     
     
  body: 
      ListView.builder( 
                        
                        itemBuilder: ((context, index) {
     //ShopeTile call
                         return ShopTile(
                                itemInfo: Cart.itemshopMen[index],
                                onTap:() => addItemToCart(Cart.itemshopMen[index]) ,
                                onTaps: (){}
                            ); 
                            })
                      )
  );
  
      
       
            
         
       
          
                     
   

  }
}


