import 'package:flutter/material.dart';

bool isSmallScreen(BuildContext context) =>
    MediaQuery.of(context).size.width < BreakPoint.small;

bool isMediumScreen(BuildContext context) =>
    MediaQuery.of(context).size.width >= BreakPoint.small &&
    MediaQuery.of(context).size.width < BreakPoint.medium;

bool isLargeScreen(BuildContext context) =>
    MediaQuery.of(context).size.width >= BreakPoint.medium &&
    MediaQuery.of(context).size.width < BreakPoint.large;

bool isDesktopScreen(BuildContext context) =>
    MediaQuery.of(context).size.width >= BreakPoint.large;

int getNumberOfColumns(BuildContext context) {
  if (isDesktopScreen(context)) {
    return 2;
  } else if (isLargeScreen(context)) {
    return 2;
  } else if (isMediumScreen(context)) {
    return 2;
  } else {
    return 2;
  }
}

double getSizeBasedOnScreenSize(BuildContext context, double small,
    double medium, double large, double desktop) {
  if (isDesktopScreen(context)) {
    return desktop;
  } else if (isLargeScreen(context)) {
    return large;
  } else if (isMediumScreen(context)) {
    return medium;
  } else {
    return small;
  }
}

abstract class BreakPoint {
  static const double small = 600;

  static const double medium = 900;

  static const double large = 1200;

  static const double desktop = 1200;
}
