import 'dart:async';

import 'file:///D:/Desktop/flutterProjects/about_australia/lib/components/google_maps/background_container.dart';
import 'file:///D:/Desktop/flutterProjects/about_australia/lib/components/google_maps/top_place_box.dart';
import 'package:about_australia/views/list_map.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapPage extends StatefulWidget {
  @override
  MapPageState createState() => MapPageState();
}

class MapPageState extends State<MapPage> {
  Completer<GoogleMapController> _controller = Completer();
  BitmapDescriptor customIcon;

  Future<void> _createMarkerImageFromAsset(BuildContext context) async {
    if (customIcon == null) {
      final ImageConfiguration imageConfiguration =
          createLocalImageConfiguration(context, size: Size.square(48));
      BitmapDescriptor.fromAssetImage(imageConfiguration, 'assets/fd.png')
          .then(_updateBitmap);
    }
  }

  void _updateBitmap(BitmapDescriptor bitmap) {
    setState(() {
      customIcon = bitmap;
    });
  }

  Set<Marker> createMarkersList() {
    return <Marker>[
      Marker(
          markerId: MarkerId('operaHouse'),
          position: LatLng(-33.85651709284762, 151.21539325698433),
          infoWindow: InfoWindow(
            title: "دار أوبرا سيدني",
          ),
          icon: customIcon),
      Marker(
          markerId: MarkerId('operaHouse'),
          position: LatLng(-33.85651709284762, 151.21539325698433),
          infoWindow: InfoWindow(
            title: "دار أوبرا سيدني",
          ),
          icon: customIcon)
    ].toSet();
  }

  double zoomVal = 5.0;
  @override
  Widget build(BuildContext context) {
    _createMarkerImageFromAsset(context);
    return Expanded(
      child: Stack(
        children: <Widget>[
          _buildGoogleMap(context),
          _zoomminusfunction(),
          _zoomplusfunction(),
          buildBottomContainer(),
        ],
      ),
    );
  }

  Widget _zoomminusfunction() {
    return Align(
      alignment: Alignment.topLeft,
      child: IconButton(
          icon: Icon(Icons.zoom_out, color: Color(0xff6200ee)),
          onPressed: () {
            zoomVal = zoomVal - 0.25;
            changeZoomValue(zoomVal);
          }),
    );
  }

  Widget _zoomplusfunction() {
    return Align(
      alignment: Alignment.topRight,
      child: IconButton(
          icon: Icon(Icons.zoom_in, color: Color(0xff6200ee)),
          onPressed: () {
            zoomVal = zoomVal + 0.5;
            changeZoomValue(zoomVal);
          }),
    );
  }

  Future<void> changeZoomValue(double zoomVal) async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
        target: LatLng(-24.975122649942392, 133.76997152163685),
        zoom: zoomVal)));
  }

  Widget buildBottomContainer() {
    return Align(
      alignment: Alignment.bottomLeft,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 20.0),
        height: 250.0,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TopPlaceBox(
                image:
                    "https://ak-d.tripcdn.com/images/10060n000000e4c6nEB47.jpg?proc=source%2Ftrip",
                lat: -33.85657946005523,
                long: 151.21523232445094,
                locationName: "دار أوبرا سيدني",
                gotoLocation: _gotoLocation,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TopPlaceBox(
                image:
                    "https://ak-d.tripcdn.com/images/10060n000000e4c6nEB47.jpg?proc=source%2Ftrip",
                lat: -33.85657946005523,
                long: 151.21523232445094,
                locationName: "دار أوبرا سيدني",
                gotoLocation: _gotoLocation,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildGoogleMap(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: GoogleMap(
          mapType: MapType.terrain,
          initialCameraPosition: CameraPosition(
              target: LatLng(-31.399615408245108, 133.37446372756241),
              zoom: 3.8),
          onMapCreated: (GoogleMapController controller) {
            _controller.complete(controller);
          },
          markers: createMarkersList()),
    );
  }

  Future<void> _gotoLocation(double lat, double long) async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
      target: LatLng(lat, long),
      zoom: 15,
      tilt: 50.0,
      bearing: 45.0,
    )));
  }
}
