import 'package:flutter/material.dart';

double getHeight(BuildContext? context, {double factor = 1.0}) => MediaQuery.of(context!).size.height * factor;

double getWidth(BuildContext? context, {double factor = 1.0}) => MediaQuery.of(context!).size.width * factor;
