///File download from FlutterViz- Drag and drop a tools. For more details visit https://flutterviz.io/

import 'package:flutter/material.dart';


class login extends StatelessWidget {
  const login({super.key});


@override
Widget build(BuildContext context) {
return Scaffold(
backgroundColor: const Color(0xffe6e6e6),
body:
Stack(
alignment:Alignment.topLeft,
children: [
Container(
margin:const EdgeInsets.all(0),
padding:const EdgeInsets.all(0),
width:MediaQuery.of(context).size.width,
height:MediaQuery.of(context).size.height * 0.35000000000000003,
decoration: BoxDecoration(
color:const Color(0xff3a57e8),
shape:BoxShape.rectangle,
borderRadius:BorderRadius.zero,
border:Border.all(color:const Color(0x4d9e9e9e),width:1),
),
)

,
Container(
margin:const EdgeInsets.fromLTRB(20, 100, 20, 20),
padding:const EdgeInsets.all(0),
width:MediaQuery.of(context).size.width,
height:MediaQuery.of(context).size.height,
decoration: BoxDecoration(
color:const Color(0xffffffff),
shape:BoxShape.rectangle,
borderRadius:BorderRadius.circular(16.0),
border:Border.all(color:const Color(0x4d9e9e9e),width:1),
),
child:
Padding(
padding:const EdgeInsets.all(16),
child:SingleChildScrollView(
child:
Column(
mainAxisAlignment:MainAxisAlignment.start,
crossAxisAlignment:CrossAxisAlignment.center,
mainAxisSize:MainAxisSize.max,
children: [
///***If you have exported images you must have to copy those images in assets/images directory.
const Image(
image:AssetImage("assets/images/bee.jpg"),
height:100,
width:100,
fit:BoxFit.cover,
),
const Padding(
padding:EdgeInsets.fromLTRB(0, 30, 0, 0),
child:Align(
alignment:Alignment.centerLeft,
child:Text(
"Login",
textAlign: TextAlign.start,
overflow:TextOverflow.clip,
style:TextStyle(
fontWeight:FontWeight.w700,
fontStyle:FontStyle.normal,
fontSize:22,
color:Color(0xff000000),
),
),
),
),
Padding(
padding:const EdgeInsets.symmetric(vertical: 16,horizontal:0),
child:TextField(
controller:TextEditingController(),
obscureText:false,
textAlign:TextAlign.left,
maxLines:1,
style:const TextStyle(
fontWeight:FontWeight.w400,
fontStyle:FontStyle.normal,
fontSize:14,
color:Color(0xff000000),
),
decoration:InputDecoration(
disabledBorder:UnderlineInputBorder(
borderRadius:BorderRadius.circular(4.0),
borderSide:const BorderSide(
color:Color(0xff000000),
width:1
),
),
focusedBorder:UnderlineInputBorder(
borderRadius:BorderRadius.circular(4.0),
borderSide:const BorderSide(
color:Color(0xff000000),
width:1
),
),
enabledBorder:UnderlineInputBorder(
borderRadius:BorderRadius.circular(4.0),
borderSide:const BorderSide(
color:Color(0xff000000),
width:1
),
),
hintText:"Enter Email",
hintStyle:const TextStyle(
fontWeight:FontWeight.w400,
fontStyle:FontStyle.normal,
fontSize:14,
color:Color(0xff494646),
),
filled:true,
fillColor:const Color(0xffffffff),
isDense:false,
contentPadding:const EdgeInsets.all(0),
),
),
),
TextField(
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
disabledBorder:UnderlineInputBorder(
borderRadius:BorderRadius.circular(4.0),
borderSide:const BorderSide(
color:Color(0xff000000),
width:1
),
),
focusedBorder:UnderlineInputBorder(
borderRadius:BorderRadius.circular(4.0),
borderSide:const BorderSide(
color:Color(0xff000000),
width:1
),
),
enabledBorder:UnderlineInputBorder(
borderRadius:BorderRadius.circular(4.0),
borderSide:const BorderSide(
color:Color(0xff000000),
width:1
),
),
hintText:"Enter Password",
hintStyle:const TextStyle(
fontWeight:FontWeight.w400,
fontStyle:FontStyle.normal,
fontSize:14,
color:Color(0xff494646),
),
filled:true,
fillColor:const Color(0xffffffff),
isDense:false,
contentPadding:const EdgeInsets.all(0),
),
),
const Padding(
padding:EdgeInsets.fromLTRB(0, 16, 0, 30),
child:Align(
alignment:Alignment.centerRight,
child:Text(
"Forgot Password?",
textAlign: TextAlign.start,
overflow:TextOverflow.clip,
style:TextStyle(
fontWeight:FontWeight.w700,
fontStyle:FontStyle.normal,
fontSize:14,
color:Color(0xff3a57e8),
),
),
),
),
MaterialButton(
onPressed:(){},
color:const Color(0xff3a57e8),
elevation:0,
shape:RoundedRectangleBorder(
borderRadius:BorderRadius.circular(16.0),
),
padding:const EdgeInsets.all(16),
textColor:const Color(0xffffffff),
height:40,
minWidth:MediaQuery.of(context).size.width,
child:const Text("Login", style: TextStyle( fontSize:16,
fontWeight:FontWeight.w700,
fontStyle:FontStyle.normal,
),),
),
const Padding(
padding:EdgeInsets.fromLTRB(0, 8, 0, 0),
child:Row(
mainAxisAlignment:MainAxisAlignment.center,
crossAxisAlignment:CrossAxisAlignment.start,
mainAxisSize:MainAxisSize.max,
children:[

Padding(
padding:EdgeInsets.fromLTRB(0, 0, 4, 0),
child:Text(
"Don't have an account?",
textAlign: TextAlign.start,
overflow:TextOverflow.clip,
style:TextStyle(
fontWeight:FontWeight.w400,
fontStyle:FontStyle.normal,
fontSize:14,
color:Color(0xff000000),
),
),
),
Text(
"SignUp",
textAlign: TextAlign.start,
overflow:TextOverflow.clip,
style:TextStyle(
fontWeight:FontWeight.w700,
fontStyle:FontStyle.normal,
fontSize:12,
color:Color(0xff000000),
),
),
],),),
],),),),
),
],),
)
;}
}