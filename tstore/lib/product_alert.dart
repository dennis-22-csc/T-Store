import 'package:flutter/material.dart';

class ProductAlert extends StatelessWidget{
    final String titleText;
    final String contentText;

    const ProductAlert({Key? key, required this.titleText, required this.contentText}): super (key: key);

    @override
          Widget build(BuildContext context) {
            return AlertDialog(
                              title: Text(titleText, style: const TextStyle(fontWeight: FontWeight.bold, color: Color(0xFF8795A5))),
                              content: Text(contentText, style: const TextStyle(color: Color(0xFF8795A5))),
                              actions: [
                                ElevatedButton(
                                  style: ElevatedButton.styleFrom(shape: const StadiumBorder()),
                                  child: const Text('OK'),
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                ),
                              ],
                            );
          }
}
    