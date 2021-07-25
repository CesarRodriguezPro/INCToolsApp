import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:inc_tools/support/ToolsApi.dart';


class NewToolPage extends StatefulWidget {
  static String id = "NewToolPage";

  final typesTools;
  NewToolPage({this.typesTools});

  @override
  _NewToolPageState createState() => _NewToolPageState();
}

class _NewToolPageState extends State<NewToolPage> {
  var _toolNumber = TextEditingController();
  var _toolType = TextEditingController();
  var _toolTags = TextEditingController();
  var _toolQuantity = TextEditingController();
  bool isChecked = true;
  String _chosenValue = "Choose...";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('New Tool'),centerTitle: true,),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SizedBox(
                    width: 200,height: 50,
                      child: TextField(controller: _toolNumber,decoration:InputDecoration(labelText: "Barcode Number",))),
                  Text('Or'),
                  ElevatedButton(onPressed: (){}, child: Text('Scan Barcode')),
                ],),
              DropdownButton<String>(
                focusColor:Colors.white,
                value: _chosenValue,
                iconEnabledColor:Colors.black,
                items: optionsTypes() ,  // here is where the items will be return to.
                onChanged: (String? value) {
                  setState(() {
                    _chosenValue = value!;
                  });
                },
              ),
              simpleInput(_toolType, "Tool Type"),
              simpleInput(_toolTags, "Tags"),
              simpleInput(_toolQuantity, "Quantity" ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                Text('Active', style: TextStyle(fontSize: 17),),
                Checkbox(value: isChecked, onChanged:(bool? value){
                  setState(() {
                    isChecked = value!;
                  });
                }),
              ],),
              ElevatedButton(onPressed: () async {
                bool isWasCreated = await ToolsAPI().newToolApi(
                    code: _toolNumber.text,
                    type: _toolType.text,
                    tags: _toolTags.text,
                    quantity: _toolQuantity.text,
                );
                if(isWasCreated){
                  Navigator.pop(context);
                }
              },
                child: Text('Summit', style: TextStyle(fontSize: 20),),
              )
            ],
          ),
        ),
      ),
    );
  }


  List<DropdownMenuItem<String>> optionsTypes (){

    List<String> types = ["Choose..."];
    types.addAll(widget.typesTools);

    List<DropdownMenuItem<String>> items = [];
    for(String _value in types){
      items.add(
          DropdownMenuItem<String>(
              value: _value,
              child: Text(_value, style: TextStyle(color: Colors.black),)
          ),
      );
    }

    return items;
  }


  Padding simpleInput(TextEditingController controllerInput, String label) {
    return Padding(
        padding: const EdgeInsets.all(10.0),
        child: TextFormField(
          decoration: InputDecoration(
              labelText: label,
          ),
          controller: controllerInput,
        ),
      );
  }

}




