import 'package:flutter/material.dart';

class AppLifecycleManager extends StatefulWidget {
  final Widget child;

  const AppLifecycleManager({super.key, required this.child});

  @override
  AppLifecycleManagerState createState() => AppLifecycleManagerState();
}

class AppLifecycleManagerState extends State<AppLifecycleManager>
    with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.paused) {
      // print("App pausado");
    } else if (state == AppLifecycleState.inactive) {
      // print("App inativo");
    } else if (state == AppLifecycleState.resumed) {
      // print("App retomado");
    } else if (state == AppLifecycleState.detached) {
      // print("App morto");
    }
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}
