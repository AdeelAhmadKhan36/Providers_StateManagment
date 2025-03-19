import 'package:flutter/material.dart';
import 'package:providers_statemanagment/providers/single_provider/count_provider.dart';
import 'package:providers_statemanagment/view/exampe_one.dart';
import 'package:provider/provider.dart';
import 'package:providers_statemanagment/view/selector/selector_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create:(_)=>CountProvider(),
      child: MaterialApp(
        home:ConsumerExample(),
      ),

    );
  }
}

