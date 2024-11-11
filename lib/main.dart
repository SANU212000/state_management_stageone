import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'counter.dart';
import 'screen1.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => Counter(),
      
      child: const MyApp(),
    ),
  );
}
