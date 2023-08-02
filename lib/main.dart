import 'package:cocktails/controller/cocktail_controler.dart';
import 'package:cocktails/model/favorite_model.dart';
import 'package:cocktails/view/homescreen.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  if (!Hive.isAdapterRegistered(FavoritemodelAdapter().typeId)) {
    Hive.registerAdapter(FavoritemodelAdapter());
  }
  await Hive.openBox<Favoritemodel>('favorites');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return ChangeNotifierProvider(
          create: (context) => CocktailController(),
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(useMaterial3: true),
            home: HomeScreen(),
          ),
        );
      },
    );
  }
}
