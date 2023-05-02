import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo_list_app/app/core/theme/consts/todo_colors.dart';

class TodoLabel extends StatelessWidget {
  const TodoLabel(
      {required this.text,
      this.color = Colors.black,
      this.fontSize = 15,
      this.fontWeight = FontWeight.w400,
      this.maxLines = 1,
      this.textAlign = TextAlign.left,
      this.textOverflow = TextOverflow.ellipsis,
      this.letterSpacing = 0.0,
      this.textDecoration = TextDecoration.none,
      this.decorationColor = TodoColors.greyColor,
      super.key});

  final String text;
  final Color color;
  final double fontSize;
  final FontWeight fontWeight;
  final TextAlign textAlign;
  final TextOverflow textOverflow;
  final int maxLines;
  final double letterSpacing;
  final TextDecoration textDecoration;
  final Color decorationColor;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.sourceSansPro(
        fontSize: fontSize,
        fontWeight: fontWeight,
        color: color,
        letterSpacing: letterSpacing,
        decoration: textDecoration,
        decorationColor: decorationColor,
      ),
      maxLines: maxLines,
      textAlign: textAlign,
      overflow: textOverflow,
    );
  }
}
