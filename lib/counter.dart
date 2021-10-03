import 'package:flutter/material.dart';

class Counter extends StatelessWidget {
  final int number;
  final Color color;
  final String title;

  const Counter({
    Key? key,
    required this.number,
    required this.color,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(5.0),
          height: 30.0,
          width: 25.0,
          decoration: BoxDecoration(
              shape: BoxShape.circle, color: color.withOpacity(0.4)),
          child: Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.transparent,
              border: Border.all(color: color, width: 2),
            ),
          ),
        ),
        SizedBox(height: 10),
        Text("${number}", style: TextStyle(fontSize: 40, color: color)),
        Text(title, style: TextStyle(fontSize: 13.0, color: Colors.blueGrey),),
      ],
    );
  }
}