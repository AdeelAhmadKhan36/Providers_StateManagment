import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/theme_provider.dart';
class Theme_Home extends StatefulWidget {
  const Theme_Home({super.key});

  @override
  State<Theme_Home> createState() => _Theme_HomeState();
}

class _Theme_HomeState extends State<Theme_Home> {
  @override
  Widget build(BuildContext context) {
    final themeprovider=Provider.of<ThemeChanger>(context);

    return Scaffold(
      appBar: AppBar(
        title:  const Center(
          child: Text('Theme',

            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20.0,
              color: Colors.white,

            ),),
        ),
      ),

      body: Column(
        children: [
          RadioListTile<ThemeMode>(
            title:const Text("Light Mode"),
              value: ThemeMode.light,
              groupValue: themeprovider.themeMode,
              onChanged: themeprovider.settheme

          ),
          RadioListTile<ThemeMode>(
            title: const Text("Dark Mode"),
              value: ThemeMode.dark,
              groupValue: themeprovider.themeMode,
              onChanged: themeprovider.settheme
          ),
          RadioListTile<ThemeMode>(
              title:const Text("System Mode"),
              value: ThemeMode.system,
              groupValue: themeprovider.themeMode,
              onChanged: themeprovider.settheme

          )

        ],
      ),



    );
  }
}
