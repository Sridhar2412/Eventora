import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mapbox_maps_flutter/mapbox_maps_flutter.dart';

@RoutePage()
class ViewOnMapPage extends StatefulWidget {
  const ViewOnMapPage({super.key});

  @override
  State<ViewOnMapPage> createState() => _ViewOnMapPageState();
}

class _ViewOnMapPageState extends State<ViewOnMapPage> {
  MapboxMap? _mapboxMap;
  PointAnnotationManager? pointAnnotationManager;

  // List of coordinates where markers will be placed
  late List<Position> positions;
  @override
  void initState() {
    super.initState();
  }

  _onMapCreated(MapboxMap mapboxMap) async {
    _mapboxMap = mapboxMap;
    pointAnnotationManager =
        await mapboxMap.annotations.createPointAnnotationManager();
    await addMarker();
  }

  Future<void> addMarker() async {
    // Load the image from assets
    final ByteData bytes =
        await rootBundle.load('assets/images/custom-icon.png');
    final Uint8List imageData = bytes.buffer.asUint8List();
    positions = [
      Position(72.867943, 19.114303),
      Position(72.867943, 19.114420),
      Position(72.867943, 19.114503),
    ];
    // Create a PointAnnotationOptions
    for (var i = 0; i < positions.length; i++) {
      PointAnnotationOptions pointAnnotationOptions = PointAnnotationOptions(
          geometry: Point(coordinates: positions[i]), // Example coordinates
          image: imageData,
          iconSize: 0.5);

      // Add the annotation to the map
      pointAnnotationManager?.create(pointAnnotationOptions);
      setState(() {});
    }
  }

  // Optional: Function to zoom in
  Future<void> _zoomIn() async {
    if (_mapboxMap == null) return;
    final currentZoom =
        await _mapboxMap!.getCameraState().then((state) => state.zoom);
    await _mapboxMap!.setCamera(CameraOptions(zoom: currentZoom + 1));
  }

  // Optional: Function to zoom out
  Future<void> _zoomOut() async {
    if (_mapboxMap == null) return;
    final currentZoom =
        await _mapboxMap!.getCameraState().then((state) => state.zoom);
    await _mapboxMap!.setCamera(CameraOptions(zoom: currentZoom - 1));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mapbox Demo'),
      ),
      body: Stack(
        children: [
          // Map widget
          MapWidget(
            key: const ValueKey('mapWidget'),
            onMapCreated: _onMapCreated,
            cameraOptions: CameraOptions(
              center: Point(
                  coordinates: Position(
                      72.867943, 19.114424)), // Central coordinates for the map
              zoom:
                  12.0, // Adjust this zoom level to make sure the markers are visible
              bearing: 0.0,
              pitch: 0.0,
            ),
            styleUri: MapboxStyles.STANDARD, // Mapbox standard style
          ),
          // Zoom controls
          Positioned(
            bottom: 20,
            right: 20,
            child: Column(
              children: [
                FloatingActionButton(
                  onPressed: _zoomIn,
                  mini: true,
                  child: const Icon(Icons.add),
                ),
                const SizedBox(height: 10),
                FloatingActionButton(
                  onPressed: _zoomOut,
                  mini: true,
                  child: const Icon(Icons.remove),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
