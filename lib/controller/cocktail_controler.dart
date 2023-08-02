import 'package:cocktails/model/cocktail_res.dart';
import 'package:cocktails/model/favorite_model.dart';
import 'package:cocktails/service/cocktail_service.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';

class CocktailController with ChangeNotifier {
  Cocktails? alldata;
  Cocktails? alldata2;
  bool isload = false;

  List<Favoritemodel> favorites = [];

  TextEditingController searchcontroller = TextEditingController();

  getdatas(String keyword) async {
    if (keyword.isEmpty) {
      alldata = null;
      alldata2 = null;
      notifyListeners();
      isload = false;
    }
    if (keyword.length == 1) {
      isload = true;
      notifyListeners();
      await CocktailsService().getalldata(keyword.toLowerCase()).then((value) {
        alldata2 = value;
        alldata = value;
        notifyListeners();
      });
    } else {
      search(searchcontroller.text.toLowerCase().trim());
      notifyListeners();
    }
  }

  void addfavorite(Favoritemodel data) {
    final db = Hive.box<Favoritemodel>('favorites');
    db.add(data);
    favorites.add(data);
    notifyListeners();
  }

  void allfavorites() {
    final db = Hive.box<Favoritemodel>('favorites');
    favorites.clear();
    favorites.addAll(db.values);
    notifyListeners();
  }

  void deletefavorite(index) {
    final db = Hive.box<Favoritemodel>('favorites');
    db.deleteAt(index);
    favorites.removeAt(index);
    notifyListeners();
  }

  search(String key) {
    if (key.isEmpty) {
      alldata = alldata2;
      notifyListeners();
    } else {
      alldata?.drinks = alldata2!.drinks!
          .where(
            (element) =>
                element["strDrink"]!.toLowerCase().contains(key.toLowerCase()),
          )
          .toList();
      notifyListeners();
    }
  }
}
