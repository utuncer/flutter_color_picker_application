import 'package:flutter/material.dart';
import 'package:flutter_color_picker_application/pages/color_picker_page.dart';
import 'package:flutter_color_picker_application/theme/app_theme.dart';

void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.theme,
      home: ColorPickerPage(),
    );
  }
}
