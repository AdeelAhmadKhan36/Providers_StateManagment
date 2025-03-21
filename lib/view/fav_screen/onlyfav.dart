import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:providers_statemanagment/providers/fav_app_provider.dart';
class OnlySelected extends StatefulWidget {
  const OnlySelected({super.key});

  @override
  State<OnlySelected> createState() => _OnlySelectedState();
}

class _OnlySelectedState extends State<OnlySelected> {
  List<int>SelectedItem=[];
  @override
  Widget build(BuildContext context) {
    final favpro=Provider.of<FavProvider>(context);

    print("Favourites Building");
    return SafeArea(
      child: Scaffold(
      
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back), // ✅ Back Arrow
            onPressed: () {
              Navigator.pop(context); // ✅ Go back to the previous screen
            },
          ),
          title: const Text(
            'Favourites Selected',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20.0,
              color: Colors.white,
            ),
          ),
      
          backgroundColor: Colors.indigo,
          elevation: 4, // Adds slight shadow for better visibility
          centerTitle: true, // Keeps the title centered properly
      
        ),
        body:Column(
          children: [
            Expanded(
              child: ListView.builder(
                  itemCount:favpro.selectedItem.length ,
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
      
      ),
    );
  }
}
