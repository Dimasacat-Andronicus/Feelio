import 'dart:ui';

enum Mood {
  sad("Feeling down or unhappy.", "assets/images/sad.png", Color(0xFF9999FF)),
  angry("Feeling mad or upset.", "assets/images/angry.png", Color(0xFFFF0000)),
  confused(
    "Feeling uncertain or perplexed.",
    "assets/images/confused.png",
    Color(0xFFFFA500),
  ),
  money(
    "Feeling rich or wealthy.",
    "assets/images/money.png",
    Color(0xFF00FF00),
  ),
  fever(
    "Feeling sick or unwell.",
    "assets/images/fever.png",
    Color.fromARGB(255, 255, 145, 0),
  ),
  inlove(
    "Feeling affectionate or in love.",
    "assets/images/inlove.png",
    Color(0xFFFF69B4),
  ),
  sleeping(
    "Feeling tired or sleepy.",
    "assets/images/sleeping.png",
    Color.fromARGB(255, 106, 91, 121),
  ),
  sweating(
    "Feeling nervous or anxious.",
    "assets/images/sweating.png",
    Color(0xFFFF6347),
  ),
  vomiting(
    "Feeling nauseous or sick.",
    "assets/images/vomiting.png",
    Color(0xFFADFF2F),
  ),
  overwhelmed(
    "Feeling overwhelmed or exhausted.",
    "assets/images/overwhelmed.png",
    Color(0xFF8B4513),
  );

  final String description;
  final String imgUrl;
  final Color emojiColor;

  // Named constructor for initializing properties
  const Mood(this.description, this.imgUrl, this.emojiColor);
}

// Adding an extension for more functionality
extension MoodExtension on Mood {
  String moodMessage() {
    return "Your current mood is $name $description";
  }
}
