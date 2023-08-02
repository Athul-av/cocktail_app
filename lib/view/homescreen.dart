import 'package:cocktails/controller/cocktail_controler.dart';
import 'package:cocktails/model/favorite_model.dart';
import 'package:cocktails/view/cocktailscreen.dart';
import 'package:cocktails/view/favorites.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class HomeScreen extends StatelessWidget {
 const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
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
            "Cocktails here !",
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 21, color: Colors.black),
          ),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(top: 2.h, right: 3.w),
            child: IconButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const Favorites()));
                },
                icon: const Icon(
                  Icons.favorite_outline_rounded,
                  color: Colors.black,
                )),
          )
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Padding(
                padding: EdgeInsets.fromLTRB(4.w, 2.5.h, 4.w, 0.5.h),
                child: Consumer<CocktailController>(
                  builder: (context, value, child) {
                    return TextField(
                      controller: value.searchcontroller,
                      onChanged: (keyword) {
                        value.getdatas(keyword);
                      },
                      cursorColor: const Color.fromARGB(255, 178, 178, 178),
                      cursorHeight: 24,
                      cursorWidth: 1,
                      style:
                          const TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                      decoration: InputDecoration(
                          hintText: 'Search Cocktails',
                          hintStyle: const TextStyle(
                              fontSize: 12,
                              color: Color.fromARGB(255, 153, 158, 162)),
                          contentPadding:
                              const EdgeInsets.fromLTRB(10, 5, 7, 1),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: BorderSide.none,
                          ),
                          filled: true,
                          fillColor: const Color.fromARGB(255, 226, 226, 226),
                          suffixIcon: const Icon(
                            Icons.search,
                            color: Colors.grey,
                          )),
                    );
                  },
                ),
              ),
            ),
            Expanded(
                flex: 10,
                child: Padding(
                  padding: EdgeInsets.fromLTRB(4.w, 1.5.h, 4.w, 0.5.h),
                  child: Consumer<CocktailController>(
                      builder: (context, value, child) {
                    if (value.alldata != null) {
                      return GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2, mainAxisExtent: 25.h),
                        itemBuilder: (context, index) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              InkWell(
                                onTap: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => CocktailDetails(
                                            cocktaildetails: value.alldata!,
                                            index: index,
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
                                              value.alldata!.drinks![index]
                                                  ["strDrinkThumb"]!,
                                            ),
                                            fit: BoxFit.fill)),
                                  ),
                                ),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  SizedBox(
                                    width: 35.w,
                                    height: 4.5.h,
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        value.alldata!.drinks![index]
                                            ["strDrink"]!,
                                        style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 14,
                                            color:
                                                Color.fromARGB(255, 0, 0, 0)),
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      addtoFavorite(
                                          value.alldata!.drinks![index]
                                              ["strDrinkThumb"]!,
                                          value.alldata!.drinks![index]
                                              ["strInstructions"]!,
                                          value.alldata!.drinks![index]
                                              ["strDrink"]!,
                                          context,
                                          value.alldata!.drinks![index]
                                              ["idDrink"]!);
                                    },
                                    child: const Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: Icon(
                                        Icons.favorite_outline_rounded,
                                        color: Color.fromARGB(255, 217, 57, 45),
                                        size: 20,
                                      ),
                                    ),
                                  )
                                ],
                              )
                            ],
                          );
                        },
                        itemCount: value.alldata!.drinks!.length,
                      );
                    } else if (value.isload) {
                      return const Center(
                        child: CircularProgressIndicator(
                          color: Color.fromARGB(255, 104, 187, 255),
                        ),
                      );
                    } else {
                      return const Center(
                        child: Text(
                          "no cocktails",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      );
                    }
                  }),
                ))
          ],
        ),
      ),
    );
  }

  addtoFavorite(String image, String des, String name, context, String id) {
    Favoritemodel data =
        Favoritemodel(description: des, image: image, name: name, id: id);
    Provider.of<CocktailController>(context, listen: false).addfavorite(data);
    const snackdemo = SnackBar(
      content: Text('added to favorites'),
      backgroundColor: Color.fromARGB(255, 89, 173, 233),
      elevation: 10,
      behavior: SnackBarBehavior.floating,
      margin: EdgeInsets.all(5),
      duration: Duration(seconds: 1),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackdemo);
  }
}
