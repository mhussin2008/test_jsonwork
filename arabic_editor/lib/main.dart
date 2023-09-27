import 'dart:convert';
import 'dart:ui';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/services.dart';

//updated now
import 'package:flutter/material.dart';
String arab='           ';
String arab2=arab.split(' ').reversed.join();
List<String> arabList=arab.split(' ').toList();

//String arab3='﴿           ﴾';
//String t='';



void main() {
  //arabList[6]= String.fromCharCode(61479) +  arabList[6].substring(1);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});


  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  var _myStyle = TextStyle(
      inherit: true,

      fontFamily: 'mshqq',
      color: Colors.blueAccent,

      fontSize: 20);

  List<Widget> wList(){
    List<Widget> _wl=[];
    arabList.asMap().entries.forEach((element) {
      _wl.add(GestureDetector(
        onDoubleTap: () async {
          await Clipboard.setData(ClipboardData(text: element.value));
          print(element.value);
          print(element.key);
          print(element.value.runes);
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(

                element.value,
              style:_myStyle,
            )]+
            element.value.runes.map((e) {
              
              
              return Text(' ['+e.toString()+'] ');
            }).toList()
          ,
        ),
      ));
    });
    return _wl;
  }

  Wrap _getAscii(String _input){
    List<Widget> myWidgetsList=[];


  _input.characters.toList().asMap().entries.forEach((element) {
    myWidgetsList.add(GestureDetector(
        onDoubleTap: (){
      print(_input.characters.runtimeType);
      //print(element);

      _characterTapped(element.key);

    },



      child: Text(element.value.codeUnits.toString()),
    ));

  });
    return Wrap(children:  myWidgetsList);

  }

  @override
  Widget build(BuildContext context) {


    RichText rt=RichText(
        textAlign: TextAlign.right,
        textDirection: TextDirection.rtl,
        text: TextSpan(text: arab,style: _myStyle) );


    return Scaffold(
      appBar: AppBar(

        backgroundColor: Theme
            .of(context)
            .colorScheme
            .inversePrimary,

        title: Text('Welcome'),
      ),
      body: Center(

        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(

            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Text(
                arab2,
                style: _myStyle,
                textDirection: TextDirection.rtl,
                textAlign: TextAlign.right,
              ),


              _getAscii(arab)
            ]+wList(),
          ),
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  void _characterTapped(int index) {
      print('index=$index');
    // Fluttertoast.showToast(
    //     msg: "index=$index",
    //     toastLength: Toast.LENGTH_SHORT,
    //     gravity: ToastGravity.CENTER,
    //     timeInSecForIosWeb: 1,
    //     backgroundColor: Colors.red,
    //     textColor: Colors.white,
    //     fontSize: 16.0
    // );
    
  }
}
