import 'dart:ui';
import 'package:flame/flame.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';

class GameApp extends BaseGame {
  @override
  void render(Canvas canvas) {
    var text = "Score 0";

    var textPainter = Flame.util.text(text, color: Colors.white, fontSize: 48.0);
    textPainter.paint(canvas, Offset(size.width / 5, size.height / 2));
  }

  @override
  void update(double t) {

  }
}