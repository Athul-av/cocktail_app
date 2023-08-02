import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class CocktailDetails2 extends StatelessWidget {
  CocktailDetails2(
      {super.key, required this.name, required this.image, required this.des});
  String? name;
  String? image;
  String? des;

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
                          image: NetworkImage(image!), fit: BoxFit.fill)),
                ),
              )),
          Expanded(
              flex: 2,
              child: Column(
                children: [
                  Text(
                    name!,
                    style: const TextStyle(
                        fontSize: 26, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 3.h,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 7.w, right: 7.w),
                    child: Text(
                      des!,
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
