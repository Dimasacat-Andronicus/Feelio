import 'package:feelio/features/mood_list.dart/bloc/mood_list_bloc.dart';
import 'package:feelio/shared/helpers.dart/mood_helper.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';

class EmojiCarousel extends StatefulWidget {
  const EmojiCarousel({super.key});

  @override
  EmojiCarouselState createState() => EmojiCarouselState();
}

class EmojiCarouselState extends State<EmojiCarousel> {
  @override
  void initState() {
    super.initState();
    context.read<EmojiMoodBloc>().add(GetUserMoodEvent(index: 0));
  }

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        aspectRatio: 2.0,
        enlargeCenterPage: true,
        scrollDirection: Axis.horizontal,
        onPageChanged: (index, reason) {
          context.read<EmojiMoodBloc>().add(GetUserMoodEvent(index: index));
        },
      ),
      items:
          MoodHelpers().emojiList
              .map(
                (item) => ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(5.0)),
                  child: Stack(
                    children: <Widget>[
                      LottieBuilder.asset(
                        item["url"]!,
                        fit: BoxFit.contain,
                        width: 1000.0,
                        height: 1000.0,
                        animate: true,
                      ),
                    ],
                  ),
                ),
              )
              .toList(),
    );
  }
}
