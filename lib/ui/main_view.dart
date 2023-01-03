

import 'package:floating_action_bar/io/actions_manager.dart';
import 'package:floating_action_bar/ui/widgets/action_button.dart';
import 'package:flutter/material.dart';

class MainView extends StatelessWidget{
  const MainView({super.key});

  List<ActionButton> _buildActions(){
    List<ActionButton> actionButtons = [];
    dynamic actions = config['actions'];

    for(dynamic action in actions){
      actionButtons.add(ActionButton(action: action));
    }

    return actionButtons;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: SingleChildScrollView(
        child: Column(
          children: _buildActions(),
        ),
      ),
    );
  }

}


