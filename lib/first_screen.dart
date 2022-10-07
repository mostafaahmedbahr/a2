import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:geocoding/geocoding.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({Key? key}) : super(key: key);

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  // Future getData()async
  // {
  //   print("start");
  // await  Future.delayed(const Duration(seconds: 5),()
  //   {
  //     print("mostafa");
  //   });
  // print("end");
  // }
  Future getMyLocation()async
  {
    bool services;
    LocationPermission locationPermission;
    services = await Geolocator.isLocationServiceEnabled();
    print(services);
    if(services == false)
    {
      Fluttertoast.showToast(
          msg: "services not enabled",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0
      );
    }
    if(services == true)
    {
      Fluttertoast.showToast(
          msg: "services enabled",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.green,
          textColor: Colors.white,
          fontSize: 16.0
      );
    }

    locationPermission =await Geolocator.checkPermission();
    print("*********");
    print(locationPermission);
    if(locationPermission == LocationPermission.denied)
    {
      locationPermission = await Geolocator.requestPermission();
    }
    if(locationPermission == LocationPermission.whileInUse)
    {
      getLatAndLong();
      print("while in use");
    }
    if(locationPermission == LocationPermission.always)
    {
      getLatAndLong();
      print("always");
    }
  }
Position? cl;
  Future<Position?> getLatAndLong()async
  {
      cl =  await Geolocator.getCurrentPosition().then((value) => value);
    print(cl);
    return cl;

  }

  @override
  void initState() {
    getMyLocation();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Geolocation"),
      ),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: ()async{
                print(cl!.latitude);
                print("**********");
              await  getLatAndLong();
              },
              child: const Text("get Location"),
            ),
            ElevatedButton(
              onPressed: ()async{
                List<Location> locations =
                await locationFromAddress("cairo");
                print(locations[0]);
                print("------------");
              },
              child: const Text("get Location from name"),
            ),
            ElevatedButton(
              onPressed: ()async{
                List<Placemark> placemarks =
                await placemarkFromCoordinates(cl!.latitude, cl!.longitude);
                print(placemarks[0].administrativeArea);
              },
              child: const Text("get Location from lat and long"),
            ),
            ElevatedButton(
              onPressed: ()async{
                 var d = Geolocator.distanceBetween(
                     cl!.latitude, cl!.longitude,
                   30.784451, 30.997881,
                 );
                 print(d/1000);
              },
              child: const Text("get distance between two places"),
            ),
            ElevatedButton(
              onPressed: ()async{

              },
              child: const Text("open map"),
            ),
            Container(
              height: 200,
              width: double.infinity,
            ),
          ],
        ),
      ),
    );
  }
}
