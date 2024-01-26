import 'package:flutter/material.dart';
import 'package:foodapp/models/restaurant_model.dart';
import 'package:foodapp/widgets/restaurant_tags.dart';

class RestaurantInformation extends StatelessWidget {
  final Restaurant restaurant;
  const RestaurantInformation({required this.restaurant, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(
          restaurant.name,
          style: Theme.of(context).textTheme.headline3!.copyWith(
                color: Theme.of(context).primaryColor,
              ),
        ),
        SizedBox(height: 10),
        RestaurantTags(restaurant: restaurant),
        SizedBox(height: 5),
        Text(
          '${restaurant.distance}km away - \$${restaurant.deliveryFee}delivery fee',
          style: Theme.of(context).textTheme.bodyText1,
        ),
        SizedBox(height: 10),
        Text(
          'Restaurant Information',
          style: Theme.of(context).textTheme.headline5,
        ),
        SizedBox(height: 5),
        Text(
          'Lorem ipsum Excepteur ad dolor commodo aute ea commodo. Exercitation ipsum irure adipisicing quis eiusmo.',
          style: Theme.of(context).textTheme.bodyText1,
        ),
      ]),
    );
  }
}
