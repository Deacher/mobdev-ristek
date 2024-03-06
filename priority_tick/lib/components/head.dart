import 'package:flutter/material.dart';

class MyHeader extends StatelessWidget {
  final int height;
  final String title;
  final VoidCallback? onBackTap;
  final bool useBack;
  const MyHeader({super.key, required this.height, required this.title, this.onBackTap, required this.useBack});
  @override
  Widget build(BuildContext context) {
    if (useBack) {
      return _buildWithBack(context);
    } else {
      return _buildWithOut(context);
    }
  }

  Widget _buildWithBack(BuildContext context) {
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
          child: Stack(
            children: [
              Positioned(
                left: 0,
                child: IconButton(
                  icon: Icon(Icons.arrow_back, color: Colors.white),
                  onPressed: onBackTap ?? () => Navigator.of(context).pop(),
                ),
              ),
              Center(
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
            ],
          ),
      )
    );
  }

  Widget _buildWithOut(BuildContext context) {
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