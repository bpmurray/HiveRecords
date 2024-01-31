///File download from FlutterViz- Drag and drop a tools. For more details visit https://flutterviz.io/

import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';


class verify extends StatelessWidget {
  const verify({super.key});


@override
Widget build(BuildContext context) {
return Scaffold(
backgroundColor: const Color(0xffffffff),
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
"Verification",
style:TextStyle(
fontWeight:FontWeight.w700,
fontStyle:FontStyle.normal,
fontSize:20,
color:Color(0xff000000),
),
),
),
body:Align(
alignment:Alignment.center,
child:Padding(
padding:const EdgeInsets.symmetric(vertical: 0,horizontal:30),
child:SingleChildScrollView(
child:
Column(
mainAxisAlignment:MainAxisAlignment.start,
crossAxisAlignment:CrossAxisAlignment.center,
mainAxisSize:MainAxisSize.min,
children: [
///***If you have exported images you must have to copy those images in assets/images directory.
const Image(
image:AssetImage("assets/images/bee.jpg"),
height:120,
width:120,
fit:BoxFit.contain,
),
const Padding(
padding:EdgeInsets.symmetric(vertical: 30,horizontal:0),
child:Text(
"Enter the verification code we just sent to your email address.",
textAlign: TextAlign.center,
overflow:TextOverflow.clip,
style:TextStyle(
fontWeight:FontWeight.w400,
fontStyle:FontStyle.normal,
fontSize:18,
color:Color(0xff000000),
),
),
),
OtpTextField(
numberOfFields: 4,
showFieldAsBox: false,
fieldWidth: 50,
filled: true,
fillColor: const Color(0x00000000),
enabledBorderColor: const Color(0xff898a8e),
focusedBorderColor: const Color(0xff3a57e8),
borderWidth: 2,
margin:const EdgeInsets.all(0),
mainAxisAlignment: MainAxisAlignment.spaceEvenly,
crossAxisAlignment: CrossAxisAlignment.center,
obscureText: false,
borderRadius: BorderRadius.circular(4.0),
textStyle: const TextStyle(
fontWeight: FontWeight.w400,
fontStyle: FontStyle.normal,
fontSize: 20,
color: Color(0xff000000),
),
onCodeChanged: (String code) {},
onSubmit: (String verificationCode) {},
),
const Padding(
padding:EdgeInsets.symmetric(vertical: 30,horizontal:0),
child:Row(
mainAxisAlignment:MainAxisAlignment.start,
crossAxisAlignment:CrossAxisAlignment.center,
mainAxisSize:MainAxisSize.min,
children:[

Text(
"If you didn't receive a code!",
textAlign: TextAlign.start,
overflow:TextOverflow.clip,
style:TextStyle(
fontWeight:FontWeight.w400,
fontStyle:FontStyle.normal,
fontSize:12,
color:Color(0xff000000),
),
),
Padding(
padding:EdgeInsets.fromLTRB(4, 0, 0, 0),
child:Text(
"Resend",
textAlign: TextAlign.start,
overflow:TextOverflow.clip,
style:TextStyle(
fontWeight:FontWeight.w700,
fontStyle:FontStyle.normal,
fontSize:14,
color:Color(0xff000000),
),
),
),
],),),
MaterialButton(
onPressed:(){},
color:const Color(0xff3a57e8),
elevation:0,
shape:RoundedRectangleBorder(
borderRadius:BorderRadius.circular(30.0),
),
padding:const EdgeInsets.all(16),
textColor:const Color(0xffffffff),
height:50,
minWidth:150,
child:const Text("Verify", style: TextStyle( fontSize:16,
fontWeight:FontWeight.w700,
fontStyle:FontStyle.normal,
),),
),
],),),),),
)
;}
}