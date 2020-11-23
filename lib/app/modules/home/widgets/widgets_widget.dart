import 'package:flutter/material.dart';
import 'package:map_launcher/map_launcher.dart';

class LaunchMap {
  openMapsSheet(context, lat, lng, title) async {
    try {
      final coords = Coords(lat, lng);
      final availableMaps = await MapLauncher.installedMaps;

      print(availableMaps);
      await availableMaps.first.showMarker(
        coords: coords,
        title: title,
        
      );

      // showModalBottomSheet(
      //   context: context,
      //   builder: (BuildContext context) {
      //     return SafeArea(
      //       child: SingleChildScrollView(
      //         child: Container(
      //           child: Wrap(
      //             children: <Widget>[
      //               for (var map in availableMaps)
      //                 ListTile(
      //                   onTap: () => map.showMarker(
      //                     coords: coords,
      //                     title: title,
      //                   ),
      //                   title: Text(map.mapName),
      //                   leading: Image(
      //                     image: map.icon,
      //                     height: 30.0,
      //                     width: 30.0,
      //                   ),
      //                 ),
      //             ],
      //           ),
      //         ),
      //       ),
      //     );
      //   },
      // );
    } catch (e) {
      print(e);
    }
  }
}
