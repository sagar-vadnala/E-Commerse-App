import 'package:flutter/material.dart';
import 'package:state_management/provider/favorite_provider.dart';

class CartDetails extends StatefulWidget {
  const CartDetails({super.key});

  @override
  State<CartDetails> createState() => _CartDetailsState();
}

class _CartDetailsState extends State<CartDetails> {
  @override
  Widget build(BuildContext context) {
    // final provider = CartProvider.of(context);
    // final finalList = provider.favorites;

    final provider = FavoriteProvider.of(context);
    final finalList = provider.favorites;


  // final provider = FavoriteProvider.of(context);
  //   final finalList = provider.favorites;


    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "My Cart",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.red,
      ),
      body: Column(
        children: [
          // /my logic of expanded,
          Expanded(
              child: ListView.builder(
            itemCount: finalList.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(8),
                child: ListTile(
                  title: Text(
                    finalList[index].name,
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold),
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
                        fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  tileColor: Colors.white,
                ),
              );
            },
          ))
        ],
      ),
    );
  }
}
