import 'package:flutter/material.dart';

class BasketScreen extends StatelessWidget {
static const String routeName='/basket';

  static Route route(){
    return MaterialPageRoute(
    builder: (_)=>const BasketScreen(),
    settings: const RouteSettings(name: routeName),
    );

  }

  const BasketScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(title: const Text('Basket'),
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