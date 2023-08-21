import 'dart:io';

import 'package:audio_player/kvalues.dart';
import 'package:audio_player/model/datamodel.dart';
import 'package:audio_player/model/username.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

const dbname = "opened songdatabase";
const profiledb = "opened the profilepic";

abstract class Songdata {
  Future<void> addsongdata(DataModel dataModel);
  Future<List<DataModel>> getsongdata();
  Future<void> deletesongdata(String id);
  Future<void> username(Username name);
  Future<void> getusername();
}

class Songdb implements Songdata {
  Songdb._interval();

  static final instance = Songdb._interval();

  factory Songdb() {
    return instance;
  }

  ValueNotifier<List<DataModel>> songvalueNotifier = ValueNotifier([]);
  @override
  Future<void> addsongdata(DataModel dataModel) async {
    final openbox = await Hive.openBox<DataModel>(dbname);
    await openbox.put(dataModel.authorname, dataModel);
  }

  Future<void> refreshui() async {
    final allsongdatalist = await getsongdata();
    songvalueNotifier.value.clear();
    for (var element in allsongdatalist) {
      songvalueNotifier.value.add(element);
    }

    songvalueNotifier.notifyListeners();
  }

  @override
  Future<List<DataModel>> getsongdata() async {
    final openbox = await Hive.openBox<DataModel>(dbname);
    return openbox.values.toList();
  }

  @override
  Future<void> deletesongdata(String id) async {
    final openbox = await Hive.openBox<DataModel>(dbname);
    print("delete $id");
    await openbox.delete(id);
    refreshui();
  }

  @override
  String toString() {
    "${songvalueNotifier.value}";
    return super.toString();
  }

  @override
  Future<void> username(Username name) async {
    final openbox = await Hive.openBox<Username>(profiledb);
    await openbox.put("Id", name);
  }

  @override
  Future<Username?> getusername() async {
    final openbox = await Hive.openBox<Username>(profiledb);
    return openbox.get("id");
  }

  // @override
  // Future<String> getname()async  {
  //   final openbox =  Hive.openBox<String>("name");
  //    return openbox.values;
  // }

  // @overridef
  // Future<void> addprofilepicture(String data) async {
  //   final openbox = await Hive.openBox(profiledb);
  //    await openbox.add(data);
}
