import 'package:hive_flutter/hive_flutter.dart';
part 'datamodel.g.dart';

@HiveType(typeId: 1)
class DataModel {
  @HiveField(0)
  String songname;
  @HiveField(1)
  String authorname;
  @HiveField(2)
  String songpic;
  @HiveField(3)
  String url;
  @HiveField(4)
  String? id;

  DataModel(
      {required this.authorname,
      required this.songname,
      required this.songpic,
      required this.url}) {
    id = DateTime.now().microsecondsSinceEpoch.toString();
  }
}
