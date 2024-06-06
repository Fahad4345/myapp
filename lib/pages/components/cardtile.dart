
// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:myapp/database/google_api.dart';
import 'package:myapp/model/cart.dart';
import 'package:myapp/model/item.dart';
import 'package:myapp/pages/Favorite_page.dart';
import 'package:myapp/pages/shopPage.dart';


// ignore: must_be_immutable
class cardTile extends StatelessWidget {
  
  ItemInfo itemInfo;
  
  void Function()? onTap;
  void Function()? onTaps;
  
   cardTile({super.key, required this.itemInfo, required this.onTap, required this.onTaps});


  Future<bool> dataFetched() async {
    if (Cart.itemshopMen.isEmpty) {
      await API.fetchFromDB();
      return true;
    }
    return false;
  }
  

  @override
  Widget build(BuildContext context) {
   
   
   
    //row
    //first tile
      //cardTile
      //image
      //Faovorite icon
      //Container desc ,price,Add button
    //Second tile
     //CardTile
     //image
     //Faovorite icon
     //Container desc ,price,Add button
    return Padding(
        padding: const EdgeInsets.only(left: 18.0,top: 13),
        child: SingleChildScrollView(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
          
            
            children: [
            
            GestureDetector(
              onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context)=> const Shoppage()));},
              child: Container(
                
                width: 170,
                height: 280,
                decoration: BoxDecoration(
                    color: Colors.grey[100],
                    borderRadius: BorderRadius.circular(12)),
                child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(width:190,height:200,
                      child:FutureBuilder(
                            future: dataFetched(),
                               builder: (context, snapshot) => Image.asset(itemInfo.imagepath!),
                             ),
                    ),
                   // ignore: avoid_unnecessary_containers
                 GestureDetector( onTap:onTaps , child: Container( child: const Icon(Icons.favorite),)),
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    itemInfo.description,
                                    style: const TextStyle(
                                        fontSize:15,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Text(itemInfo.price,
                                      style: const TextStyle(color: Colors.grey))
                                ]),
                            GestureDetector(
                              onTap:onTap,
                              child: Container(
                                  padding: const EdgeInsets.all(20),
                                  width: 60,
                                  height: 55,
                                  decoration: const BoxDecoration(
                                      color: Colors.black,
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(12),
                                          bottomRight: Radius.circular(12))),
                                  child: const Icon(
                                    Icons.add,
                                    color: Colors.white70,
                                  )),
                            ),
                          ]),
                    ),
                  ],
                ),
              ),
            ),
              GestureDetector(onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>const Shoppage()));
              },
                child: Container(
                width: 170,
                height: 280,
                decoration: BoxDecoration(
                    color: Colors.grey[100],
                    borderRadius: BorderRadius.circular(12)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(width: MediaQuery.of(context).size.width,height:200,
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: FutureBuilder(
                               future: dataFetched(),
                               builder: (context, snapshot) => Image.asset(itemInfo.imagepath!),
                             )),
                    ),
                     GestureDetector( onTap:onTaps , child: Container( child: const Icon(Icons.favorite),)),
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    itemInfo.description,
                                    style: const TextStyle(
                                        fontSize:15,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Text(itemInfo.price,
                                      style: const TextStyle(color: Colors.grey))
                                ]),
                            GestureDetector(
                              onTap: onTap,
                              child: Container(
                                  padding: const EdgeInsets.all(20),
                                  width: 60,
                                  height: 55,
                                  decoration: const BoxDecoration(
                                      color: Colors.black,
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(12),
                                          bottomRight: Radius.circular(12))),
                                  child: const Icon(
                                    Icons.add,
                                    color: Colors.white70,
                                  )),
                            ),
                          ]),
                    ),
                  ],
                ),
                            ),
              ),
            const SizedBox(height: 20),
            
          ]),
        ),
      ); 
   
  

  }
}
