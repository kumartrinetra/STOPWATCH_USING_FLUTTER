import 'dart:async';
import 'package:flutter/material.dart';
class MyProvider extends ChangeNotifier{
  List<int> myTime = [0, 0, 0];
  bool k = false;
  Duration myDur = const Duration(days: 365);
  void changeKos()
  {
    Future.delayed(myDur, (){myTime[0]++; if(myTime[0] == 60){
      myTime[1]++;
      myTime[0] = 0;
    } if(myTime[1] == 60){myTime[2]++; myTime[1] = 0;} notifyListeners();});
    /*Future.delayed(const Duration(seconds: 2), (){
      myTime[1]++;
      notifyListeners();
    });
    Future.delayed(const Duration(milliseconds: 2), (){
      myTime[0]++; notifyListeners();
    });*/

  }
  void changer(bool k)
  {
    if(k)
    {
      myDur = const Duration(microseconds: -1);
      //changeKos();
      notifyListeners();
    }
    else{
      myDur = const Duration(days: 365);
      //changeKos();
      notifyListeners();
    }
  }
  Card myController(){
    if(k)
      {
        return Card(child: IconButton(onPressed: (){k = false;changer(k); notifyListeners();}, icon: const Icon(Icons.stop_rounded, color: Colors.black,)), color: Colors.white,);
      }
    return Card(child: IconButton(onPressed: (){k = true;changer(k); notifyListeners();}, icon: const Icon(Icons.play_arrow_rounded, color: Colors.black,)), color: Colors.white,);
  }
  @override
  void notifyListeners() {
    // TODO: implement notifyListeners
    super.notifyListeners();
  }
}