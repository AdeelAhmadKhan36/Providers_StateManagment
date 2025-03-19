import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/single_provider/count_provider.dart';

class SelectorExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print("Selector Widget Built");

    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text('Selector Provider Example',

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
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            //  Selector Rebuilds Only When count Changes
            Selector<CountProvider, int>(
              selector: (context, provider) => provider.count,
              builder: (context, count, child) {
                print(" Selector: Count Text Rebuilt");
                return Text(
                  "Count: $count",
                  style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                );
              },
            ),

            SizedBox(height: 20),

            // Selector Rebuilds Only When message Changes
            Selector<CountProvider, String>(
              selector: (context, provider) => provider.message,
              builder: (context, message, child) {
                print("Selector: Message Text Rebuilt");
                return Text(
                  "Message: $message",
                  style: TextStyle(fontSize: 20),
                );
              },
            ),

            SizedBox(height: 20),

            Padding(
              padding: const EdgeInsets.only(left: 16, right: 16, top: 100),
              child: Column(
                children: [
                  ElevatedButton(
                    onPressed: () => context.read<CountProvider>().incrementCount(),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.indigo, // Background color
                      foregroundColor: Colors.white,  // Text color
                      minimumSize: Size(double.infinity, 50),     // Width & Height
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8), // Border radius
                      ),
                    ),
                    child: Text("Increase Count", style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18
                    ),),
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () => context.read<CountProvider>().updateMessage(),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.indigo, // Background color
                      foregroundColor: Colors.white,  // Text color
                      minimumSize: Size(double.infinity, 50),     // Width & Height
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8), // Border radius
                      ),
                    ),
                    child: Text("Update Message",style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18
                    ),),
                  ),
                ],
              ),
            ),

          ],
        ),
      ),
    );
  }
}
