import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:foodapp/blocs/autocomplete/autocomplete_bloc.dart';
import 'package:foodapp/blocs/geolocation/geolocation_bloc.dart';
import 'package:foodapp/widgets/location_search_box.dart';
//import 'package:flutter_svg/svg.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class LocationScreen extends StatelessWidget {
  static const String routeName = '/location';

  static Route route() {
    return MaterialPageRoute(
      builder: (_) => const LocationScreen(),
      settings: const RouteSettings(name: routeName),
    );
  }

  const LocationScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
              height: MediaQuery.of(context).size.height,
              width: double.infinity,
              child: const gmap()),
          Positioned(
              top: 40,
              left: 20,
              right: 20,
              child: SizedBox(
                height: 100,
                child: Row(
                  children: [
                    SvgPicture.asset(
                      'assets/logo.svg',
                      height: 50,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                        child: Column(
                      children: [
                        const LocationSearchBox(),
                        BlocBuilder<AutocompleteBloc, AutocompleteState>(
                          builder: (context, state) {
                            if (state is AutocompleteLoading) {
                              return const Center(
                                child: CircularProgressIndicator(),
                              );
                            } else if (state is AutocompleteLoaded) {
                              return Container(
                                  margin: const EdgeInsets.all(8),
                                  height: 300,
                                  color: state.autocomplete.isNotEmpty
                                      ? Colors.black.withOpacity(0.6)
                                      : Colors.transparent,
                                  child: ListView.builder(
                                      itemCount: state.autocomplete.length,
                                      itemBuilder: (context, index) {
                                        return ListTile(
                                          title: Text(
                                              state.autocomplete[index]
                                                  .description,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .titleLarge!
                                                  .copyWith(
                                                      color: Colors.white)),
                                        );
                                      }));
                            } else {
                              return const Text('something went wrong!');
                            }
                          },
                        )
                      ],
                    )),
                  ],
                ),
              )),
          Positioned(
              bottom: 50,
              left: 20,
              right: 20,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 70.0),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Theme.of(context).primaryColor),
                  child: const Text(
                    ('Save'),
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () {},
                ),
              ))
        ],
      ),
    );
  }
}

//gmap is extracted to gmap.dart file
class gmap extends StatelessWidget {
  const gmap({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GeolocationBloc, GeolocationState>(
      builder: (context, state) {
        if (state is GeolocationLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is GeolocationLoaded) {
          return const GoogleMap(
            myLocationButtonEnabled: true,
            initialCameraPosition: CameraPosition(
                target: LatLng(
                  10, //sate.position.latitude
                  10, //state.position.longitude to get current position in blue circle
                ),
                zoom: 10),
          );
        } else {
          return const Text('something went wrong');
        }
      },
    );
  }
}
