import 'package:flutter/material.dart';
import 'package:sneaker_shop/models/shoe.dart';

class Cart extends ChangeNotifier{
  // list of shoes for sale 
  List<Shoe> shoeShop=[
    Shoe(
      name:"Zoom Freak", price: "236", 
      imagePath: 'lib/images/ZoomFreak.png', 
      description: 'The forward-thinking design of his signature shoe'),
    Shoe(
      name:"Air Jordans", price: "220", 
      imagePath: 'lib/images/AirJordan.png', 
      description: 'you\'ve got the hops and the speed-lace up in shoes that enhace what you bring to the court.'),
    Shoe(
      name:"KD Treys", price: "240", 
      imagePath: 'lib/images/KDTREY.png', 
      description: 'A secure midfoot trap is suited for scoring binges and defensive'),
    Shoe(
      name:"Kyrie 6", price: "190", 
      imagePath: 'lib/images/Kyrie.png', 
      description: 'Bouncy cushioning is paired with soft yet supportive foam for res'),
  ];

  // list of items user put in the cart
  List<Shoe> userCart=[];
  // get list of shoes for sale
  List<Shoe> getShoeList(){
    return shoeShop;
  }
  // get cart 
  List<Shoe> getuserCart(){
    return userCart;
  }
  // add items to the cart
  void addItemToCart(Shoe shoe)
  {
    userCart.add(shoe);
    notifyListeners();
  }
  // remove the items from the cart
  void removeItemFromCart(Shoe shoe)
  {
    userCart.remove(shoe);
    notifyListeners();
  }

}