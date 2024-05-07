import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:geolocator/geolocator.dart';

void main() {
  runApp(MapsPage());
}

class MapsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Map Example',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MapScreen(),
    );
  }
}

class MapScreen extends StatefulWidget {
  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  LatLng _center = const LatLng(-6.3664739, 106.8507823);
  double _zoom = 18.0;

  @override
  void initState() {
    super.initState();
    _getCurrentLocation();
  }

  Future<void> _getCurrentLocation() async {
    try {
      // Request permission to access the device's location
      LocationPermission permission = await Geolocator.requestPermission();

      if (permission == LocationPermission.denied) {
        // Handle if permission is denied
        print('Location permission denied');
        return;
      }

      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );
      setState(() {
        _center = LatLng(position.latitude, position.longitude);
      });
    } catch (e) {
      print("Error getting location: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return FlutterMap(
      options: MapOptions(
        initialCenter: const LatLng(-6.3664739, 106.8507823),
        initialZoom: _zoom,
      ),
      children: [
        openStreetMapTileLayer,
        const CircleLayer(
          circles: [
            CircleMarker(
              point: LatLng(-6.3664739, 106.8507823),
              radius: 20,
              borderStrokeWidth: 1,
              borderColor: Color.fromRGBO(0, 0, 0, 1),
              useRadiusInMeter: true,
              color: Color.fromRGBO(98, 239, 94, 0.655),
            ),
          ],
        ),
        MarkerLayer(
          markers: [
            Marker(
              point: LatLng(
                  -6.3664739, 106.8507823), // Using user's current location
              width: 80,
              height: 80,
              child:
                  const Icon(Icons.location_on_outlined), // Use a location icon
            ),
          ],
        ),
      ],
    );
  }
}

TileLayer get openStreetMapTileLayer => TileLayer(
      urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
      userAgentPackageName: 'dev.fleaflet.flutter_map.example',
    );
