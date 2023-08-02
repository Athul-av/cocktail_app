import 'package:cocktails/controller/cocktail_controler.dart';
import 'package:cocktails/view/cocktailscreen2.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class Favorites extends StatelessWidget {
  const Favorites({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) =>
        Provider.of<CocktailController>(context, listen: false).allfavorites());
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          surfaceTintColor: Colors.white,
          leading: Padding(
            padding: EdgeInsets.only(left: 3.w, top: 1.h),
            child: const Image(image: AssetImage('assets/Blue_Cocktail.png')),
          ),
          title: Padding(
            padding: EdgeInsets.only(top: 3.h),
            child: const Text(
              "Your Favorites",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 21,
                  color: Colors.black),
            ),
          ),
        ),
        body: Padding(
          padding: EdgeInsets.fromLTRB(4.w, 3.h, 4.w, 0.5.h),
          child: Consumer<CocktailController>(
            builder: (context, value, child) {
              if (value.favorites.isNotEmpty) {
                return GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, mainAxisExtent: 24.h),
                  itemBuilder: (context, index) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => CocktailDetails2(
                                      des: value.favorites[index].description,
                                      name: value.favorites[index].name,
                                      image: value.favorites[index].image,
                                    )));
                          },
                          child: Card(
                            color: Colors.black,
                            child: Container(
                              height: 18.h,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(13),
                                  image: DecorationImage(
                                      image: NetworkImage(
                                        value.favorites[index].image!,
                                      ),
                                      fit: BoxFit.fill)),
                            ),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                value.favorites[index].name!,
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14,
                                    color: Color.fromARGB(255, 0, 0, 0)),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                value.deletefavorite(index);
                              },
                              child: const Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Icon(
                                  Icons.delete_outline,
                                  color: Color.fromARGB(255, 195, 76, 76),
                                  size: 20,
                                ),
                              ),
                            )
                          ],
                        )
                      ],
                    );
                  },
                  itemCount: value.favorites.length,
                );
              } else {
                return const Center(
                  child: Text(
                    "no favorites",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                );
              }
            },
          ),
        ));
  }
}
