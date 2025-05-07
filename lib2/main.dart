import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Consumer(
        builder: (context, ref, child) {
          return Scaffold(
            appBar: AppBar(
              title: Text(
                'ITEM LIST',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            body: ListView.builder(
              itemCount: 1,
              itemBuilder: (BuildContext context, int index) {
                return ;
              },
            ),,
          );
        },
      ),
    );
  }
}
