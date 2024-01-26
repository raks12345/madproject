import 'package:flutter/material.dart';
import 'package:foodapp/models/restaurant_model.dart';

class RestaurantTags extends StatelessWidget {
  const RestaurantTags({
    super.key,
    required this.restaurant,
  });

  final Restaurant restaurant;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: restaurant.tags
          .map((tag) => Text(
                '${restaurant.tags.indexOf(tag) == restaurant.tags.length - 1 ? tag : '$tag, '}',
                style: Theme.of(context).textTheme.bodyText1,
              ))
          .toList(),
    );
  }
}
