import 'package:flutter/material.dart';
import 'package:state_management/provider/favorite_provider.dart';
//import 'package:flutter_slidable/flutter_slidable.dart';



class FavouriteScreen extends StatefulWidget {
  const FavouriteScreen({super.key});

  @override
  State<FavouriteScreen> createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen> {
  @override


  
  Widget build(BuildContext context) {
    final provider = FavoriteProvider.of(context);
    final finalList = provider.favorites;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red,
          centerTitle: true,
          title: const Text(
            "Favorite",
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: Column(
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 20, left: 20),
              child: Row(
                children: [
                  Text(
                    "Favorites",
                    style: TextStyle(fontSize: 27, fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                  itemCount: finalList.length,
                  itemBuilder: (context, index) {
                    return  Padding(
                      padding: const EdgeInsets.all(8),
                      // child: Slidable(
                      //   endActionPane: ActionPane(
                      //     motion: const ScrollMotion(),
                      //     children: [
                      //       SlidableAction(
                      //         onPressed: (context) {
                      //           finalList.removeAt(index);
                      //           setState(() {
                                  
                      //           });

                                
                      //         },
                      //         backgroundColor: Colors.red,
                      //         foregroundColor: Colors.white,
                      //         icon: Icons.delete,
                      //         label: 'Delete',
                      //         )
                      //     ],
                      //   ),
                        child: ListTile(
                          title: Text(
                            finalList[index].name,
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold
                            ),
                          ),
                          subtitle: Text(
                            finalList[index].description,
                            overflow: TextOverflow.ellipsis,
                          ),
                          leading: CircleAvatar(
                            radius: 30,
                            backgroundImage: AssetImage(finalList[index].image),
                            backgroundColor: Colors.red.shade100,
                          ),
                          trailing: Text(
                            '\$${finalList[index].price}',
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold
                            ),
                          ),
                          tileColor: Colors.white,
                        ),
                      );
                    
                  }),
            ),
          ],
        ));
  }
}
