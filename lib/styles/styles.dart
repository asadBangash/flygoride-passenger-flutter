import 'package:flutter/material.dart';

var scrheight = 813.0;
var scrwidth = 375.0;

double eight = 0.0213;
double ten = 0.0267;
double twelve = 0.032;
double fourteen = 0.037;
double thirty = 0.08;
double fifteen = 0.04;
double sixteen = 0.042666;
double eighteen = 0.048;
double twenty = 0.053;
double twentysix = 0.0693;
double twentyeight = 0.07466;
double twentyfour = 0.064;
double fourty = 0.10667;

/// FlyGoRide Rider — black surfaces, green accents (brand).
Color backgroundColor = const Color(0xff000000);
Color textColor = const Color(0xffF5F5F5);
Color backIcon = const Color(0xffF5F5F5);
Color underline = const Color(0xffF5F5F5).withOpacity(0.28);
Color hintColor = const Color(0xffF5F5F5).withOpacity(0.38);
Color inputUnderline = const Color(0xffF5F5F5).withOpacity(0.28);
Color inputfocusedUnderline = const Color(0xff22C55E);
Color boxShadowColor = const Color(0xffFFFFFF).withOpacity(0.06);
Color topBar = const Color(0xff000000);
Color page = const Color(0xff000000);
Color buttonColor = const Color(0xff22C55E);
Color theme = const Color(0xff22C55E);
Color buttonText = const Color(0xffFFFFFF);
Color inputFieldSeparator = const Color(0xff22C55E);
Color termsCheckBox = const Color(0xff22C55E);
Color loaderColor = const Color(0xff22C55E);
Color notUploadedColor = Colors.orange;
Color verifyPendingBck = const Color(0xff1F1515);
Color verifyPending = const Color(0xffEAB308);
Color verifyDeclined = const Color(0xffEF4444);
Color offline = const Color(0xff737373);
Color online = const Color(0xff22C55E);
Color dropColor = const Color(0xffEF4444);
Color onlineOfflineText = const Color(0xffFFFFFF);
Color borderLines = const Color(0xff2A2A2A);
Color starColor = const Color(0xff84CC16);
bool isDarkTheme = true;
Color greyText = const Color(0xffA3A3A3);
Color borderColor = const Color(0xff404040);
Color boxColors = const Color(0xffFFFFFF).withOpacity(0.08);

dynamic shimmer;
List<Color> shaderColor = [
  const Color(0xff27272A).withOpacity(0.35),
  const Color(0xff3F3F46).withOpacity(0.45),
  const Color(0xff27272A).withOpacity(0.35),
];

List<double> shaderStops = [
  0.1,
  0.3,
  0.4,
];

Alignment shaderBegin = const Alignment(-1.0, -0.3);
Alignment shaderEnd = const Alignment(1.0, 0.3);

BoxShadow boxshadow = BoxShadow(
    blurRadius: 2, color: Colors.white.withOpacity(0.08), spreadRadius: 2);
