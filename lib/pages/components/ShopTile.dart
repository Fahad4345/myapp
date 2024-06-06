// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:myapp/database/google_api.dart';
import 'package:myapp/model/cart.dart';
import 'package:myapp/model/item.dart';
import 'package:myapp/pages/Favorite_page.dart';

// ignore: must_be_immutable
class ShopTile extends StatelessWidget {
 
 ItemInfo itemInfo;
 
  void Function()? onTap;
  void Function()? onTaps;
 
  ShopTile(
      {super.key,
      required this.itemInfo,
      required this.onTap,
      required this.onTaps});

  Future<bool> dataFetched() async {
    if (Cart.itemshopMen.isEmpty) {
      await API.fetchFromDB();
      return true;
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
   
   
   
    return Padding(
      padding: const EdgeInsets.only(top:8.0),
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 472,
        decoration: BoxDecoration(
            color: Colors.grey[100], borderRadius: BorderRadius.circular(12)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: 400,
              height: 370,
              child: FutureBuilder(
                future: dataFetched(),
                builder: (context, snapshot) => Image.asset(itemInfo.imagepath!),
              ),
            ),
            // ignore: avoid_unnecessary_containers
            GestureDetector(
                onTap: onTaps,
                child: Container(
                  child: const Icon(Icons.favorite),
                )),
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
                                fontSize: 30, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            height: 2,
                          ),
                          Text(itemInfo.price,
                              style: const TextStyle(
                                  color: Colors.grey, fontSize: 23))
                        ]),
                    GestureDetector(
                      onTap: onTap,
                      child: Container(
                          padding: const EdgeInsets.all(20),
                          width: 130,
                          height: 70,
                          decoration: const BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(12),
                              )),
                          child: const Icon(
                            Icons.add,size: 40,
                            color: Colors.white70,
                          )),
                    ),
                  ]),
            ),
          ],
        ),
      ),
    );
  }
}
