import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:owwn_coding_challenge/providers/widgets/overlapping_appbar_provider.dart';
import 'package:owwn_coding_challenge/utils/router.dart';
import 'package:provider/provider.dart';

/// Custom overlapping appbar with child listview
class OverlappingAppBarListView extends StatelessWidget {
  const OverlappingAppBarListView({
    Key? key,
    required this.viewChild,
  }) : super(key: key);

  final Widget viewChild;

  @override
  Widget build(BuildContext context) {
    final _screenWidth = MediaQuery.of(context).size.width;
    return ChangeNotifierProvider<OverlappingAppBarProvider>(
      create: (context) => OverlappingAppBarProvider(),
      child: Consumer<OverlappingAppBarProvider>(
        builder: (context, provider, child) {
          return Stack(
            children: <Widget>[
              Stack(children: [
                Image.network(
                  'http://s3.amazonaws.com/dmaunited/news/19AW_ECOM_MF_SP_Select_KarlLagerfeld_ComingSoonHero_Desktop_1440x500_2-A.jpg?mtime=20191009173305',
                  height: provider.appBarImageHeight,
                  width: _screenWidth,
                  fit: BoxFit.cover,
                ),
                NotificationListener<DraggableScrollableNotification>(
                  onNotification: provider.onScrollEvent,
                  child: Stack(
                    children: <Widget>[
                      DraggableScrollableSheet(
                        initialChildSize: provider.bodyContentRatioMin,
                        minChildSize: provider.bodyContentRatioMin,
                        maxChildSize: provider.bodyContentRatioMax,
                        builder: (BuildContext context,
                            ScrollController scrollController) {
                          return SingleChildScrollView(
                            controller: scrollController,
                            child: viewChild,
                          );
                        },
                      ),
                    ],
                  ),
                )
              ]),
              Positioned(
                left: 0.0,
                right: 0.0,
                top: 0.0,
                child: AppBar(
                  backgroundColor: provider.isMinimumAppBarHeight
                      ? Colors.black
                      : Colors.transparent,
                  title: Text(provider.isMinimumAppBarHeight ? "Notes" : ""),
                  elevation: 0.0,
                  leading: InkWell(
                    child: const SizedBox(),
                    onTap: () => context.pop(),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
