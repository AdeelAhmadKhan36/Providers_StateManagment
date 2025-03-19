import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:providers_statemanagment/providers/single_provider/count_provider.dart';
import 'package:providers_statemanagment/view/selector/selector_provider.dart';

class ConsumerExample extends StatefulWidget {
  @override
  State<ConsumerExample> createState() => _ConsumerExampleState();
}

class _ConsumerExampleState extends State<ConsumerExample> {
  @override
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<CountProvider>(context, listen: false);
    });
  }

  Widget build(BuildContext context) {
    print(" Consumer Widget Rebuilt");

    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text('Consumer Widget',

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

            //  Consumer Rebuilds Entire Widget
            Consumer<CountProvider>(
              builder: (context, provider, child) {
                print("Consumer: Count Text Rebuilt");
                return Text(
                  "Count: ${provider.count}",
                  style: const TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                );
              },
            ),

            const SizedBox(height: 20),

            // This text should NOT rebuild when count changes, but it will!
            Consumer<CountProvider>(
              builder: (context, provider, child) {
                print("Consumer: Message Text Rebuilt");
                return Text(
                  "Message: ${provider.message}",
                  style: const TextStyle(fontSize: 20),
                );
              },
            ),

            const SizedBox(height: 40),

            Padding(
              padding: const EdgeInsets.only(left: 16, right: 16, top: 100),
              child: Column(
                children: [
                  ElevatedButton(
                    onPressed: () => context.read<CountProvider>().incrementCount(),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.indigo, // Background color
                      foregroundColor: Colors.white,  // Text color
                      minimumSize: const Size(double.infinity, 50),     // Width & Height
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8), // Border radius
                      ),
                    ),
                    child: const Text("Increase Count", style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18
                    ),),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () => context.read<CountProvider>().updateMessage(),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.indigo, // Background color
                      foregroundColor: Colors.white,  // Text color
                      minimumSize: const Size(double.infinity, 50),     // Width & Height
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8), // Border radius
                      ),
                    ),
                    child: const Text("Update Message",style: TextStyle(
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
      floatingActionButton: FloatingActionButton(
        onPressed: (){


          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ChangeNotifierProvider(
                create: (context) => CountProvider(), // New instance for SelectorExample
                child: SelectorExample(),
              ),
            ),
          );


        },
        tooltip: 'Next',
        backgroundColor: Colors.indigo,

        child: const Icon(Icons.arrow_forward_ios,color: Colors.white, ),

    ))
    ;
  }
}
