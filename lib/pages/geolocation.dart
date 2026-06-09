import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class LocationScreen extends StatefulWidget {
  const LocationScreen ({super.key});

  @override
  State<StatefulWidget> createState() => _LocationScreenState();

}

class _LocationScreenState extends State<LocationScreen> {
  String myPosition = '';

  @override
  void initState() {
    super.initState();
    getPosition().then((Position myPos) {
      myPosition = 
          'Latitude: ${myPos.latitude.toString()} - Longitude: ${myPos.longitude.toString()}';
      setState(() {
        myPosition = myPosition;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final isLoading = myPosition == '' 
      ? const CircularProgressIndicator()
      : Text(myPosition);

    return Scaffold(
      appBar: AppBar(
        title: const Text('411221221')
      ),
      body: Center(
        child: isLoading,
      )
    );
  }



  Future<Position> getPosition() async {
    await Geolocator.requestPermission();
    await Geolocator.isLocationServiceEnabled();
    Position? position = await Geolocator.getCurrentPosition();
    return position;
  }

}