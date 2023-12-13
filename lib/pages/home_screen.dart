import 'package:flutter/material.dart';
import 'package:state_management/models/jacketlist.dart';
import 'package:state_management/models/my_products.dart';
import 'package:state_management/models/sneakerslist.dart';
import 'package:state_management/pages/cart_details.dart';
import 'package:state_management/pages/details_screen.dart';

import '../widgets/product_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int isSelected = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("E - Commerce Shop",
        style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const CartDetails(),
              ),
            ),
            icon: const Icon(Icons.add_shopping_cart,
            color: Colors.white,),
          ),
        ],
        backgroundColor: Colors.red,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Our Products",
              style: TextStyle(
                fontSize: 27,
                fontWeight: FontWeight.bold,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildProductCategory(index: 0, name: "All Products"),
                _buildProductCategory(index: 1, name: "Jackets"),
                _buildProductCategory(index: 2, name: "Sneakers"),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: isSelected == 0
                  ? _buildAllProducts()
                  : isSelected == 1
                      ? _buildJackets()
                      : _builsSneakers(),
            ),
          ],
        ),
      ),
    );
  }

  ///build method for category
  _buildProductCategory({required int index, required String name}) =>
      GestureDetector(
        onTap: () => setState(() => isSelected = index),
        child: Container(
          width: 100,
          height: 40,
          margin: const EdgeInsets.only(top: 10, right: 10),
          alignment: Alignment.center,
          decoration: BoxDecoration(
              color: isSelected == index ? Colors.red : Colors.red.shade300,
              borderRadius: BorderRadius.circular(8)),
          child: Text(
            name,
            style: const TextStyle(color: Colors.white),
          ),
        ),
      );

  ///build method for Allproducts
  _buildAllProducts() => GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: (100 / 140),
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
        ),
        scrollDirection: Axis.vertical,
        itemCount: MyProduct.allProducts.length,
        itemBuilder: (context, index) {
          final allProducts = MyProduct.allProducts[index];
          return GestureDetector(
              onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          DetailsScreen(product: allProducts))),
              child: ProductCard(product: allProducts));
        },
      );

  /////build method for Jackets
  _buildJackets() => GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: (100 / 140),
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
        ),
        scrollDirection: Axis.vertical,
        itemCount: MyProducts.jacketsList.length,
        itemBuilder: (context, index) {
          final jacketsList = MyProducts.jacketsList[index];
          return GestureDetector(
              onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          DetailsScreen(product: jacketsList))),
              child: ProductCard(product: jacketsList));
        },
      );

  ///build method for sneakers
  _builsSneakers() => GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: (100 / 140),
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
        ),
        scrollDirection: Axis.vertical,
        itemCount: MyProductss.sneakersList.length,
        itemBuilder: (context, index) {
          final sneakerList = MyProductss.sneakersList[index];
          return GestureDetector(
              onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          DetailsScreen(product: sneakerList))),
              child: ProductCard(product: sneakerList));
        },
      );
}
