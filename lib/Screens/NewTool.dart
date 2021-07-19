import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:inc_tools/support/ToolsApi.dart';

class NewToolPage extends StatefulWidget {
  const NewToolPage({Key? key}) : super(key: key);

  @override
  _NewToolPageState createState() => _NewToolPageState();
}

class _NewToolPageState extends State<NewToolPage> {
  var _toolNumber = TextEditingController();
  var _toolType = TextEditingController();
  var _toolTags = TextEditingController();
  var _toolQuantity = TextEditingController();
  bool isChecked = true;


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              simpleInput(_toolNumber, "Tool Number"),
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

  Padding simpleInput(TextEditingController controllerInput, String label) {
    return Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextFormField(
                decoration: InputDecoration(
                    labelText: label,
                ),
                controller: _toolNumber,
              ),
            );
          }
}
