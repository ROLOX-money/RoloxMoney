import 'package:flutter/material.dart';
import 'package:roloxmoney/singleton.dart';
/*Chinnadurai Viswanathan*/

/// Base class of the CoreWidget's stateful widget class
abstract class CoreWidgets extends StatefulWidget {
  /// base class constructor of CoreWidget's stateful widget class
  const CoreWidgets({Key? key}) : super(key: key);
}

/// Base class of the CoreWidget's state class
// class CoreWidgetsState extends State<CoreWidgets> {
class CoreWidgetsState<T> extends State<CoreWidgets> {
  //Sample or Example values
  bool updating = false;
  dynamic singletonInstance;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    singletonInstance = Singleton.instance;
    super.initState();
  }

  Future<void> _update() async {
    setState(() {
      updating = false;
    });
  }

  void update() {
    setState(() {
      updating = true;
    });
    _update();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
