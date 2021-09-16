import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextWidget extends StatelessWidget {
  final String text;
  final TextStyle? textStyle;
  final double? fontSize;
  final Color? color;
  final FontWeight? fontWeight;
  final int? maxLines;
  final TextOverflow? overflow;
  final MainAxisAlignment mainAxisAlignment;

  const CustomTextWidget({
    Key? key,
    this.text = '',
    this.textStyle,
    this.fontSize,
    this.color,
    this.fontWeight,
    this.maxLines,
    this.overflow,
    this.mainAxisAlignment = MainAxisAlignment.start,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: mainAxisAlignment,
      children: [
        Flexible(
          child: Text(
            '$text',
            style: textStyle == null ? GoogleFonts.roboto() : textStyle!.copyWith(color: color, fontSize: fontSize, fontWeight: fontWeight),
            maxLines: maxLines,
            softWrap: true,
            overflow: overflow,
          ),
        ),
      ],
    );
  }
}
