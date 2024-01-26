import 'package:flutter/material.dart';

class CheckoutScreen extends StatelessWidget {
static const String routeName='/checkout';

  static Route route(){
    return MaterialPageRoute(
    builder: (_)=>const CheckoutScreen(),
    settings: const RouteSettings(name: routeName),
    );

  }

  const CheckoutScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(title: const Text('Checkout'),
      centerTitle: true,
      backgroundColor: Colors.blue),
      body: Center(
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blue, // Set the button's background color
          ),
          child: const Text('Home Screen',style: TextStyle(
              color: Colors.white, // Set the text color
            ),
            ),onPressed: (){
          Navigator.pushNamed(context, '/');
        },
        ),
      ),
      );
  }
}