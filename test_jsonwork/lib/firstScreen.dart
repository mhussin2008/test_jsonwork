import 'dart:convert';

import 'package:cupertino_icons/cupertino_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_treeview/flutter_treeview.dart';
import '../data/new_dawa.dart';

List<Node<dynamic>> mynodes = <Node>[];

class SimpleTreeView extends StatefulWidget {
  const SimpleTreeView({super.key});

  @override
  State<SimpleTreeView> createState() => _SimpleTreeViewState();
}

class _SimpleTreeViewState extends State<SimpleTreeView> {
  var selkey = 'docs';

  @override
  void initState() {
    // TODO: implement initState
    dataLoad().then((_) => print('done'));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    TreeViewController TVC =
        TreeViewController(children: mynodes, selectedKey: selkey);

    return Scaffold(
      appBar: AppBar(

        backgroundColor: Theme.of(context).colorScheme.inversePrimary,

        title: Text('ddd'),
      ),
      body: Center(

          child: mynodes.isEmpty?
          Container(height: double.infinity,width: double.infinity,color: Colors.cyan,):
          TreeView(controller: TVC)
      ),

    );




  }

  Future<void> dataLoad() async {
    final String response =
        await rootBundle.loadString('assets/text/jsondata.json');
    List<dynamic> data = await json.decode(response);
    List<mainHeader> myHeaders = <mainHeader>[];
    print(data.length);
    data.forEach((element) {
      myHeaders.add(mainHeader.fromJson(element));
    });

    //print(myHeaders[0].topics![0].nestedTopics![7].nestedTopicsB![2].title);
    myHeaders.forEach((element) {
      List<Node> tempNodes = <Node>[];

      if (element.sectionName != null) {
        element.topics!.forEach((subelement) {
          print(subelement.header);
          tempNodes.add(
              Node(key: subelement.header!,label:subelement.header! )
          );
        });
        print(tempNodes);
        mynodes
            .add(Node(key: element.sectionName!, label: element.sectionName!,children: tempNodes));
        //tempNodes.clear();
      }
    });
  }
}
