
/*import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tradebook/firebaseService.dart';
import 'package:tradebook/providerData.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:location/location.dart';

class LocationService {
  FirebaseService _service = FirebaseService();

  sendLocationToDataBase(context) async {
    Location location = new Location();//by using location packege
    bool _serviceEnabled;//to make sure that location service is enabled in the device
    PermissionStatus _permissionGranted;//if it is not enabled please give permission
    LocationData _locationData;//get location data

    _serviceEnabled = await location.serviceEnabled();//waiting to device to response for the location service
    if (!_serviceEnabled) {// if it is not enabled
      _serviceEnabled = await location.requestService();//request service
      if (!_serviceEnabled) {// if the user did not give permission then go out of the app
        return;//go out
      }
    }

    _permissionGranted = await location.hasPermission();//is the app has permission to access  user's location
    if (_permissionGranted == PermissionStatus.denied) {//if it has not permission
      _permissionGranted = await location.requestPermission();//request permission
      if (_permissionGranted != PermissionStatus.granted) {//if the user did not give permission to access go out
        return;
      }
    }
    //after enabling location service and user's location then get data
    _locationData = await location.getLocation();//waiting to get data then after get location

    DocumentReference ref = _service.db//send two values to data base
        .collection('sections')
        .doc(sectionID(context))
        .collection('subSections')
        .doc(subSectionID(context))
        .collection('activities')
        .doc(activityID(context));
    ref.update(
      {
        'latitude': _locationData.latitude,
        'longitude': _locationData.longitude,
      },
    );
  }

  goToMaps(double latitude, double longitude) async {
    String mapLocationUrl =
        "https://www.google.com/maps/search/?api=1&query=$latitude,$longitude";//to go to the location of place
    final String encodedURl = Uri.encodeFull(mapLocationUrl);//to encrypt the url of the location the location should be encrypted
    if (await canLaunch(encodedURl)) {//if there are no problems then go to maps
      await launch(encodedURl);//go to maps
    } else {
      print('Could not launch $encodedURl');
      throw 'Could not launch $encodedURl';
    }
  }


*/