import 'package:flutter/material.dart';
import 'package:sneaker_shop/models/shoe.dart';
class ShoeTile extends StatelessWidget {
  Shoe shoe;
  void Function()? onTap;
  ShoeTile({super.key,
  required this.shoe,
  required this.onTap,});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 25.0),
      width: 280,
      decoration: BoxDecoration(color: Colors.grey[100],borderRadius: BorderRadius.circular(12)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
        // show picture
        const SizedBox(height: 30,),
        ClipRRect(child: Image.asset(shoe.imagePath),
        borderRadius: BorderRadius.circular(12),),

        // description 
        // const SizedBox(height: 10,),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: Text(shoe.description,style: TextStyle(color: Colors.grey[600]),),
        ),
        // price +details
        Padding(
          padding: const EdgeInsets.only(left: 25.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(shoe.name,style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                  const SizedBox(height: 5,),
                  Text('\$'+shoe.price,style: const TextStyle(color: Colors.grey),),
                ],
              ),
              // button to add to cart
              GestureDetector(
                onTap: onTap,
                child: Container(
                  padding: const EdgeInsets.all(20),
                  decoration: const BoxDecoration(color: Colors.black,
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(12),bottomRight: Radius.circular(12))),
                  child: const Icon(Icons.add,color: Colors.white,),
                ),
              )
            ],
          ),
        )

   
      ],
      ),
    );
  }
}