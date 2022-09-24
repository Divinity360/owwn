import 'package:flutter/material.dart';
import 'package:owwn_coding_challenge/widgets/listviews/overlapping_appbar_listview.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: OverlappingAppBarListView(
          viewChild: Container(
        height: 600,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
            colors: [
              Colors.black,
              Colors.transparent,
            ],
            stops: [.8, 1],
          ),
        ),
        width: MediaQuery.of(context).size.width,
      ),),
      drawer: Drawer(),
    );
  }
}
