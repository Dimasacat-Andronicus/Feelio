import 'package:feelio/features/mood_list.dart/bloc/mood_list_bloc.dart';
import 'package:feelio/shared/helpers.dart/emoji_list.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
      items: imageSliders,
    );
  }
}
