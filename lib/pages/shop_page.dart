import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sneaker_shop/components/shoe_tile.dart';
import 'package:sneaker_shop/models/cart.dart';
import 'package:sneaker_shop/models/shoe.dart';
class ShopPage extends StatefulWidget {
  const ShopPage({super.key});

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  void addShoeToCart(Shoe shoe)
  {
    Provider.of<Cart>(context,listen: false).addItemToCart(shoe);
    // alert the user that the shoe has been added
    showDialog(context: context, builder: (context)=>const AlertDialog(
      title: Text("Shoe added successfully!"),
      content: Text("Check your cart"),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<Cart>(builder: (context,value, child)=>Column(
      children: [
        // search bar 
        Container(
          padding: const EdgeInsets.all(12),
          margin: const EdgeInsets.symmetric(horizontal: 25.0),
          decoration: BoxDecoration(color: Colors.grey[200],borderRadius: BorderRadius.circular(8)),
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children:  [
              Text("Search",style: TextStyle(color: Colors.grey),),
              Icon(Icons.search, color: Colors.grey,)
            ],
          ),
        ),

        // message 
        Padding(
          padding: const EdgeInsets.symmetric(vertical:25.0),
          child: Text("everyone flies.. some fly longer than others",style: TextStyle(color: Colors.grey[600]),),
        ),

        // hotpicks
        const Padding(
          padding:  EdgeInsets.symmetric(horizontal: 25.0),
          child:  Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children:  [
              Text("Hot Picks 🔥",style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold),),
              Text("See all",style: TextStyle(color: Colors.blue),),
              ],),
        ),
        const SizedBox(height: 10),
        // list of shoes for sale
        Expanded(
          child: ListView.builder(
            itemCount: 4,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context,index)
            {
              // create a shoe
              Shoe shoe = value.getShoeList()[index];
              return ShoeTile(
                shoe: shoe,
                onTap:()=> addShoeToCart(shoe),
              );
            })
            ),
            const Padding(
              padding: EdgeInsets.only(top: 25.0,left: 25.0,right: 25.0),
              child: Divider(color: Colors.white,),)
      ],
    ),
    );
  }
}