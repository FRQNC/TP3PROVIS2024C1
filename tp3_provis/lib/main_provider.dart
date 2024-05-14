import 'package:flutter/material.dart';
import 'package:tp3_provis/provider/product_provider.dart';
import 'package:tp3_provis/app_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider<ProductProvider>(
    create: (context) => ProductProvider(),
    child: const MainApp(),
  ));
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const MainShopePage(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: const Color(0xFF4A707A),
          secondary: const Color(0xFFC2C8C5),
          tertiary: const Color(0xFF94B0B7),
          onPrimary: const Color(0xFF37363B),
          onSecondary: const Color(0xFFDDDDDA),
          primaryContainer: const Color(0x5ED9D9D9),
        ),
        fontFamily: 'Poppins',
        scaffoldBackgroundColor: Colors.white

      ),
    );
  }
}

mixin AppMixin{
  FontWeight bold = FontWeight.w700;
  FontWeight semi = FontWeight.w600;
  FontWeight medium = FontWeight.w500;
  FontWeight light = FontWeight.w500;
  Color boxColor = Color(0xFFD9D9D9).withOpacity(0.45);
  Color dividerColor = Color(0xFFD9D9D9);
  double sideMargin = 20;
}