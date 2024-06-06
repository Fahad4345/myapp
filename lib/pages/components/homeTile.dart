import 'package:flutter/material.dart';
import 'package:myapp/database/google_api.dart';
import 'package:myapp/model/cart.dart';
import 'package:myapp/model/item.dart';
class Hometile extends StatelessWidget {
  final String category;

  const Hometile({
    super.key,
    required this.category,
  });

  //ItemInfo itemInfo;
  //void Function()? onTap;
//  Hometile({super.key, required this.itemInfo, required this.onTap});


  Future<List<ItemInfo>> dataFetched() async {
    if (Cart.itemshopMen.isEmpty) {
      await API.fetchFromDB();
      if (category == "men") {
        return Cart.itemshopMen;
      } else if (category == "kids") {
        return Cart.itemshopKids;
      }
    }
    if (category == "men") {
      return Cart.itemshopMen;
    } else if (category == "kids") {
      return Cart.itemshopKids;
    }
    return [];
  }
  

  @override
  Widget build(BuildContext context) {

     //HomeTile
    return FutureBuilder(
      future: dataFetched(),
      builder: (context, snapshot) {

        if (!snapshot.hasData) {
          return const CircularProgressIndicator();
        }
        return Container(
          height: 200,
          child: 
        
              ListView.builder(itemCount: snapshot.data!.length,
              scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext context, int index) { 
                  //shopTile
         //image
         //Faovorite icon
         //Container desc ,price,Add button
                  return Padding(
                    padding: const EdgeInsets.only(left: 18.0),
                    child: Container(
                          width: 170,
                          height: 200,
                          decoration: BoxDecoration(
                              color: Colors.grey[100],
                              borderRadius: BorderRadius.circular(12)),
                          child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(width:190,height:100,
                                child:Image.asset(snapshot.data![index].imagepath!)
                                // FutureBuilder(
                                //       future: dataFetched(),
                                //          builder: (context, snapshot) => Image.asset(itemInfo.imagepath!),
                                //        ),
                              ),
                              Text(snapshot.data![index].title, style: TextStyle(color: Colors.grey[600])),
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
                                              snapshot.data![index].description,
                                              style: const TextStyle(
                                                  fontSize:15,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            const SizedBox(
                                              height: 5,
                                            ),
                                            Text(snapshot.data![index].price,
                                                style: const TextStyle(color: Colors.grey))
                                          ]),
                                      GestureDetector(
                                        onTap: () {
                                          Cart.userCart.add(snapshot.data![index]);
                                        },
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
                  );  },
              
              ),
            
          
        );
      }
    ); 
  
  

  }
}
