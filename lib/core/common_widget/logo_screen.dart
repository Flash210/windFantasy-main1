



import 'package:flutter/material.dart';
import 'package:front/core/constants/app_constants.dart';

class LogoScreen extends StatelessWidget {
  const LogoScreen({super.key});

  @override
  Widget build(BuildContext context) {
        final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;
    return Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: height *0.2,),
             
               Center(
                  child: Image.asset(
                    MyRes.kWindLogo,
                    fit: BoxFit.contain,
                      width: width * 0.5,
                    height: height * 0.2,
                  ),
                ),
              
            ],
        )
        )
    );
            
  }
}