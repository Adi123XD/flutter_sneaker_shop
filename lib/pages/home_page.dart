import 'package:flutter/material.dart';
import 'package:sneaker_shop/components/bottom_nav_bar.dart';
import 'package:sneaker_shop/pages/cart_page.dart';
import 'package:sneaker_shop/pages/shop_page.dart';
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // the selected index is to control the botton nav bar
  int _selectedIndex =0;
  final List<Widget> _pages=[
    // shop page
    const ShopPage(),
    // cart page
    const CartPage(),
  ];
  void navigateBottomBar(int index)
  {
    setState(() {
      _selectedIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading:Builder(
          builder: (context) {
            return IconButton(
              icon: const Padding(
                padding:  EdgeInsets.only(left: 12.0),
                child:  Icon(Icons.menu,
                color: Colors.black,),
              ),
              onPressed: (){Scaffold.of(context).openDrawer();}
            );
          }
        ), 
      ),
      drawer: Drawer(
        backgroundColor: Colors.grey[900],
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                // logo
                DrawerHeader(
                  child:Image.asset('lib/images/nike.png',color: Colors.white,width: 200,),
                ),
            
                // Padding(padding: EdgeInsets.symmetric(horizontal: 25.0),
                // child: Divider(color: Colors.grey[800],),)
                const Padding(
                  padding: EdgeInsets.only(left: 25.0),
                  child: ListTile(
                    leading: Icon(Icons.home,color: Colors.white,),
                    title: Text("Home",style: TextStyle(color: Colors.white),),
                  ),
                  ),
                const Padding(
                  padding: EdgeInsets.only(left: 25.0),
                  child: ListTile(
                    leading: Icon(Icons.info,color: Colors.white,),
                    title: Text("About",style: TextStyle(color: Colors.white),),
                  ),
                  ),
                ],
              ),
                const Padding(
                  padding: EdgeInsets.only(left: 25.0),
                  child: ListTile(
                    leading: Icon(Icons.logout,color: Colors.white,),
                    title: Text("Logout",style: TextStyle(color: Colors.white),),
                  ),
                  ),
          ],),
      ),
      bottomNavigationBar: MyBottomNavBar(
        onTabChange: (index)=>navigateBottomBar(index),
      ),
      body: _pages[_selectedIndex],
    );
  }
}