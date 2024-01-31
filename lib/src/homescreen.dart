///File download from FlutterViz- Drag and drop a tools. For more details visit https://flutterviz.io/

import 'package:flutter/material.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});


@override
Widget build(BuildContext context) {
return Scaffold(
backgroundColor: const Color(0xffffffff),
body:Align(
alignment:Alignment.center,
child:///***If you have exported images you must have to copy those images in assets/images directory.
Image(
image:const AssetImage("assets/images/BrendansBeez1920.jpg"),
height:MediaQuery.of(context).size.height * 0.3,
width:MediaQuery.of(context).size.width,
fit:BoxFit.fitHeight,
),
)
)
;}
}