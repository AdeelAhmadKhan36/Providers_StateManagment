import 'package:flutter/material.dart';

class NotifierListenerScreen extends StatelessWidget {
   NotifierListenerScreen({super.key});



  ValueNotifier<int> _count= ValueNotifier<int>(0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: const Center(
          child: Text('NotifierListenerScreen',

            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20.0,
              color: Colors.white,

            ),),
        ),
        backgroundColor: Colors.indigo,
      ),
        body: Center(
          child: ValueListenableBuilder(
              valueListenable: _count,
              builder: (context, value, child){
                return Text(

                  _count.value.toString(),
                  style: const TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                );
          })
        ),

        floatingActionButton: FloatingActionButton(onPressed:(){

          _count.value++;
          print(_count.value.toString());
        },
          child: Icon(Icons.add),
        ),

    );
  }
}
