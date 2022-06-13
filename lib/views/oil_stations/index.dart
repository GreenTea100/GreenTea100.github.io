import 'package:flutter/material.dart';

class OilStationView extends StatefulWidget {
  const OilStationView({Key? key}) : super(key: key);

  @override
  State<OilStationView> createState() => _OilStationsViewState();
}

class _OilStationsViewState extends State<OilStationView> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("주유소 찾기"),
    );
  }
}