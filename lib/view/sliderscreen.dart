import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/multi_provider/slider_provider.dart';

class Sliderscreen extends StatefulWidget {
  const Sliderscreen({super.key});

  @override
  State<Sliderscreen> createState() => _SliderscreenState();
}

class _SliderscreenState extends State<Sliderscreen> {
  @override
  Widget build(BuildContext context) {
    // final sldierProvider=Provider.of<SliderProvider>(context, listen: true);

    print("Sliderscreen");
    return Scaffold(

      appBar: AppBar(
        title: Center(
          child: Text('Sliders',

            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20.0,
              color: Colors.white,

            ),),
        ),
        backgroundColor: Colors.indigo,
      ),
      body: Center(
        child: Column(

          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
           Consumer<SliderProvider>(
               builder: (context, value, child){
                 print("Slider Widget Rebuilt");

                 return  Slider(
               min: 0.0, value: value.value, onChanged: (double val) {
               value.setValue(val);

             }
             );


           }
           ),
            Consumer<SliderProvider>(builder: (context, value, child)
            {
              print("Opacity & Text Widgets Rebuilt");

              return    Row(

                children: [
                  Expanded(
                    child: Container(
                      height:150,
                      decoration: BoxDecoration(
                          color: Colors.red
                      ),
                      child: Text(
                        'Value: ${value.value.toStringAsFixed(2)}',
                        style: TextStyle(
                          color: Colors.white.withOpacity(value.value),
                          fontSize: 20.0,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height:150,
                      decoration: BoxDecoration(
                          color: Colors.green.withOpacity(value.value)
                      ),
                      child: Text(
                        'Value: ${value.value.toStringAsFixed(2)}',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
                        ),
                      ),
                    ),
                  )
                ],
              );
            }
            )


  ]
    )
    )
    );
  }
}
