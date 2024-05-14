import 'package:flutter/material.dart';
import 'package:tp3_provis/pages/product_cubit_page.dart';
import 'package:tp3_provis/pages/product_cubit_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
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
      home: const MyHomePage(title: 'Tugas Praktikum : State Management & Web Service'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                
              },
              child: Text('Provider Page'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ProductCubitPage()), // Navigasi ke halaman ProductCubit
                );
              },
              child: Text('Bloc Page'),
            ),
          ],
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
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