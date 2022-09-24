import 'package:flutter/material.dart';
import 'package:owwn_coding_challenge/providers/pages/user_list_page_provider.dart';
import 'package:owwn_coding_challenge/widgets/backgrounds/linear_gradient_background.dart';
import 'package:owwn_coding_challenge/widgets/listviews/overlapping_appbar_listview.dart';
import 'package:owwn_coding_challenge/widgets/loader/app_loader.dart';
import 'package:owwn_coding_challenge/widgets/sections/user_list_section.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final _userListPageProvider =
          Provider.of<UserListPageProvider>(context, listen: false);
      _userListPageProvider.init();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: OverlappingAppBarListView(
        viewChild: LinearGradientBackground(
          child: Consumer<UserListPageProvider>(
            builder: (context, provider, child) {
              return Column(
                children: [
                  if (provider.loading == true &&
                      provider.nestedUsersList.isEmpty)
                    const Padding(
                      padding: EdgeInsets.all(100),
                      child: AppLoader(),
                    )
                  else
                    ListView.builder(
                      itemCount: provider.nestedUsersList.length,
                      shrinkWrap: true,
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return SectionedUserList(
                          userList: provider.nestedUsersList.elementAt(index),
                        );
                      },
                    )
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
