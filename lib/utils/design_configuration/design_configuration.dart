import 'package:flutter/material.dart';
import 'package:testline/utils/colors.dart';

class DesignConfiguration{


  static setSvgPath(String name) {
    return 'assets/SVG/$name.svg';
  }

  static setLottiePath(String name) {
    return 'assets/Lottie/$name.json';
  }

  static setPngPath(String name) {
    return 'assets/PNG/$name.png';
  }

  static setJpgPath(String name) {
    return 'assets/PNG/$name.jpg';
  }


  static placeHolder(double height) {
    return AssetImage(
      DesignConfiguration.setPngPath('placeholder'),
    );
  }

  static errorWidget(double size) {
    return Image.asset(
      DesignConfiguration.setPngPath('placeholder'),
      height: size,
      width: size,
    );
  }



  static imagePlaceHolder(double size, BuildContext context) {
    return SizedBox(
      height: size,
      width: size,
      child: Icon(
        Icons.account_circle,
        color: AppColor.backgroundColor(context),
        size: size,
      ),
    );
  }

  static getCacheNotworkImage({
    required String imageUrlString,
    required BuildContext context,
    required BoxFit? boxFit,
    required double? heightValue,
    required double? widthValue,
    required double? placeHolderSize,
  }) {
    return FadeInImage.assetNetwork(
      image: imageUrlString,
      placeholder: DesignConfiguration.setPngPath('placeholder'),
      width: widthValue,
      height: heightValue,
      fit: boxFit,
      fadeInDuration: const Duration(
        milliseconds: 150,
      ),
      fadeOutDuration: const Duration(
        milliseconds: 150,
      ),
      fadeInCurve: Curves.linear,
      fadeOutCurve: Curves.linear,
      imageErrorBuilder: (context, error, stackTrace) {
        return Container(
          child: DesignConfiguration.errorWidget(placeHolderSize ?? 50),
        );
      },
    );

  }

  static BoxDecoration boxDecoration(
      Color? color,
      double radius, {
        Color? bordercolor,
        bool isboarder = false,
        double borderwidth = 0.5,
      }) {
    return BoxDecoration(
      color: color,
      borderRadius: BorderRadius.circular(radius),
      border: isboarder
          ? Border.all(color: bordercolor!, width: borderwidth)
          : null,
    );
  }

}

