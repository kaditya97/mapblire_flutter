import 'package:flutter/material.dart';
import 'package:maplibre_gl/mapbox_gl.dart';

import 'page.dart';

class OpenStreetMapPage extends ExamplePage {
  const OpenStreetMapPage() : super(const Icon(Icons.map), 'Open Street Map');

  @override
  Widget build(BuildContext context) {
    return const OpenStreetMap();
  }
}

class OpenStreetMap extends StatefulWidget {
  const OpenStreetMap({super.key});

  @override
  State createState() => OpenStreetMapState();
}

class OpenStreetMapState extends State<OpenStreetMap> {
  MaplibreMapController? mapController;
  var isLight = true;

  void onMapCreated(MaplibreMapController controller) {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MaplibreMap(
      initialCameraPosition: const CameraPosition(
        target: LatLng(27.5, 85.0),
        zoom: 7.0,
      ),
      onMapCreated: onMapCreated,
      compassEnabled: false,
      // annotationOrder: [],
      myLocationEnabled: false,
      styleString: '''{
                "version": 8,
                "sources": {
                  "OSM": {
                    "type": "raster",
                    "tiles": [
                      "https://a.tile.openstreetmap.org/{z}/{x}/{y}.png",
                      "https://b.tile.openstreetmap.org/{z}/{x}/{y}.png",
                      "https://c.tile.openstreetmap.org/{z}/{x}/{y}.png"
                    ],
                    "tileSize": 256,
                    "attribution": "© OpenStreetMap contributors",
                    "maxzoom": 18
                  }
                },
                "layers": [
                  {
                    "id": "OSM-layer",
                    "source": "OSM",
                    "type": "raster"
                  }
                ]
              }''',
    ));
  }
}
