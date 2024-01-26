import 'package:flutter/material.dart';
import 'package:foodapp/models/models.dart';
import 'package:foodapp/screens/basket/basket_screen.dart';
import 'package:foodapp/screens/checkout/checkout_screen.dart';
import 'package:foodapp/screens/delivery_time/delivery_time_screen.dart';
import 'package:foodapp/screens/filter/filter_screen.dart';
import 'package:foodapp/screens/home/home_screen.dart';
import 'package:foodapp/screens/location/location_screen.dart';
import 'package:foodapp/screens/restaurant_details/restaurant_details_screen.dart';
import 'package:foodapp/screens/restaurant_listing/restaurant_listing_screen.dart';
import 'package:foodapp/screens/voucher/voucher_screen.dart';
import 'package:foodapp/widgets/widgets.dart';

class AppRouter {
  static Route onGenerateRoute(RouteSettings settings) {
    print('The route is: ${settings.name}');
    switch (settings.name) {
      case '/':
        return HomeScreen.route();
      case HomeScreen.routeName:
        return HomeScreen.route();
      case LocationScreen.routeName:
        return LocationScreen.route();
      case BasketScreen.routeName:
        return BasketScreen.route();
      case CheckoutScreen.routeName:
        return CheckoutScreen.route();
      case DeliveryTimeScreen.routeName:
        return DeliveryTimeScreen.route();
      case FilterScreen.routeName:
        return FilterScreen.route();
      case RestaurantListingScreen.routeName:
        return RestaurantListingScreen.route(
            restaurants: settings.arguments as List<Restaurant>);
      case RestaurantDetailsScreen.routeName:
        return RestaurantDetailsScreen.route(
            restaurant: settings.arguments as Restaurant);
      case VoucherScreen.routeName:
        return VoucherScreen.route();
        break;
      default:
        return _errorRoute();
    }
  }

  static Route _errorRoute() {
    return MaterialPageRoute(
      builder: (_) => Scaffold(
        appBar: AppBar(title: const Text('error')),
      ),
      settings: const RouteSettings(name: '/error'),
    );
  }
}
