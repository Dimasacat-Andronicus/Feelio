import 'package:feelio/features/mood_view/bloc/mood_view_bloc.dart';
import 'package:flutter/material.dart';

class JournalViewContainer extends StatefulWidget {
  const JournalViewContainer({super.key, required this.state});
  final MoodViewState state;

  @override
  State<JournalViewContainer> createState() => _JournalViewContainerState();
}

class _JournalViewContainerState extends State<JournalViewContainer> {
  late ScrollController _scrollController;
  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> mood =
        widget.state.userMood.map((e) => e.toMap()).toList();
    final String description =
        mood.first['description'].toString().isEmpty
            ? "No description provided."
            : mood.first['description'].toString();
    return SizedBox(
      width: double.infinity,
      height: 250,
      child: Scrollbar(
        thumbVisibility: true,
        controller: _scrollController,
        child: SingleChildScrollView(
          controller: _scrollController,
          padding: const EdgeInsets.all(
            12,
          ), // Adds padding for better readability
          child: Text(
            description,
            style: TextStyle(fontSize: 14, color: Colors.grey[800]),
          ),
        ),
      ),
    );
  }
}
