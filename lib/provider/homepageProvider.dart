import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomePageNotifier extends StateNotifier<bool> {
  HomePageNotifier() : super(false);
  void isbuttonclicked() {
    if (state == false) {
      state = true;
    } else {
      state = false;
    }
  }
}

// class Notifier extends StateNotifier<int> {
//   Notifier(): super(-1);
//   void getindex(){
//     if(state)
//   }
// }