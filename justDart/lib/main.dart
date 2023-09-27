import 'dart:convert';

typedef Json=Map<String,dynamic>;
Map<String, dynamic> myjson={
  "greeting": "Welcome to quicktype!",
  "instructions": [
    "Type or paste JSON here",
    "Or choose a sample above",
    "quicktype will generate code in your",
    "chosen language to parse the sample data"
  ]
};

void main(){




  Welcome myWelcome=Welcome.fromJson(myjson);
  print(myWelcome.toString());
  var w =myWelcome.toJson();
  print(w);


}


Welcome welcomeFromJson(String str) => Welcome.fromJson(json.decode(str));

String welcomeToJson(Welcome data) => json.encode(data.toJson());

class Welcome {
  String greeting;
  List<String> instructions;

  Welcome({
    required this.greeting,
    required this.instructions,
  });



  factory Welcome.fromJson(Map<String, dynamic> json) => Welcome(
    greeting: json["greeting"],
    instructions: List<String>.from(json["instructions"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "greeting": greeting,
    "instructions": List<dynamic>.from(instructions.map((x) => x))
    //"instructions": instructions.map((x) => x).toList()
  };

  @override
  String toString() {
    // TODO: implement toString
    String _instLine='';
    //instructions.map((e) {instLine=instLine+ '\n$e';});
    instructions.forEach((element) {
      _instLine=_instLine+ '\n$element';
    });
    return '$greeting$_instLine';
  }

}
