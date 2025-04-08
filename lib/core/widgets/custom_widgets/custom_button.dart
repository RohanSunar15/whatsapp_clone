import 'package:flutter/material.dart';
import 'package:whatsapp_clone/core/theme/app_color.dart';


class CustomOutlinedButton extends StatelessWidget {
  const CustomOutlinedButton({
    super.key,
    required this.childWidget,
    this.onPressed,
    this.backgroundColor,
    this.borderSideColor,
    this.padding,
    this.childWidgetDistance,
    this.borderRadius,
    this.margin,
    this.height,
    this.width,
    this.overlayColor,
  });


  final void Function()? onPressed;
  final Color? backgroundColor;
  final Color? overlayColor;

  final Color? borderSideColor;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final double? childWidgetDistance;
  final double? borderRadius;
  final double? height;
  final double? width;

  final Widget childWidget;




  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      width: width,
      height: height,
      child: OutlinedButton(
          onPressed: onPressed ?? () {},
          style: OutlinedButton.styleFrom(
              overlayColor: overlayColor ?? AppColor.white,
              backgroundColor: backgroundColor,
              padding:padding,
              side: BorderSide(
                color:borderSideColor ?? AppColor.white,
              ),
              shape: RoundedRectangleBorder(
                  borderRadius:BorderRadius.circular(
                      borderRadius ?? 0
                  )
              )
          ),
          child: childWidget
      ),
    );
  }
}