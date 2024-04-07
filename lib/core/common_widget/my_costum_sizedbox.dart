


import 'package:flutter/material.dart';

class MySizedBox extends StatelessWidget {


  final double? height;
  final double? width;
  const MySizedBox({super.key,  this.height,  this.width});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,

    );
  }
}