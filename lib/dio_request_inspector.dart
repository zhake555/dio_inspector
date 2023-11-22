library dio_request_inspector;

import 'package:dio_request_inspector/common/injection.dart' as di;
import 'package:dio_request_inspector/common/interceptor.dart';
import 'package:dio_request_inspector/presentation/dashboard/page/dashboard_page.dart';
import 'package:flutter/material.dart';

class DioRequestInspector {
  GlobalKey<NavigatorState>? navigatorKey;

  GlobalKey<NavigatorState> get getNavigatorKey => navigatorKey!;

  final bool isDebugMode;
  final bool showFloating;
  final Duration? duration;

  DioRequestInspector({
    required this.isDebugMode,
    this.duration = const Duration(milliseconds: 500),
    this.showFloating = true,
  }) {
    navigatorKey = GlobalKey<NavigatorState>();
    di.init();
  }

  void navigateToDetail() {
    if (!isDebugMode) {
      return;
    }

    Navigator.push<void>(
      navigatorKey!.currentState!.context,
      MaterialPageRoute(
        builder: (context) => const DashboardPage(),
      ),
    );
  }

  Interceptor getDioRequestInterceptor() {
    return Interceptor(
        kIsDebug: isDebugMode,
        navigatorKey: navigatorKey,
        duration: duration,
        showFloating: showFloating,
        navigateToDetail: navigateToDetail);
  }
}
