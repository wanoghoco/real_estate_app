import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:real_estate_app/decorations/app_colors.dart';
import 'package:real_estate_app/helpers/const.dart';
import 'package:real_estate_app/src/features/search/widget/app_marker_widget.dart';
import 'package:real_estate_app/src/features/search/widget/search_bottom_navigator_widget.dart';
import 'package:real_estate_app/src/features/search/widget/search_top_widget.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen>
    with AutomaticKeepAliveClientMixin {
  final MapController _mapController = MapController();
  List<LatLng> _markerLocations = [];
  bool noLayer = false;

  final LatLng _targetPosition = LatLng(37.429961, -122.087749);
  void _generateMarkerLocations() {
    _markerLocations = [
      LatLng(_targetPosition.latitude + 0.02, _targetPosition.longitude + 0.02),
      LatLng(_targetPosition.latitude + 0.02, _targetPosition.longitude - 0.02),
      LatLng(_targetPosition.latitude + 0.03, _targetPosition.longitude),
      LatLng(_targetPosition.latitude - 0.03, _targetPosition.longitude),
      LatLng(_targetPosition.latitude, _targetPosition.longitude + 0.03),
    ];
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      body: Stack(
        children: [
          FlutterMap(
            options: MapOptions(
              backgroundColor: AppColors.headerTextColor,
              initialCenter: _targetPosition,
              onMapReady: () {
                _generateMarkerLocations();
                setState(() {});
              },
            ),
            mapController: _mapController,
            children: [
              TileLayer(
                urlTemplate: AppConstant.getMapStyleRoute,
                additionalOptions: {"accessToken": AppConstant.mapBoxApiKey},
              ),

              MarkerLayer(
                markers:
                    _markerLocations.map((location) {
                      return Marker(
                        point: location,
                        width: 78,
                        height: 48,
                        child: AppMarkerWidget(
                          text: "13,9 mn P",
                          noLayer: noLayer,
                        ),
                      );
                    }).toList(),
              ),
            ],
          ),
          Positioned(top: 20, left: 20, right: 20, child: SearchTopWidget()),
          Positioned(
            bottom: 132,
            left: 20,
            right: 20,
            child: SearchBottomNavigatorWidget(
              onMarkerChanged: (val) {
                noLayer = val;
                setState(() {});
              },
            ),
          ),
        ],
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
