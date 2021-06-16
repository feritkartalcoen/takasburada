import 'dart:async';

import 'package:flutter/material.dart';
import 'package:takasburada/constants/constants.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class LocationTile extends StatefulWidget {
  final LatLng? location;
  final VoidCallback? onTap;

  LocationTile({
    Key? key,
    this.location,
    this.onTap,
  }) : super(key: key);

  @override
  _LocationTileState createState() => _LocationTileState();
}

class _LocationTileState extends State<LocationTile> {
  bool isPageTransitionAnimationCompleted = false;
  Completer<GoogleMapController> googleMapController = Completer();
  CameraPosition? cameraPosition;
  GoogleMap? googleMap;
  @override
  void initState() {
    super.initState();
    setState(() {
      cameraPosition = CameraPosition(
        target: widget.location!,
        zoom: 18,
      );
      googleMap = GoogleMap(
        onMapCreated: (controller) => googleMapController.complete(controller),
        initialCameraPosition: cameraPosition!,
        scrollGesturesEnabled: false,
        zoomControlsEnabled: false,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    var modalRoute = ModalRoute.of(context);
    void statusListener(AnimationStatus status) {
      if (status == AnimationStatus.completed) {
        setState(() {
          isPageTransitionAnimationCompleted = true;
        });
        modalRoute!.animation!.removeStatusListener(statusListener);
      }
    }

    modalRoute!.animation!.addStatusListener(statusListener);
    return Container(
      height: 200,
      padding: EdgeInsets.symmetric(horizontal: containerPadding),
      child: Material(
        elevation: elevation,
        borderRadius: BorderRadius.circular(24),
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(24),
              child:
                  isPageTransitionAnimationCompleted ? googleMap : SizedBox(),
            ),
            Positioned.fill(
              child: Material(
                borderRadius: BorderRadius.circular(24),
                child: InkWell(
                  borderRadius: BorderRadius.circular(24),
                  onTap: widget.onTap,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
