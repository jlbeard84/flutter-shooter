import 'package:flame/flame.dart';
import 'package:flutter/material.dart';
import 'game_app.dart';
import 'game_wrapper.dart';

var game;

void main() async {
  Flame.images.loadAll([
    'fire.png',
    'dragon.png',
    'gun.png',
    'bullet.png'
  ]);

  var dimensions = await Flame.util.initialDimensions();

  game = new GameApp(dimensions);

  runApp(MaterialApp(
    home: Scaffold(
      body: Container(
        decoration: new BoxDecoration(
          image: new DecorationImage(
            image: new AssetImage("assets/images/background.jpg"),
            fit: BoxFit.cover
          )
        ),
        child: GameWrapper(game)
      )
    )
  ));
}
