import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:floating_action_bar/io/actions_manager.dart';
import 'package:floating_action_bar/themex.dart';
import 'package:floating_action_bar/ui/main_view.dart';
import 'package:flutter/material.dart';

void main() {

  initAppData();

  runApp(const App());

  doWhenWindowReady(() {
    var initialSize = Size(config['width'], config['height']);
    appWindow.minSize = initialSize;
    appWindow.size = initialSize;
    appWindow.maxSize = initialSize;
    appWindow.alignment = Alignment.center;
    appWindow.show();
  });
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        color: ThemeX.backgroundColor,
        home: Scaffold(
          backgroundColor: ThemeX.backgroundColor,
          body: Stack(children: [
            const Align(
              alignment: Alignment.center,
              child: MainView(),
            ),
            Align(
              alignment: Alignment.center,
              child: MoveWindow(),
            ),
          ]),
        ),
      ),
    );
  }
}
