import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo_list_app/app/core/ui/consts/todo_colors.dart';
import 'package:todo_list_app/app/core/ui/consts/todo_sizes.dart';

class AppConfigUI {
  AppConfigUI._();

  static final ThemeData theme = ThemeData(
    useMaterial3: true,
    scaffoldBackgroundColor: TodoColors.backgroundColor,
    appBarTheme: const AppBarTheme(
        backgroundColor: TodoColors.primaryColor,
        elevation: 0,
        centerTitle: true,
        iconTheme:
            IconThemeData(color: TodoColors.white, size: TodoSizes.size20)),
    colorSchemeSeed: TodoColors.primaryColor,
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
          backgroundColor: TodoColors.primaryColor,
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(8)))),
    ),
    iconButtonTheme: IconButtonThemeData(
        style: ButtonStyle(
      fixedSize:
          MaterialStateProperty.all(const Size.fromRadius(TodoSizes.size25)),
      iconSize: MaterialStateProperty.all(TodoSizes.size20),
      iconColor: MaterialStateProperty.all(TodoColors.white),
      backgroundColor: MaterialStateProperty.resolveWith((states) {
        if (states.contains(MaterialState.pressed)) {
          return TodoColors.secondColor;
        }
        return TodoColors.primaryColor;
      }),
    )),
    inputDecorationTheme: InputDecorationTheme(
      border: const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(8)),
        borderSide: BorderSide(color: TodoColors.secondColor),
      ),
      focusedBorder: const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(8)),
        borderSide: BorderSide(color: TodoColors.secondColor),
      ),
      labelStyle: GoogleFonts.sourceSansPro(
        fontSize: 15,
        fontWeight: FontWeight.w500,
        color: TodoColors.black,
      ),
    ),
  );
}
