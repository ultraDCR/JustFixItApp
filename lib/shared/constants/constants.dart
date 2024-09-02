import 'package:flutter/material.dart';

const String SUCCESS_MESSAGE=" You will be contacted by us very soon.";


const String login_title =  "Login";
const String login_subtitle= "Let's continue where we left off.";
const String login_emailLabel= "Email";
const String login_emailHint= "eg: email@example.com";
const String login_passwordLabel= "Password";
const String login_passwordHint= "************";
const String login_forgotPasswordLabel= "Forgot password?";
const String login_googleBtnLabel= "Sign in with Google";
const String login_appleBtnLabel= "Sign in with Apple";
const String login_submitBtnLabel= "Login";

const String loadingDialog_content= "Please wait...";

const String or= "OR";

const kAccentColor = Color(0xFFDD346C);

const kTextFieldDecoration = InputDecoration(
  errorStyle: TextStyle(color: Colors.red, fontFamily: 'Inter',fontSize: 14),

  // contentPadding: EdgeInsets.symmetric(
  //   vertical: 4.0,
  // ),
  border: UnderlineInputBorder(
    borderSide: BorderSide(color: Color(0xFFFFFFFF), width: 1.0),
  ),
  enabledBorder: UnderlineInputBorder(
    borderSide: BorderSide(color: Color(0xFFFB8EB2), width: 1.0),
  ),
  focusedBorder: UnderlineInputBorder(
    borderSide: BorderSide(color: Color(0xFFFFFFFF), width: 1.0),
  ),
  focusedErrorBorder: UnderlineInputBorder(
    borderSide: BorderSide(color: Color(0xFFFFFFFF), width: 1.0),
  ),
  errorBorder: UnderlineInputBorder(
    borderSide: BorderSide(color: Colors.red, width: 1.0),
  ),
);
const kTextFieldDecorationGC = InputDecoration(
  errorStyle: TextStyle(color: Colors.red, fontFamily: 'Inter'),

  // contentPadding: EdgeInsets.symmetric(
  //   vertical: 4.0,
  // ),
  border: OutlineInputBorder(
    borderSide: BorderSide(color: Color(0xFFDCDCDC), width: 2.0),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Color(0xFFE9E8E8), width: 2.0),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: kAccentColor, width: 2.0),
  ),
  focusedErrorBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Color(0xFFFFC66A), width: 2.0),
  ),
  errorBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.red, width: 2.0),
  ),
);

const kTextDecorationFilled = InputDecoration(
  contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 16.0),
  fillColor: Colors.white,
  border: OutlineInputBorder(
    borderRadius: kBorderRadius8,
    borderSide: BorderSide.none,
  ),
  filled: true,
);

const kBorderRadius0 = BorderRadius.all(Radius.circular(0));
const kBorderRadius2 = BorderRadius.all(Radius.circular(2.0));
const kBorderRadius4 = BorderRadius.all(Radius.circular(4.0));
const kBorderRadius8 = BorderRadius.all(Radius.circular(8.0));
const kBorderRadius6 = BorderRadius.all(Radius.circular(6.0));
const kBorderRadius12 = BorderRadius.all(Radius.circular(12.0));
const kBorderRadius16 = BorderRadius.all(Radius.circular(16.0));
const kBorderRadius100 = BorderRadius.all(Radius.circular(100.0));

const kDecorationCorner4 = BoxDecoration(borderRadius: kBorderRadius4);
const kDecorationCorner2 = BoxDecoration(borderRadius: kBorderRadius2);
const kDecorationCorner8 = BoxDecoration(borderRadius: kBorderRadius8);
const kDecorationCorner6 = BoxDecoration(borderRadius: kBorderRadius6);
const kDecorationCorner12 = BoxDecoration(borderRadius: kBorderRadius12);
const kDecorationCorner16 = BoxDecoration(borderRadius: kBorderRadius16);
const kDecorationNone = BoxDecoration(borderRadius: kBorderRadius0);

const kDecorationCornerCircular = BoxDecoration(borderRadius: kBorderRadius100);

const kDecorationTopCorner8 =
BoxDecoration(borderRadius: BorderRadius.vertical(top: Radius.circular(8)));
const kDecorationBottomCorner8 = BoxDecoration(
    borderRadius: BorderRadius.vertical(bottom: Radius.circular(8)));
const kDecorationBottomLeftCorner55 = BoxDecoration(
    borderRadius: BorderRadius.only(bottomLeft: Radius.circular(55)));
const kDecorationBottomLeftTopRightCorner55 = BoxDecoration(
    borderRadius: BorderRadius.only(
        bottomLeft: Radius.circular(35), topRight: Radius.circular(35)));


const kTextStyleBoldLarge = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.bold,
    color: Colors.black,
    fontFamily: 'Inter');

const kTextStyleSmall = TextStyle(
  fontSize: 12,
  fontWeight: FontWeight.w300,
  color: Colors.black45,
);
const kTextStyleBoldMedium = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.bold,
    color: Colors.black,
    fontFamily: 'Inter');



const adBannerAspectRatio = 600 / 112;
const mainBannerAspectRatio = 600 / 338;