import 'package:flutter/material.dart';
import 'package:tstore/product_card.dart';
import 'package:tstore/airtime_convert_form.dart';
import 'package:tstore/product_alert.dart';

class MyHomePage extends StatelessWidget{
    const MyHomePage({super.key});

    final ProductCard card1 = const ProductCard(icon: Icons.add, color: Color(0xFF373737), text1: "Airtime to Cash", text2: "Convert your airtime to cash with ease");
    final ProductCard card2 = const ProductCard(icon: Icons.access_alarm, color: Color(0xFF3E31A6), text1: "Perfect Money", text2: "Make a perfect money transaction");
    final ProductCard card3 = const ProductCard(icon: Icons.card_giftcard, color: Color(0xFFF8D67A), text1: "Send Gift", text2: "Send gifts to family and friends");
    final ProductCard card4 = const ProductCard(icon: Icons.call, color: Color(0xFFD75247), text1: "Refill", text2: "Refill your airtime, data, and internet subscription");

    final String alertTitleText = 'Hi Chief!';
    final String alertContentText = 'This service is not yet available.';
    
      @override
Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      title: const Text('T-Store',),
      backgroundColor: Colors.blue,
    ),
    body: Padding(
      padding: const EdgeInsets.all(5),
      child: Container (
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: EdgeInsets.only(top: 20, bottom: 10, left: 5, right:5), 
                child: Text('Welcome!', style: TextStyle(color: Color(0xFF8795A5), fontSize: 20)),
              ),
            ),
            const Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: EdgeInsets.only(top: 20, bottom: 10, left: 5, right:5), 
                child: Text('What would you like to do today?', style: TextStyle(color: Color(0xFF8795A5), fontSize: 20)),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: SizedBox(
                    height: 150, // set a fixed height for the container
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => AirtimeConvert(key: UniqueKey())),
                        );
                      },
                      child: card1,
                    ),
                  ),
                ),
                Expanded(
                  child: SizedBox(
                    height: 150, // set a fixed height for the container
                    child: GestureDetector(
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return ProductAlert(titleText: alertTitleText, contentText: alertContentText);
                          },
                        );
                      },
                      child: card2,
                    ),
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
                    child: GestureDetector(
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return ProductAlert(titleText: alertTitleText, contentText: alertContentText);
                          },
                        );
                      },
                      child: card3,
                    ),
                  ),
                ),
                Expanded(
                  child: SizedBox(
                    height: 150, // set a fixed height for the container
                    child: GestureDetector(
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return ProductAlert(titleText: alertTitleText, contentText: alertContentText);
                          },
                        );
                      },
                      child: card4,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
        ),
    ),
);
}

}