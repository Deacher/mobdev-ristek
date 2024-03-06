import 'package:flutter/material.dart';

class MyHeader extends StatelessWidget {
  final int height;
  final String title;
  const MyHeader({super.key, required this.height, required this.title});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
          width: double.infinity,
          height: height.toDouble(),
          decoration: const ShapeDecoration(
              color: Color(0xFF105857),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(40),
                      bottomRight: Radius.circular(40),
                  ),
              ),
          ),
          // padding: EdgeInsets.only(top: 10),
          child: Center(
            child: Text(
              title,
              style: TextStyle(
                color: Colors.white,
                fontSize: 32,
                fontFamily: 'Gabarito',
                fontWeight: FontWeight.w400,
                letterSpacing: 2,
              ),
            ),
          ),
      )
    );
  }
}