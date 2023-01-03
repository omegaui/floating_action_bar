
import 'dart:io';

import 'package:flutter/material.dart';

import '../../themex.dart';

class ActionButton extends StatefulWidget{
  const ActionButton({super.key, this.action});

  final dynamic action;

  @override
  State<ActionButton> createState() => _ActionButtonState();
}

class _ActionButtonState extends State<ActionButton> {
  bool hover = false;
  bool tap = false;

  void onTap() {
    setState(() {
      tap = true;
      var command = <String>[];
      for(var arg in widget.action['exec']){
        command.add(arg.toString());
      }
      var executable = command[0];
      var arguments = command.getRange(1, command.length).toList();
      Process.start(executable, arguments);
    });
    Future.delayed(
        const Duration(milliseconds: 200), () => setState(() => tap = false));
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: MouseRegion(
        onEnter: (e) => setState(() => hover = true),
        onExit: (e) => setState(() => hover = false),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 2.0),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: hover ? ThemeX.buttonHoverColor : ThemeX.backgroundColor,
              borderRadius: BorderRadius.circular(tap ? 5 : 20),
            ),
            child: Center(
              child: Image(
                image: FileImage(File(widget.action['icon'])),
                width: 24,
                height: 24,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
