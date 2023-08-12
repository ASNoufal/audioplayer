import 'package:audio_player/kvalues.dart';
import 'package:audio_player/model/datamodel.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

const dbname = "opened songdatabase";

abstract class Songdata {
  Future<void> addsongdata(DataModel dataModel);
  Future<List<DataModel>> getsongdata();
  Future<void> deletesongdata(String id);
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
}
