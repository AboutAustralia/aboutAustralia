import 'dart:async';
import 'dart:typed_data';
import 'dart:ui';

import 'package:about_australia/components/about_australia_card.dart';
import 'package:about_australia/components/card_model.dart';
import 'package:about_australia/data.dart';
import '../components/google_maps/background_container.dart';
import '../components/google_maps/top_place_box.dart';
import 'package:about_australia/views/list_map.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class MapPage extends StatefulWidget {
  @override
  MapPageState createState() => MapPageState();
}

class MapPageState extends State<MapPage> {
  final ItemScrollController itemScrollController = ItemScrollController();

  Completer<GoogleMapController> _controller = Completer();
  BitmapDescriptor customIcon;

  Future<void> _createMarkerImageFromAsset(BuildContext context) async {
    if (customIcon == null) {
      final ImageConfiguration imageConfiguration =
          createLocalImageConfiguration(context, size: Size.square(48));
      BitmapDescriptor.fromAssetImage(
              imageConfiguration, 'assets/images/loc.png')
          .then(_updateBitmap);
    }
  }

  static Future<Uint8List> getBytesFromAsset(String path, int width) async {
    ByteData data = await rootBundle.load(path);
    Codec codec = await instantiateImageCodec(data.buffer.asUint8List(),
        targetWidth: width);
    FrameInfo fi = await codec.getNextFrame();
    return (await fi.image.toByteData(format: ImageByteFormat.png))
        .buffer
        .asUint8List();
  }

  @override
  void initState() {
    getBytesFromAsset('assets/images/loca.png', 115).then((onValue) {
      customIcon = BitmapDescriptor.fromBytes(onValue);
    });
    super.initState();
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
          onTap: () {
            itemScrollController.jumpTo(
              index: 0,
            );
          },
          icon: customIcon),
      Marker(
          markerId: MarkerId('operfafaHouse'),
          position: LatLng(-18.2871, 147.6992),
          onTap: () {
            itemScrollController.scrollTo(
                index: 1,
                duration: Duration(seconds: 1),
                curve: Curves.easeInOutCubic);
          },
          icon: customIcon),
      Marker(
        markerId: MarkerId('faf1'),
        position: LatLng(-25.3438, 131.0347),
        onTap: () {
          itemScrollController.scrollTo(
              index: 2,
              duration: Duration(seconds: 1),
              curve: Curves.easeInOutCubic);
        },
      ),
      Marker(
        markerId: MarkerId('3'),
        position: LatLng(-33.8523, 151.2108),
        onTap: () {
          itemScrollController.scrollTo(
              index: 3,
              duration: Duration(seconds: 1),
              curve: Curves.easeInOutCubic);
        },
      ),
      Marker(
        markerId: MarkerId('4'),
        position: LatLng(-33.6176, 150.4559),
        onTap: () {
          itemScrollController.scrollTo(
              index: 4,
              duration: Duration(seconds: 1),
              curve: Curves.easeInOutCubic);
        },
      ),
      Marker(
        markerId: MarkerId('5'),
        position: LatLng(-37.8136, 144.9631),
        onTap: () {
          itemScrollController.scrollTo(
              index: 5,
              duration: Duration(seconds: 1),
              curve: Curves.easeInOutCubic);
        },
      ),
      Marker(
        markerId: MarkerId('6'),
        position: LatLng(-33.8915, 151.2767),
        onTap: () {
          itemScrollController.scrollTo(
              index: 6,
              duration: Duration(seconds: 1),
              curve: Curves.easeInOutCubic);
        },
      ),
      Marker(
        markerId: MarkerId('7'),
        position: LatLng(-16.3014, 145.2480),
        onTap: () {
          itemScrollController.scrollTo(
              index: 7,
              duration: Duration(seconds: 1),
              curve: Curves.easeInOutCubic);
        },
      ),
      Marker(
        markerId: MarkerId('8'),
        position: LatLng(-25.2398, 153.1325),
        onTap: () {
          itemScrollController.scrollTo(
              index: 8,
              duration: Duration(seconds: 1),
              curve: Curves.easeInOutCubic);
        },
      ),
      Marker(
        markerId: MarkerId('9'),
        position: LatLng(-13.0923, 132.3938),
        onTap: () {
          itemScrollController.scrollTo(
              index: 9,
              duration: Duration(seconds: 1),
              curve: Curves.easeInOutCubic);
        },
      ),
    ].toSet();
  }

  double zoomVal = 5.0;
  @override
  Widget build(BuildContext context) {
    // _createMarkerImageFromAsset(context);
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
          icon: Icon(Icons.zoom_out, color: Colors.red),
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
          icon: Icon(Icons.zoom_in, color: Colors.red),
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
        height: 200.0,
        child: ScrollablePositionedList.builder(
          itemCount: mapsCardsInformation.length,
          itemBuilder: (context, index) {
            return AboutAustraliaCard(
              cardInformationModel: mapsCardsInformation[index],
            );
          },
          scrollDirection: Axis.horizontal,
          itemScrollController: itemScrollController,
        ),
        // child: ListView(
        //   scrollDirection: Axis.horizontal,
        //   children: <Widget>[
        //     AboutAustraliaCard(
        //       imageUrl:
        //           "https://ak-d.tripcdn.com/images/10060n000000e4c6nEB47.jpg?proc=source%2Ftrip",
        //       title: "دار أوبرا سيدني",
        //     ),
        //     // Padding(
        //     //   padding: const EdgeInsets.all(8.0),
        //     //   child: TopPlaceBox(
        //     //     image:
        //     //         "https://ak-d.tripcdn.com/images/10060n000000e4c6nEB47.jpg?proc=source%2Ftrip",
        //     //     lat: -33.85657946005523,
        //     //     long: 151.21523232445094,
        //     //     locationName: "دار أوبرا سيدني",
        //     //     gotoLocation: _gotoLocation,
        //     //   ),
        //     // ),
        //
        //   ],
        // ),
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
