import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cambio de Color',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const ColorChangeScreen(),
    );
  }
}

class ColorChangeScreen extends StatefulWidget {
  const ColorChangeScreen({super.key});

  @override
  State<ColorChangeScreen> createState() => _ColorChangeScreenState();
}

class _ColorChangeScreenState extends State<ColorChangeScreen> {
  Color _containerColor = Colors.blue;
  final List<Color> _colors = [Colors.blue, Colors.red, Colors.green];
  int _currentColorIndex = 0;

  void _changeColor() {
    setState(() {
      _currentColorIndex = (_currentColorIndex + 1) % _colors.length;
      _containerColor = _colors[_currentColorIndex];
    });
  }

  void _changeColorBlanco() {
    setState(() {
      _containerColor = Colors.white;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Cambio de Color')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 300,
              height: 300,
              color: _containerColor,
              alignment: Alignment.center,
              child: const Text(
                '!Cambio de Color!',
                style: TextStyle(fontSize: 18, color: Colors.white),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _changeColor,
              child: const Text('Cambiar Color'),
            ),
            ElevatedButton(
              onPressed: _changeColorBlanco,
              child: const Text('Color a Blanco'),
            ),
          ],
        ),
      ),
    );
  }
}
