import 'package:cocktails/model/cocktail_res.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class CocktailDetails extends StatelessWidget {
  CocktailDetails(
      {super.key, required this.cocktaildetails, required this.index});
  Cocktails cocktaildetails;
  int index;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          Expanded(
              flex: 3,
              child: Center(
                child: Container(
                  height: 45.h,
                  width: 85.w,
                  decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: const BorderRadius.all(Radius.circular(30)),
                      image: DecorationImage(
                          image: NetworkImage(
                              cocktaildetails.drinks![index]["strDrinkThumb"]!),
                          fit: BoxFit.fill)),
                ),
              )),
          Expanded(
              flex: 2,
              child: Column(
                children: [
                  Text(
                    cocktaildetails.drinks![index]["strDrink"]!,
                    style: const TextStyle(
                        fontSize: 26, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 3.h,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 7.w, right: 7.w),
                    child: Text(
                      cocktaildetails.drinks![index]["strInstructions"]!,
                      style: const TextStyle(
                          color: Color.fromARGB(255, 101, 101, 101)),
                    ),
                  ),
                ],
              )),
        ],
      )),
    );
  }
}
