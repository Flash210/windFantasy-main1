import 'package:flutter/material.dart';

class MyBackButton extends StatelessWidget {
  const MyBackButton({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.only(left: 10, top: 10),
      child: Align(
        alignment: AlignmentDirectional.centerStart,
        child: InkWell(
          overlayColor: const MaterialStatePropertyAll(Colors.transparent),
          onTap: () {
            Navigator.of(context).pop();
          },
          child: Image.asset(
            'assets/back2.png',
            width: size.width * 0.07,
            height: size.height * 0.07,
          ),
        ),
      ),
    );
  }
}
