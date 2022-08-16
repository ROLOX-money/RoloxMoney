import 'package:flutter/material.dart';
/*Chinnadurai Viswanathan*/

abstract class Languages {
  static Languages? of(BuildContext context) {
    return Localizations.of<Languages>(context, Languages);
  }

  String get appName;
}
