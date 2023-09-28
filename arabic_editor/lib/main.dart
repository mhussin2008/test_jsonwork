import 'dart:convert';
import 'dart:ui';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/services.dart';

//updated now
import 'package:flutter/material.dart';
String arab='           ';
String arab2=arab.split(' ').reversed.join();
List<String> arabList=arab.split(' ').toList();
String tailoredString='';

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
  var _myStyle2 = TextStyle(
      inherit: true,

      fontFamily: 'mshqq',
      color: Colors.red,


      fontSize: 30);

  List<Widget> wList(){
    List<Widget> _wl=[];
    arabList.asMap().entries.forEach((element) {
      _wl.add(GestureDetector(
        onTap: () async {
          //await Clipboard.setData(ClipboardData(text: element.value));
          //tailoredString+=String.fromCharCode(element.value)
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
            )]..addAll(element.value.runes.map((e) {
            return GestureDetector(
              onTap: (){
                print(e.runtimeType);

                setState(() {
                  tailoredString=String.fromCharCode(e)+tailoredString;
                });
              },
              child: Column(
                children: [
                  Text(
                      String.fromCharCode(e),
                    style: _myStyle2,

                  )
                  ,
                  Text(' ['+e.toString()+'] '),
                ],
              ),
            );
          }) )
            
          ,
        ),
      ));
    });
    return  _wl;
  }

  Wrap _getAscii(String _input){
    List<Widget> myWidgetsList=[];


  _input.characters.toList().asMap().entries.forEach((element) {
    myWidgetsList.add(GestureDetector(
        onTap: (){
      print(_input.characters.runtimeType);
      print(element);
      //tailoredString+=String.fromCharCode(element.value.);
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
          child: SingleChildScrollView(
            child: Column(

              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                SizedBox(height: 10,),

                Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    IconButton(onPressed: (){
                      if(tailoredString.length>0){
                        setState(() {
                          tailoredString=tailoredString.substring(1);
                        });
                      }
                    },
                        icon: Icon(Icons.backspace,size: 20,)),
                    Text(tailoredString
                    ,style: _myStyle2,
                    ),
                  ],
                ),
                Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ElevatedButton(onPressed: ()  {
                      setState(()  {

                        //rejoin();
                        //Clipboard.setData(ClipboardData(text:''));
                        tailoredString='';
                        //rejoin();
                      });
                    }, child: Text('Clear clipboard')),
                    ElevatedButton(onPressed: ()  {
                      setState(()  {

                        //rejoin();
                        Clipboard.setData(ClipboardData(text:tailoredString));
                      });
                    }, child: Text('Set to clipboard')),

                    ElevatedButton(onPressed: () async {
                      await rejoin();
                      setState(()  {

                        //Clipboard.setData(ClipboardData(text: element.value));
                      });
                    }, child: Text('get from clipboard')),
                  ],
                ),

                SizedBox(height: 20,),
                Text(
                  arab2,
                  style: _myStyle,
                  textDirection: TextDirection.rtl,
                  textAlign: TextAlign.right,
                ),


                //_getAscii(arab)
              ]+ wList(),
            ),
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

  Future<void> rejoin() async {
    ClipboardData? data= await Clipboard.getData(Clipboard.kTextPlain);
    arab=data!.text??'';
    arab2=arab.split(' ').reversed.join();
    arabList=arab.split(' ').toList();
    wList();
  }
}
