import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sneaker_shop/components/cart_item.dart';
import 'package:sneaker_shop/models/cart.dart';
import 'package:sneaker_shop/models/shoe.dart';
class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Consumer<Cart>(
      builder: (context,value,child)=>Padding(
      padding:const  EdgeInsets.symmetric(horizontal: 25.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // heading
          Text("My Cart",style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20,),
          Expanded(child: ListView.builder(
            itemCount: value.getuserCart().length,
            itemBuilder: (context,index){
            // get individual shoe
            Shoe individualShoe = value.getuserCart()[index];
            // return cart item
            return CartItem(shoe: individualShoe);
          }))
        ],
      ),
      ),
      );
  }
}