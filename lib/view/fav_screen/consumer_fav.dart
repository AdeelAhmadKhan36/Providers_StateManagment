import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:providers_statemanagment/providers/fav_app_provider.dart';
class FavScreenConsumer extends StatefulWidget {
  const FavScreenConsumer({super.key});

  @override
  State<FavScreenConsumer> createState() => _FavScreenConsumerState();
}

class _FavScreenConsumerState extends State<FavScreenConsumer> {
  List<int>SelectedItem=[];
  @override
  Widget build(BuildContext context) {
    // final favpro=Provider.of<FavProvider>(context);

    print(" Consumer Favourites Building");
    return Scaffold(

      appBar: AppBar(
        title: const Center(
          child: Text('Favourits ',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20.0,
              color: Colors.white,

            ),),
        ),
        backgroundColor: Colors.indigo,
      ),
      body:Column(
        children: [
          Expanded(
            child: ListView.builder(
                itemCount: 100,
                itemBuilder: (context, index){
                  return Consumer<FavProvider>(

                      builder: (context,value , child){

                    return ListTile(
                        onTap: () {
                          // Provider.of<FavProvider>(context, listen: false).toggleItem(index);
                          value.toggleItem(index);

                        },
                        title: Text("Item:${index}"),
                        trailing:Icon(

                          value.selectedItem.contains(index)?Icons.favorite:Icons.favorite_border_outlined,)
                    );
                  });

                }),
          )
        ],
      ),

    );
  }
}
