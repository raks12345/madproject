import 'package:flutter/material.dart';

class FilterScreen extends StatelessWidget {
static const String routeName='/filter';

  static Route route(){
    return MaterialPageRoute(
    builder: (_)=>const FilterScreen(),
    settings: const RouteSettings(name: routeName),
    );

  }

  const FilterScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(title: const Text('Filter'),
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