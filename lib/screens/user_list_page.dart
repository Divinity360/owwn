import 'package:flutter/material.dart';
import 'package:owwn_coding_challenge/models/user.dart';
import 'package:owwn_coding_challenge/utils/colors.dart';
import 'package:owwn_coding_challenge/widgets/cards/user_item_card.dart';
import 'package:owwn_coding_challenge/widgets/listviews/overlapping_appbar_listview.dart';
import 'package:owwn_coding_challenge/widgets/sections/user_list_section.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final _screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: OverlappingAppBarListView(
        viewChild: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10),
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
          width: _screenWidth,
          child: Column(children: const [
            SectionedUserList(isActive: true, userList: []),
            SectionedUserList(isActive: false, userList: []),
          ],) ,
        ),
      ),
    );
  }
}


