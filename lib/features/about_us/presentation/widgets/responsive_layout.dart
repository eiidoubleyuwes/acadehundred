import 'package:flutter/material.dart';

class ResponsiveLayout extends StatelessWidget {
  final Widget mobile;
  final Widget? tablet;
  final Widget desktop;

  const ResponsiveLayout({
    super.key,
    required this.mobile,
    this.tablet,
    required this.desktop,
  });

  /// Returns true if the screen width is considered mobile.
  static bool isMobile(BuildContext context) =>
      MediaQuery.sizeOf(context).width < 850;

  /// Returns true if the screen width is considered tablet.
  static bool isTablet(BuildContext context) =>
      MediaQuery.sizeOf(context).width >= 850 &&
          MediaQuery.sizeOf(context).width < 1200;

  /// Returns true if the screen width is considered desktop.
  static bool isDesktop(BuildContext context) =>
      MediaQuery.sizeOf(context).width >= 1200;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth >= 1200) {
          return desktop;
        } else if (constraints.maxWidth >= 850) {
          return tablet ?? mobile;
        } else {
          return mobile;
        }
      },
    );
  }
}