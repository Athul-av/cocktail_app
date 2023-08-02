import 'dart:developer';

import 'package:cocktails/model/cocktail_res.dart';
import 'package:dio/dio.dart';

class CocktailsService{

  Dio dio = Dio();

  Future<Cocktails?> getalldata(String key)async{
     
     String path = 'https://www.thecocktaildb.com/api/json/v1/1/search.php?f=$key';

     try {
 
      Response res = await dio.get(path);
      if (res.statusCode == 200 || res.statusCode == 201) {
        final json = res.data;
        Cocktails data = Cocktails.fromJson(json);
        
        return data;
      }
       
     }on DioException catch (e) {
       log(e.message.toString());
     }
     return null;
  } 
}