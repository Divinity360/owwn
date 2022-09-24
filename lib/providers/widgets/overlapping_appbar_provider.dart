import 'dart:developer';

import 'package:flutter/material.dart';

class OverlappingAppBarProvider extends ChangeNotifier {
  /// Maximum appbar height
  final double _maxAppBarHeight = 480.0;

  /// Minimum appbar height
  final double _minAppbarHeight = 56.0;

  /// Minimum scroll sheet content ratio
  final double _bodyContentRatioMin = .6;

  /// Maximum scroll sheet content ratio
  final double _bodyContentRatioMax = 1.0;

  /// Content ratio parallax
  final double _bodyContentRatioParallax = .9;

  double _appBarHeaderHeight = 480.0;

  /// Check for minimum appbar height
  bool _isMinimumAppBarHeight = false;

  double get maxAppBarHeight => _maxAppBarHeight;

  double get minAppbarHeight => _minAppbarHeight;

  double get bodyContentRatioMin => _bodyContentRatioMin;

  double get bodyContentRatioParallax => _bodyContentRatioParallax;

  double get bodyContentRatioMax => _bodyContentRatioMax;

  bool get isMinimumAppBarHeight => _isMinimumAppBarHeight;

  double get appBarImageHeight => _appBarHeaderHeight;

  set isMinimumAppBarHeight(bool value) {
    _isMinimumAppBarHeight = value;
    notifyListeners();
  }

  /// Calculate appBar header height based on scroll extent value
  bool onScrollEvent(DraggableScrollableNotification notification) {
    isMinimumAppBarHeight = notification.extent == _bodyContentRatioMax;

    if (notification.extent >= _bodyContentRatioMin) {
      _appBarHeaderHeight = (_bodyContentRatioMax -
              ((notification.extent - _bodyContentRatioMin) /
                  (_bodyContentRatioMax - _bodyContentRatioMin))) *
          _maxAppBarHeight;
    }

    notifyListeners();
    return true;
  }
}
