import 'package:flutter/material.dart';
import 'package:owwn_coding_challenge/providers/pages/user_list_page_provider.dart';
import 'package:owwn_coding_challenge/widgets/listviews/overlapping_appbar_listview.dart';
import 'package:owwn_coding_challenge/widgets/loader/app_loader.dart';
import 'package:owwn_coding_challenge/widgets/sections/user_list_section.dart';
import 'package:provider/provider.dart';

class UserListPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _UserListPageState();
}

class _UserListPageState extends State<UserListPage> {
  @override
  Widget build(BuildContext context) {
    return Consumer<UserListPageProvider>(
      builder: (context, provider, child) {
        return Scaffold(
          body: Stack(
            children: [
              OverlappingAppBarListView(
                viewChild: Column(
                  children: [
                    ListView.builder(
                      itemCount: provider.nestedUsersList.length,
                      shrinkWrap: true,
                      padding: const EdgeInsets.only(bottom: 110),
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return SectionedUserList(
                          index: index,
                          userList: provider.nestedUsersList.elementAt(index),
                        );
                      },
                    ),
                  ],
                ),
              ),
              if (provider.loading == true)
                Positioned.fill(
                    bottom: 50,
                    child: Align(
                      alignment: provider.nestedUsersList.isEmpty
                          ? Alignment.center
                          : Alignment.bottomCenter,
                      child: const AppLoader(),
                    ))
            ],
          ),
        );
      },
    );
  }

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<UserListPageProvider>(context, listen: false).init();
    });
    super.initState();
  }
}
