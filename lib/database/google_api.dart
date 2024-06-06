import 'dart:convert';
import 'package:http/http.dart';
import 'package:myapp/model/cart.dart';
import 'package:myapp/model/item.dart';

class API {
  static const String _api = "https://script.google.com/macros/s/AKfycbwGelQzjdDFXMcFkEemhGCq_E0CUvCkus9UdhKZiVOYXp8Zf52-GP6TQBAoJjo-rdIt/exec";


  static Future<int> fetchFromDB() async {
    Response response = await get(Uri.parse(_api));
    dynamic data = await json.decode(response.body);

    Cart.itemshopMen = [];
    Cart.itemshopKids = [];

    for (var item in data["data"]) {

      if (item["category"] == "kids") {
        Cart.itemshopKids.add(ItemInfo(
          title: item["type"],
          description: item["desc"],
          price: item["price"].toString(),
          imagepath: item["image"],
          category: item["category"],
        ));
      }
      if (item["category"] == "men") {
        Cart.itemshopMen.add(ItemInfo(
          title: item["type"],
          description: item["desc"],
          price: item["price"].toString(),
          imagepath: item["image"],
          category: item["category"],
        ));
      }

      
    }

    return 0;
    
  }

}
