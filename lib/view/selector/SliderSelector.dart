import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:providers_statemanagment/providers/multi_provider/slider_provider.dart';


class SelectorProvider extends StatefulWidget {
  const SelectorProvider({super.key});

  @override
  State<SelectorProvider> createState() => _SelectorProviderState();
}

class _SelectorProviderState extends State<SelectorProvider> {
  @override
  Widget build(BuildContext context) {

    print("Sliderscreen");
    return Scaffold(

        appBar: AppBar(
          title: const Center(
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
                 Selector<SliderProvider, double>(

                    selector: (context, provider){
                      return provider.value;
                    },
                   builder: (context, slideValue, child){
                      print("Select Build");
                      return Slider(
                          min: 0.0, value: slideValue, onChanged: (double val) {
                        context.read<SliderProvider>().setValue(val);

                      }
                      );
                   },
                 ),


                Selector<SliderProvider, double>(
                    builder: (context, slidervalue, child){
                      return Row(

                        children: [
                          Expanded(
                            child: Container(
                              height:150,
                              decoration: const BoxDecoration(
                                  color: Colors.red
                              ),
                              child: Text(
                                'Value: ${slidervalue.toStringAsFixed(2)}',
                                style: TextStyle(
                                  color: Colors.white.withOpacity(slidervalue),
                                  fontSize: 20.0,
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              height:150,
                              decoration: BoxDecoration(
                                  color: Colors.green.withOpacity(slidervalue)
                              ),
                              child: Text(
                                'Value: ${slidervalue.toStringAsFixed(2)}',
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 20.0,
                                ),
                              ),
                            ),
                          )
                        ],
                      );
                    },
                    selector: (context, providr)=>providr.value)


                ]
            )
        )
    );
  }
}
