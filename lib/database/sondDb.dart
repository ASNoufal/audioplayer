import 'package:audio_player/model/datamodel.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

const dbname = "opened songdatabase";

abstract class Songdata {
  Future<void> addsongdata(DataModel dataModel);
  Future<List<DataModel>> getsongdata();
}

class Songdb implements Songdata {
  ValueNotifier<List<DataModel>> songvalueNotifier = ValueNotifier([]);
  @override
  Future<void> addsongdata(DataModel dataModel) async {
    final openbox = await Hive.openBox<DataModel>(dbname);
    await openbox.put(dataModel.id, dataModel);
  }

  Future<void> refreshui(String id) async {
    final allsongdatalist = await getsongdata();
    songvalueNotifier.value.clear();
    songvalueNotifier.value.addAll(allsongdatalist);
    songvalueNotifier.notifyListeners();
  }

  @override
  Future<List<DataModel>> getsongdata() async {
    final openbox = await Hive.openBox<DataModel>(dbname);
    return openbox.values.toList();
  }
}
