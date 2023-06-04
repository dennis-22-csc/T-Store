import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget{
          final Color color;
          final String text1;
          final String text2;
          final IconData icon;

          const ProductCard({Key? key, required this.icon, required this.color, required this.text1, required this.text2 }): super(key: key);

          @override
          Widget build(BuildContext context) {
            return Card(
              elevation: 50,
              shadowColor: Colors.black,
              color: color,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
              child: Padding(padding: const EdgeInsets.all(5), child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [Icon(icon, size: 45, color: Colors.white), Text(text1, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)), Padding(padding: const EdgeInsets.only(top: 10), child: Text(text2, style: const TextStyle(color: Colors.white)))]
                ))
            );
              

          }
}