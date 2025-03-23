import 'package:flutter/material.dart';
import 'package:providers_statemanagment/providers/fav_app_provider.dart';
import 'package:providers_statemanagment/providers/multi_provider/slider_provider.dart';
import 'package:providers_statemanagment/providers/single_provider/count_provider.dart';
import 'package:providers_statemanagment/providers/theme_provider.dart';
import 'package:providers_statemanagment/view/Login/login.dart';
import 'package:providers_statemanagment/view/exampe_one.dart';
import 'package:provider/provider.dart';
import 'package:providers_statemanagment/view/fav_screen/selected_fav_screen.dart';
import 'package:providers_statemanagment/view/selector/SliderSelector.dart';
import 'package:providers_statemanagment/view/selector/selector_provider.dart';
import 'package:providers_statemanagment/view/sliderscreen.dart';
import 'package:providers_statemanagment/view/stateless_widget/Notifier_Listener.dart';
import 'package:providers_statemanagment/view/theme/them_home.dart';
import 'package:providers_statemanagment/view_model/auth_controller.dart';

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
        ChangeNotifierProvider( create:(_)=>FavProvider(),),
        ChangeNotifierProvider( create:(_)=>ThemeChanger(),),
        ChangeNotifierProvider( create:(_)=>Auth_Controller(),)
      ],

      child: Builder(builder: (BuildContext context){
        final themeprovider=Provider.of<ThemeChanger>(context);

        return  MaterialApp(

          debugShowCheckedModeBanner: false,
          themeMode: themeprovider.themeMode,
          theme: ThemeData(
            primarySwatch: Colors.red,
              brightness: Brightness.light,
            appBarTheme: const AppBarTheme(
              backgroundColor: Colors.indigo, // Use primary color
              titleTextStyle: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
              iconTheme: IconThemeData(color: Colors.white),
            ),


          ),

          darkTheme: ThemeData(
            brightness: Brightness.dark,
            primarySwatch: Colors.blue,
            appBarTheme: const AppBarTheme(
              backgroundColor: Colors.red, // Use primary color
              titleTextStyle: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
              iconTheme: IconThemeData(color: Colors.white),
            ),

          ),

          home: LoginPage(),
        );
      })

    );
  }
}

