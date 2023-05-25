import 'package:flutter/material.dart';

class AirtimeConvert extends StatefulWidget {
  const AirtimeConvert({required Key key}) : super(key: key);
  @override
  AirtimeConvertState createState() => AirtimeConvertState();
}

class AirtimeConvertState extends State<AirtimeConvert> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Form(
        key: _formKey, 
        child: Column(
          children: [TextFormField(decoration: const InputDecoration(
            hintText: "Sender's Phone Number"
          ),), TextFormField(decoration: const InputDecoration(
            hintText: "Confirm Sender's Phone Number"
          ),), TextFormField(decoration: const InputDecoration(
            labelText: "Enter other amount", hintText: "0"
          ),), ElevatedButton(onPressed: (){},child: const Text("Submit")) ]),)
    );
  }
}