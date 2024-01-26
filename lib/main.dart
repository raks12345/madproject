import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodapp/blocs/autocomplete/autocomplete_bloc.dart';
import 'package:foodapp/blocs/geolocation/geolocation_bloc.dart';
import 'package:foodapp/config/app_router.dart';
import 'package:foodapp/repositories/geolocation/geolocation_repository.dart';
import 'package:foodapp/repositories/places/places_repository.dart';
import 'package:foodapp/screens/screens.dart';

import 'config/theme.dart';

//import 'package:foodapp/screens/location/location_screen.dart';

//import 'screens/home/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<GeolocationRepository>(
          create: (_) => GeolocationRepository(),
        ),
        RepositoryProvider<PlacesRepository>(
          create: (_) => PlacesRepository(),
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
              create: (context) => GeolocationBloc(
                  geolocationRepository: context.read<GeolocationRepository>())
                ..add(LoadGeolocation())),
          BlocProvider(
              create: (context) => AutocompleteBloc(
                  placesRepository: context.read<PlacesRepository>())
                ..add(const LoadAutocomplete())),
        ],
        child: MaterialApp(
          title: 'Flutter Delivery',
          theme: theme(),
          onGenerateRoute: AppRouter.onGenerateRoute,
          initialRoute: HomeScreen.routeName,
        ),
      ),
    );
  }
}
