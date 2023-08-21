import 'dart:io';

import 'package:hive_flutter/hive_flutter.dart';
part 'profilepicture.g.dart';

@HiveType(typeId: 3)
class ProfilePicture {
  @HiveField(0)
  String? profilepic;
  ProfilePicture({required this.profilepic});
}

late Box profilebox;
