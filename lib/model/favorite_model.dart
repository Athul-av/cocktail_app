import 'package:hive_flutter/adapters.dart';
part 'favorite_model.g.dart';

@HiveType(typeId:1)
class  Favoritemodel {
  @HiveField(0)
  String? name;
  
  @HiveField(1)
  String? image;

  @HiveField(2)
  String? description;

   @HiveField(3)
  String? id;

  Favoritemodel({
    required this.name,
    required this.image,
    required this.description, 
    required this.id
  });
}