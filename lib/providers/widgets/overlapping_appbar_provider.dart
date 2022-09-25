import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:owwn_coding_challenge/providers/pages/user_list_page_provider.dart';
import 'package:owwn_coding_challenge/utils/router.dart';
import 'package:provider/provider.dart';

class OverlappingAppBarProvider extends ChangeNotifier {
  /// Maximum appbar height
  final double _maxAppBarHeight = 480.0;

  /// Minimum appbar height
  final double _minAppbarHeight = 56.0;

  /// Minimum scroll sheet content ratio
  final double _bodyContentRatioMin = .67;

  /// Maximum scroll sheet content ratio
  final double _bodyContentRatioMax = 1.0;

  /// Content ratio parallax
  final double _bodyContentRatioParallax = .9;

  /// Check for minimum appbar height
  bool _isMinimumAppBarHeight = false;

  final _userListProvider = Provider.of<UserListPageProvider>(
    navigatorKey.currentContext!,
    listen: false,
  );

  double get maxAppBarHeight => _maxAppBarHeight;

  double get minAppbarHeight => _minAppbarHeight;

  double get bodyContentRatioMin => _bodyContentRatioMin;

  double get bodyContentRatioParallax => _bodyContentRatioParallax;

  double get bodyContentRatioMax => _bodyContentRatioMax;

  bool get isMinimumAppBarHeight => _isMinimumAppBarHeight;


  set isMinimumAppBarHeight(bool value) {
    _isMinimumAppBarHeight = value;
    notifyListeners();
  }

  /// Calculate appBar header height based on scroll extent value
  bool onScrollEvent(ScrollNotification notification) {
     isMinimumAppBarHeight = notification.metrics.extentBefore != 0;

    if (notification.metrics.pixels == notification.metrics.maxScrollExtent && !_userListProvider.loading) {
       _userListProvider.fetchUsersList();
    }
    log('==================================== ${notification.metrics.toString()} ${notification.metrics.extentAfter} ${notification.metrics.extentBefore} ${notification.metrics.extentInside} ${notification.metrics.maxScrollExtent} ${notification.metrics.minScrollExtent} ${notification.metrics.atEdge} ${notification.metrics.hasPixels} ${notification.metrics.hasViewportDimension} ${notification.metrics.axis} ${notification.metrics.axisDirection} ${notification.metrics.hasContentDimensions} ${notification.metrics.outOfRange} ${notification.metrics.pixels}');
    notifyListeners();
    return true;
  }
}
