import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:providers_statemanagment/providers/fav_app_provider.dart';
import 'package:providers_statemanagment/view/fav_screen/onlyfav.dart';
class FavSelectedScreen extends StatefulWidget {
  const FavSelectedScreen({super.key});

  @override
  State<FavSelectedScreen> createState() => _FavSelectedScreenState();
}

class _FavSelectedScreenState extends State<FavSelectedScreen> {
  List<int>SelectedItem=[];
  @override
  Widget build(BuildContext context) {
    // final favpro=Provider.of<FavProvider>(context);

    print("Favourites Building");
    return Scaffold(

      appBar: AppBar(
        title: const Text(
          'Favourites',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20.0,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.indigo,
        elevation: 4, // Adds slight shadow for better visibility
        centerTitle: true, // Keeps the title centered properly
        actions: [
          IconButton(
            icon: const Icon(Icons.favorite, color: Colors.white),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context)=>OnlySelected()));
            },
          ),
        ],
      ),
      body:Column(
        children: [
          Expanded(
            child: ListView.builder(
                itemCount: 100,
                itemBuilder: (context, index){
                  return Selector<FavProvider, List<int>>(

                      builder: (context, selectedItems, child){

                        return ListTile(
                        onTap: () {
                          Provider.of<FavProvider>(context, listen: false).toggleItem(index);

                        },
                  title: Text("Item:${index}"),
                  trailing:Icon(

                    selectedItems.contains(index)?Icons.favorite:Icons.favorite_border_outlined,)
                  );
                  },
                      selector: (context, provider)=>provider.selectedItem);
                  
                }),
          )
        ],
      ),

    );
  }
}
