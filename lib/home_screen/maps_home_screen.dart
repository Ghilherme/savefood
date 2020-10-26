import 'package:flutter/material.dart';
import 'package:location/location.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:savefood/restaurant_details/restaurant.dart';
import 'package:savefood/apis/locations.dart' as locations;
import 'dart:async';
import '../Constants/constants.dart' as constants;
import '../menu/custom_drawer.dart';

class MapsHomeScreen extends StatefulWidget {
  @override
  _MapsHomeScreenState createState() => _MapsHomeScreenState();
}

const LatLng sourceLocation = LatLng(42.747932, -71.167889);

class _MapsHomeScreenState extends State<MapsHomeScreen> {
  final Completer<GoogleMapController> _controller = Completer();
  // the user's initial location and current location
  // as it moves
  LocationData currentLocation;
  // wrapper around the location API
  Location location;
  final Map<String, Marker> _markers = {};

  @override
  initState() {
    super.initState();
    location = Location();

    location.changeSettings(
        interval: 100000,
        accuracy: LocationAccuracy.BALANCED,
        distanceFilter: 2);
    location.onLocationChanged().listen((LocationData cLoc) {
      // cLoc contains the lat and long of the
      // current user's position in real time,
      // so we're holding on to it
      currentLocation = cLoc;
      updatePinOnMap();
    });
    // set the initial location
    setInitialLocation();
  }

  @override
  Widget build(BuildContext context) {
    var initialCameraPosition =
        CameraPosition(target: sourceLocation, zoom: constants.cameraZoom);
    if (currentLocation != null) {
      initialCameraPosition = CameraPosition(
          target: LatLng(currentLocation.latitude, currentLocation.longitude),
          zoom: constants.cameraZoom);
    }

    return Scaffold(
        drawer: CustomDrawer(),
        appBar: AppBar(
          title: Text(constants.appTitle),
          //backgroundColor: Colors.green[700],
        ),
        body: GoogleMap(
          myLocationEnabled: true,
          onMapCreated: _onMapCreated,
          initialCameraPosition: initialCameraPosition,
          markers: _markers.values.toSet(),
        ));
  }

  _onMapCreated(GoogleMapController controller) async {
    _controller.complete(controller);
    final googleOffices = await locations.getGoogleOffices();

    setState(() {
      _markers.clear();

      for (final office in googleOffices.offices) {
        var marker2 = Marker(
          markerId: MarkerId(office.name),
          onTap: () {
            print('clicou no marcador');
          },
          position: LatLng(office.lat, office.lng),
          infoWindow: InfoWindow(
            onTap: () {
              print('CLICOU no INFOWINDOW');
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => Restaurant(officename: office.name)));
            },
            title: office.name,
            snippet: office.address,
          ),
        );
        final marker = marker2;
        _markers[office.name] = marker;
      }
    });
  }

  void setInitialLocation() async {
    // set the initial location by pulling the user's
    // current location from the location's getLocation()
    currentLocation = await location.getLocation();
  }

  void updatePinOnMap() async {
    // create a new CameraPosition instance
    // every time the location changes, so the camera
    // follows the pin as it moves with an animation
    var cPosition = CameraPosition(
        zoom: constants.cameraZoom,
        target: LatLng(currentLocation.latitude, currentLocation.longitude));
    final controller = await _controller.future;
    await controller.animateCamera(CameraUpdate.newCameraPosition(cPosition));
  }
}
