import 'dart:math';

import 'package:fluttertoast/fluttertoast.dart';

import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(),
      home: ColorPickerPage(),
    );
  }
}

class ColorPickerPage extends StatefulWidget {
  const ColorPickerPage({super.key});

  @override
  State<ColorPickerPage> createState() => _ColorPickerPageState();
}

class _ColorPickerPageState extends State<ColorPickerPage> {
  Color selectedColor = Colors.red;

  final Map<Color, String> renkler = {
    Colors.red: 'Kırmızı',
    Colors.blue: 'Mavi',
    Colors.green: 'Yeşil',
    Colors.yellow: 'Sarı',
    Colors.purple: 'Mor',
  };
  bool isCircular = false;
  bool isShowColorName = true;
  void _containerSekliniDegistir() {
    setState(() {
      isCircular = !isCircular;
    });
  }

  void _renginKodunuGoster() {
    Fluttertoast.showToast(
      msg:
          "RGB: (${selectedColor.red}, ${selectedColor.green}, ${selectedColor.blue})",
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: selectedColor,
      textColor: Colors.white,
      fontSize: 18.0,
    );
  }

  void rastgeleSayiSec() {
    final colors = renkler.keys.toList();
    final rastgeleSayi = Random().nextInt(colors.length);
    final randomColor = colors[rastgeleSayi];
    setState(() {
      selectedColor = randomColor;
      //  debugPrint(rastgeleSayi.toString());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Renk Seçici'),
        centerTitle: true,
        actions: [
          PopupMenuButton<String>(
            onSelected: (value) {
              setState(() {
                isShowColorName = !isShowColorName;
              });
            },
            itemBuilder: (context) {
              return [
                PopupMenuItem(
                  value: 'a',
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        isShowColorName
                            ? Icons.visibility_off
                            : Icons.visibility,
                        size: 20,
                        color: Colors.black,
                      ),
                      SizedBox(width: 8),

                      isShowColorName
                          ? Text('Renk Adını Gizle')
                          : Text('Renk Adını Göster'),
                    ],
                  ),
                ),
              ];
            },
            icon: Icon(Icons.more_vert),
          ),
        ],
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 20),
            Container(
              width: 300,
              height: 300,
              decoration: BoxDecoration(
                color: selectedColor,
                borderRadius: BorderRadius.circular(isCircular ? 300 : 10),
                boxShadow: [
                  BoxShadow(
                    color: selectedColor.withOpacity(0.5),
                    blurRadius: 10,
                    spreadRadius: 2,
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
            isShowColorName ? Text(renkler[selectedColor]!) : SizedBox(),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  DropdownButton<Color>(
                    value: selectedColor,
                    items: renkler.entries.map((entry) {
                      return DropdownMenuItem(
                        value: entry.key,
                        child: Row(
                          children: [
                            Container(width: 20, height: 20, color: entry.key),
                            SizedBox(width: 4),
                            Text(entry.value),
                          ],
                        ),
                      );
                    }).toList(),
                    onChanged: (value) {
                      setState(() {
                        selectedColor = value!;
                      });
                    },
                  ),
                  ElevatedButton(
                    onPressed: rastgeleSayiSec,
                    child: Text("Rastgele"),
                  ),
                  IconButton(
                    onPressed: _renginKodunuGoster,
                    icon: Icon(Icons.info),
                  ),
                  IconButton(
                    onPressed: () {
                      _containerSekliniDegistir();
                    },
                    icon: Icon(
                      isCircular ? Icons.circle_rounded : Icons.circle_outlined,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
