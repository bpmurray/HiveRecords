///File download from FlutterViz- Drag and drop a tools. For more details visit https://flutterviz.io/

import 'package:flutter/material.dart';


class forgot extends StatelessWidget {
  const forgot({super.key});


@override
Widget build(BuildContext context) {
return Scaffold(
backgroundColor: const Color(0xff3a57e8),
appBar: 
AppBar(
elevation:0,
centerTitle:true,
automaticallyImplyLeading: false,
backgroundColor:const Color(0x00ffffff),
shape:const RoundedRectangleBorder(
borderRadius:BorderRadius.zero,
),
title:const Text(
"Forgot Password",
style:TextStyle(
fontWeight:FontWeight.w700,
fontStyle:FontStyle.normal,
fontSize:20,
color:Color(0xffffffff),
),
),
leading: const Icon(
Icons.arrow_back,
color:Color(0xffffffff),
size:24,
),
),
body:SizedBox(
height:MediaQuery.of(context).size.height,
width:MediaQuery.of(context).size.width,
child:
Stack(
alignment:Alignment.topLeft,
children: [
Align(
alignment:Alignment.center,
child:Padding(
padding:const EdgeInsets.fromLTRB(16, 0, 16, 50),
child:SingleChildScrollView(
child:
Column(
mainAxisAlignment:MainAxisAlignment.center,
crossAxisAlignment:CrossAxisAlignment.center,
mainAxisSize:MainAxisSize.max,
children: [
///***If you have exported images you must have to copy those images in assets/images directory.
const Image(
image:AssetImage("assets/images/bee.jpg"),
height:100,
width:140,
fit:BoxFit.contain,
),
const Padding(
padding:EdgeInsets.fromLTRB(0, 30, 0, 16),
child:Text(
"Forgot Your Password?",
textAlign: TextAlign.center,
overflow:TextOverflow.clip,
style:TextStyle(
fontWeight:FontWeight.w400,
fontStyle:FontStyle.normal,
fontSize:24,
color:Color(0xffffffff),
),
),
),
const Text(
"Enter the email address you used to register with us and we will send you a reset link!",
textAlign: TextAlign.center,
overflow:TextOverflow.clip,
style:TextStyle(
fontWeight:FontWeight.w400,
fontStyle:FontStyle.normal,
fontSize:16,
color:Color(0xffd2d2d2),
),
),
Padding(
padding:const EdgeInsets.fromLTRB(0, 50, 0, 0),
child:TextField(
controller:TextEditingController(),
obscureText:false,
textAlign:TextAlign.start,
maxLines:1,
style:const TextStyle(
fontWeight:FontWeight.w400,
fontStyle:FontStyle.normal,
fontSize:14,
color:Color(0xff000000),
),
decoration:InputDecoration(
disabledBorder:OutlineInputBorder(
borderRadius:BorderRadius.circular(12.0),
borderSide:const BorderSide(
color:Color(0x00ffffff),
width:1
),
),
focusedBorder:OutlineInputBorder(
borderRadius:BorderRadius.circular(12.0),
borderSide:const BorderSide(
color:Color(0x00ffffff),
width:1
),
),
enabledBorder:OutlineInputBorder(
borderRadius:BorderRadius.circular(12.0),
borderSide:const BorderSide(
color:Color(0x00ffffff),
width:1
),
),
hintText:"Type Your Email",
hintStyle:const TextStyle(
fontWeight:FontWeight.w400,
fontStyle:FontStyle.normal,
fontSize:14,
color:Color(0xff525252),
),
filled:true,
fillColor:const Color(0xfff2f2f3),
isDense:false,
contentPadding:const EdgeInsets.symmetric(vertical: 8,horizontal:12),
),
),
),
],),),),),
Padding(
padding:const EdgeInsets.fromLTRB(0, 0, 0, 30),
child:Align(
alignment:Alignment.bottomRight,
child:MaterialButton(
onPressed:(){},
color:const Color(0xffe96053),
elevation:0,
shape:const RoundedRectangleBorder(
borderRadius:BorderRadius.only(topLeft: Radius.circular(30.0), bottomLeft: Radius.circular(30.0)),
side:BorderSide(color:Color(0xff808080),width:1),
),
padding:const EdgeInsets.all(16),
textColor:const Color(0xffffffff),
height:50,
minWidth:150,
child:const Text("SEND", style: TextStyle( fontSize:16,
fontWeight:FontWeight.w700,
fontStyle:FontStyle.normal,
),),
),
),
),
],),),
)
;}
}