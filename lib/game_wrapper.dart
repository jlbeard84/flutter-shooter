import 'package:flutter/material.dart';

import 'game_app.dart';

class GameWrapper extends StatelessWidget {
  final GameApp game;

  GameWrapper(this.game);

  @override 
  Widget build(BuildContext context) {
    return game.widget;
  }
}
