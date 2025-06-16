import 'package:flutter/material.dart';
import 'package:fudikoclient/utils/constants.dart';


class AppText extends StatelessWidget {

  final String text;
  final double size;
  final FontWeight fontWeight;
  final Color? color;
  final bool? isCentered;
  final double? lineSpacing;
  final bool? isShadow;

  const AppText({
    super.key,
    required this.text,
    required this.size,
    required this.fontWeight,
    this.color,
    this.isCentered,
    this.lineSpacing,
    this.isShadow
  });

  @override
  Widget build(BuildContext context) {
    return Text(

      text,
      textAlign: isCentered ?? false ? TextAlign.center : TextAlign.start,
      style: TextStyle(
        fontSize: size,
        fontWeight: fontWeight,
        color: color ??appTextColor,
        height: lineSpacing ?? 1.0,
        shadows: isShadow == null ? null : [
          Shadow(
            blurRadius: 4,
            color: Colors.black.withOpacity(0.4),
            offset: Offset(1.5, 1.5),
          ),
        ],
      )
    );
  }
}