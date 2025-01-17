// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:testline/utils/dubg_tools.dart';

class AppColor {
  static Color backgroundColor(context) =>
      Theme.of(context).scaffoldBackgroundColor;
  static Color textColor(context) => Theme.of(context).hintColor;
  static Color widgetPrimaryColor(context) => Theme.of(context).primaryColor;
  static Color cardBackgroudcolor(context) => !isLightTheme(context)
      ? const Color(0xff080808)
      : const Color(0xffffffff);
  static Color tabcolor(context) => !isLightTheme(context)
      ? const Color(0xff000000)
      : const Color(0xffF1F1F1);
  static Color tabIndicator(context) => !isLightTheme(context)
      ? const Color(0xff000000)
      : const Color(0xffF1F1F1);

  static Color textColourDarkGray(context) => !isLightTheme(context)
      ? const Color(0xffffffff)
      : const Color(0xff4d4d4d);
  static Color textFieldBackgroundColour(context) => !isLightTheme(context)
      ? const Color(0xff080808)
      : const Color(0xffD6D6D6);
  static Color textFieldBackgroundColourr(context) => !isLightTheme(context)
      ? const Color(0xff080808)
      : const Color(0xffffffff);
  static Color textColourDarkBlack(context) => !isLightTheme(context)
      ? const Color(0xffffffff)
      : const Color(0xff000000);
  static Color containerColor(context) => !isLightTheme(context)
      ? const Color(0xff000000)
      : const Color(0xffF5F5F5);
  static Color notificationColor(context) => !isLightTheme(context)
      ? const Color(0xff000000)
      : const Color(0xffEDF3FF);
  static Color declinebuttonColor(context) => !isLightTheme(context)
      ? const Color(0xff000000)
      : const Color(0xffffffff);
  static Color dialColor(context) => !isLightTheme(context)
      ? const Color(0xff000000)
      : const Color(0xff212121).withOpacity(0.08);
  static Color dialTimeColor(context) => !isLightTheme(context)
      ? const Color(0xff000000)
      : const Color(0xffF2E7FE);
  static Color dialSubColor(context) => !isLightTheme(context)
      ? const Color(0xff000000)
      : const Color(0xff67BC2A);
  static Color appBarColor(context) => !isLightTheme(context)
      ? const Color(0xff000000)
      : const Color(0xff67bc2a);
  static Color feedBackground(context) => !isLightTheme(context)
      ? const Color(0xff171717)
      : const Color(0xffF5F9FF);
  static Color feedBackgrounds(context) => !isLightTheme(context)
      ? const Color(0xff171717)
      : const Color(0xffFDFDFF);
  static Color topcolor(context) => !isLightTheme(context)
      ? const Color(0xff171717)
      : const Color(0xFFFCF9F9);
  static Color feedBackgroundd(context) => !isLightTheme(context)
      ? Colors.white.withOpacity(0.75)
      : Colors.black.withOpacity(0.75);
  static Color textcolor(context) => !isLightTheme(context)
      ? const Color(0xFFEAEAEA)
      : const Color(0xFF8A898E);
  static Color butuonback(context) => !isLightTheme(context)
      ? const Color(0xff000000)
      : const Color(0xffffffff);
  static Color textFieldTextColour = const Color(0xff4d4d4d);
  static Color lightGreenButton = const Color(0xff385127);
  static const buttonColorLight = Color(0xffD6D6D6);
  static const iconColorLight = Color(0xff544c4c);
  static const buttonColorDark = Color(0xff080808);
  static const whiteColor = Color(0xffffffff);
  static const pureBlackColor = Color(0xff000000);
  static const transparentColor = Colors.transparent;
  static const unslectedColor = Color(0x19696969);

  static const blackColor = Color(0xff171717);
  static const lightGreen = Color(0xff67bc2a);
  static const lightGray = Color(0x3F67BC2A);
  static const lightWHIT = Color(0xFFF6F6FE);
  static const text = Color(0xFF303030);
  static const dividercolor = Color(0x3FD9D9D9);
  static const bodercolro = Color(0xffE6E6E6);

  static const boderColor = Color(0xFFD5D5D5);

  static const marineDarkGreen = Color(0xff006231);
  static const mediumGreen = Color(0xff509613);
  static const darkGreen = Color(0xff03632c);
  static const lightGrey = Color(0xfff5f5f5);
  static const darkGrey = Color(0xffc7c7c7);
  static const charcoalGrey = Color(0xff4d4d4d);
  static const yellowColor = Color(0xffF9AE1C);
  static const redColor = Color(0xffAA0000);
  static const bottomNavColor = Color(0xffD5E6FF);
  static const lightWhiteColor = Color(0xffd9d9d9);
  static const middarkgrey = Color(0xffC6C6C8);
  static const lightblack = Color(0x80000000);
  static const charcoalblack = Color(0xff3A4750);
  static const mediumgrey = Color(0xffabababf);
  static const yellowaccent = Color(0xffFDE99D);
  static const pinkaccent = Color(0xffFFD8F4);
  static const blueaccent = Color(0xffD9E8FC);
  static const rockblue = Color(0xff94A3B8);
  static const davygrey = Color(0xff575A61);
  static const seagreen = Color(0xff079945);
  static const DimGray = Color(0xff696969);
  static const fit = Color(0xFFD6E8C9);
  static const lightgry = Color(0xFFF4F4F4);
  static const darklight = Color(0xFF656565);

  static const grey = Color(0xff858585);
  static const greenaccent = Color(0xffD7FFB8);
  static const orangeAccent = Color(0xffFFEADD);
  static const darkbluecolor = Color(0xff667085);
  static const gray85 = Color(0xff667085);
  static const purpleColor = Color(0xff6941C6);
  static const mantisGreenColor = Color(0xff7AC143);
  static const redColorAccent = Color(0xffff0000);
  static const fatGoldColor = Color(0xffE8B903);
  static const fortessGrey = Color(0xffB7B7B7);
  static const leaveGreen = Color(0xff219D16);
  static const tealColor = Color(0xff117373);

  static const aluminiumGreyColor = Color(0xff868889);
  static const spanishGreyColor = Color(0xff979899);
  static const grey63Color = Color(0xffA1A1A1);
  static const orangeColor = Color(0xffFF8B20);
  static const blueColor = Color.fromARGB(255, 18, 42, 85);
  static const heatherGreyColor = Color(0xffADB5BD);
  static const grey75Color = Color(0xffBFBFBF);
  static const greenBackgroundColor = Color(0xffF2FAF0);
  static const greyBlueColor = Color(0xffE2E8F0);
  static const slateGreyColor = Color(0xff73839B);
  static const skyGreyColor = Color(0xff979C9E);
  static const purpleAccentColor = Color(0xffE3E4FF);
  static const color6969 = Color(0xff696969);
  static const pinkDialColor = Color(0xffF2E7FE);
  static const skyBlue = Color(0xff93C9C7);
  static const lightColor = Color(0xFF949494);

  static const blueGrey = Color(0xff9CA3AF);
  static const lightBlack = Color(0xFF171717);
  static const blacklight = Color(0xFF404040);

  static const notesColor1 = Color(0xffD9E8FC);
  static const notesColor2 = Color(0xffFFD8F4);
  static const notesColor3 = Color(0xffFDE99D);
  static const notesColor4 = Color(0xffB0E9CA);
  static const notesColor5 = Color(0xffFFEADD);
  static const notesColor6 = Color(0xffC3C8F7);
  static const backview = Color(0xffF1F1F1);

  static ThemeData darkTheme = ThemeData(
      hintColor: whiteColor, // For Text Colors
      brightness: Brightness.dark,
      scaffoldBackgroundColor: blackColor, // For Scaffold Colors
      primaryColor: pureBlackColor, // For Widget Colors
      fontFamily: "Lato",
      buttonTheme: const ButtonThemeData(
        buttonColor: lightGreen,
        disabledColor: whiteColor,
      ));

  static ThemeData lightTheme = ThemeData(
      hintColor: blackColor, // For Text Colors
      brightness: Brightness.light,
      scaffoldBackgroundColor: whiteColor, // For Scaffold Colors
      primaryColor: whiteColor, // For Widget Colors
      fontFamily: "Lato",
      buttonTheme: const ButtonThemeData(
        buttonColor: darkGreen,
        disabledColor: blackColor,
      ));
}
