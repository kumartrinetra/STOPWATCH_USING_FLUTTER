import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stopwatch/myprovider.dart';

void main()
{
  runApp(MyApp());
}
class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [ChangeNotifierProvider(create: (context) => MyProvider(),)],
    child: MaterialApp(
    home: MyMainScreen(),
    debugShowCheckedModeBanner: false,
    ),);
  }
}
class MyMainScreen extends StatelessWidget {
  const MyMainScreen({super.key});
  String giveMy(int n)
  {
    if(n < 10)
      {
        return "0";
      }
    return "";
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(backgroundColor: Colors.greenAccent, title: const Center(child:  Text('My Stopwatch')),),
      body: Center(child: Consumer<MyProvider>(
        builder: (BuildContext context, value, Widget? child) {value.changeKos();
       return  Column(
         mainAxisAlignment: MainAxisAlignment.center,
         children: [
           InkWell(onTap: (){
             value.k = true;
             value.changer(value.k);
           }, onDoubleTap: (){value.k = false;
           value.changer(value.k);},
             child: Container(child: Center(child: Text('${giveMy(value.myTime[2])}${value.myTime[2]}:${giveMy(value.myTime[1])}${value.myTime[1]}:${giveMy(value.myTime[0])}${value.myTime[0]}',
               style: TextStyle(fontSize: 50, wordSpacing: 5),)),
                height: 250,width: 250,decoration: BoxDecoration(shape: BoxShape.circle ,border: Border.all(color: Colors.greenAccent, width: 3)),),
           overlayColor: MaterialStatePropertyAll(Colors.transparent),),
           const  SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
             children: [
               value.myController(),
                const SizedBox(width: 15,),
                Card(color: Colors.white,
                 child:  IconButton(icon: const Icon(Icons.refresh_rounded, color: Colors.black,), onPressed: (){value.myTime[0] = 0; value.myTime[1] = 0;
                   value.myTime[2] = 0; value.k = false;value.changer(value.k); value.notifyListeners();},),
               ),
             ],
           ),
         ],
       ); },
      )),
    );
  }
}
