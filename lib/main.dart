import 'package:flutter/material.dart';
import 'package:providers_statemanagment/providers/fav_app_provider.dart';
import 'package:providers_statemanagment/providers/multi_provider/slider_provider.dart';
import 'package:providers_statemanagment/providers/single_provider/count_provider.dart';
import 'package:providers_statemanagment/view/exampe_one.dart';
import 'package:provider/provider.dart';
import 'package:providers_statemanagment/view/fav_screen/selected_fav_screen.dart';
import 'package:providers_statemanagment/view/selector/SliderSelector.dart';
import 'package:providers_statemanagment/view/selector/selector_provider.dart';
import 'package:providers_statemanagment/view/sliderscreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider( create:(_)=>CountProvider(),),
        ChangeNotifierProvider( create:(_)=>SliderProvider(),),
        ChangeNotifierProvider( create:(_)=>FavProvider(),)
      ],

      child: const MaterialApp(
        debugShowCheckedModeBanner: false,

        home:FavSelectedScreen(),
      ),

    );
  }
}

