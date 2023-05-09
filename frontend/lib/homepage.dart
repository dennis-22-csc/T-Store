import 'package:flutter/material.dart';
import 'package:frontend/product_card.dart';

class MyHomePage extends StatelessWidget{
    const MyHomePage({super.key});

    final ProductCard card1 = const ProductCard(icon: Icons.add, color: Colors.yellow, text1: "Airtime to Cash", text2: "Convert your airtime to cash with ease");
    final ProductCard card2 = const ProductCard(icon: Icons.access_alarm, color: Colors.red, text1: "Perfect Money", text2: "Make a perfect money transaction");
    final ProductCard card3 = const ProductCard(icon: Icons.card_giftcard, color: Colors.blue, text1: "Send Gift", text2: "Send gifts to family and friends");
    final ProductCard card4 = const ProductCard(icon: Icons.call, color: Colors.deepOrange, text1: "Refill", text2: "Refill your airtime, data, and internet subscription");

    @override
Widget build(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.all(5),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: SizedBox(
                height: 150, // set a fixed height for the container
                child: GestureDetector(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: const Text('Hi Chief!'),
                          content: const Text('This service is not yet available.'),
                          actions: [
                            TextButton(
                              child: const Text('OK'),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                            ),
                          ],
                        );
                      },
                    );
                  },
                  child: card1,
                ),
              ),
            ),
            Expanded(
              child: SizedBox(
                height: 150, // set a fixed height for the container
                child: card2,
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: SizedBox(
                height: 150, // set a fixed height for the container
                child: card3,
              ),
            ),
            Expanded(
              child: SizedBox(
                height: 150, // set a fixed height for the container
                child: card4,
              ),
            ),
          ],
        ),
      ],
    ),
  );
}

}