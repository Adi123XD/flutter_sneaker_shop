import 'package:flutter/material.dart';
import 'package:sneaker_shop/pages/home_page.dart';
class IntroPage extends StatefulWidget {
  const IntroPage({super.key});

  @override
  State<IntroPage> createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // logo
              Padding(
                padding: const EdgeInsets.all(25.0),
                child: Image.asset("lib/images/nike.png",
                height: 240,width: 240,
                ),
              ),
              // text
              const Text("Just Do It",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 24,),
              // sub title
              const Text("Brand new sneakers and custom kicks with premium quality",
              style: TextStyle(fontSize: 16,color: Colors.grey),
              textAlign: TextAlign.center,
              ),
              const SizedBox(height: 48,),
              // start button
              GestureDetector(
                onTap: ()=>Navigator.push(
                  context,MaterialPageRoute(builder: (context)=>HomePage())
                ),
                child: Container(
                  decoration: BoxDecoration(color: Colors.grey[900],
                  borderRadius: BorderRadius.circular(12)),
                  padding: const EdgeInsets.all(25),
                  child: const Center(
                    child: Text("Shop Now",
                    style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white,fontSize: 16),),
                  )
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}