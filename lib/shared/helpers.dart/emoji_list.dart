import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

final List<Map<String, String>> emojiList = [
  {"name": "happy", "url": "assets/emojis/happy.json"},
  {"name": "sad", "url": "assets/emojis/sad.json"},
  {"name": "angry", "url": "assets/emojis/angry.json"},
  {"name": "nervous", "url": "assets/emojis/nervous.json"},
  {"name": "sleepy", "url": "assets/emojis/sleepy.json"},
  {"name": "curious", "url": "assets/emojis/curious.json"},
  {"name": "overthinking", "url": "assets/emojis/overthinking.json"},
  {"name": "wow", "url": "assets/emojis/wow.json"},
];

final List<Widget> imageSliders =
    emojiList
        .map(
          (item) => Container(
            margin: EdgeInsets.all(5.0),
            child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(5.0)),
              child: Stack(
                children: <Widget>[
                  Card(
                    child: LottieBuilder.asset(
                      item["url"]!,
                      fit: BoxFit.contain,
                      width: 1000.0,
                      height: 1000.0,
                      animate: false,
                    ),
                  ),
                ],
              ),
            ),
          ),
        )
        .toList();
