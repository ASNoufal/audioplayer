import 'package:hive_flutter/hive_flutter.dart';
part 'username.g.dart';

@HiveType(typeId: 2)
class Username {
  @HiveField(0)
  String name;

  Username({required this.name});
}

late Box box;
