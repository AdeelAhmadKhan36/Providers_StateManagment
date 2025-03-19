//Why we need Statemanagment
///Statemanagment we need to manage the state of widgte , like on that widgt should be refreshed
///Statmanagment make app fast use less memory

import "package:flutter/material.dart";
class WhyStateManagment extends StatefulWidget {
  const WhyStateManagment({super.key});

  @override
  State<WhyStateManagment> createState() => _WhyStateManagmentState();
}

class _WhyStateManagmentState extends State<WhyStateManagment> {
  int count=0;

  @override
  Widget build(BuildContext context) {
    print("Build");
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("StateManagment")),
        backgroundColor: Colors.indigo,
      ),


      body: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

        Container(
          child:Center(
            child: Text(
              count.toString(),
              style: TextStyle(
                fontSize: 50
              ),
            ),
          ),
        )

        ],

      ),
  floatingActionButton: FloatingActionButton(onPressed:(){
    setState(() {

      count ;
    });

      print(count++);
  },
  child: Icon(Icons.add),
  ),
    );
  }
}
