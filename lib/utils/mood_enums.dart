import 'dart:ui';

enum Mood {
  sad,
  angry,
  confused,
  money,
  fever,
  inlove,
  sleeping,
  sweating,
  vomiting,
  overwhelmed;

  String get emoji {
    switch (this) {
      case Mood.sad:
        return "😢";
      case Mood.angry:
        return "😡";
      case Mood.confused:
        return "😕";
      case Mood.money:
        return "🤑";
      case Mood.fever:
        return "🤒";
      case Mood.inlove:
        return "😍";
      case Mood.sleeping:
        return "😴";
      case Mood.sweating:
        return "😅";
      case Mood.vomiting:
        return "🤮";
      case Mood.overwhelmed:
        return "🫠";
    }
  }

  String get description {
    switch (this) {
      case Mood.sad:
        return "Feeling down or unhappy.";
      case Mood.angry:
        return "Feeling mad or upset.";
      case Mood.confused:
        return "Feeling uncertain or perplexed.";
      case Mood.money:
        return "Feeling rich or wealthy.";
      case Mood.fever:
        return "Feeling sick or unwell.";
      case Mood.inlove:
        return "Feeling affectionate or in love.";
      case Mood.sleeping:
        return "Feeling tired or sleepy.";
      case Mood.sweating:
        return "Feeling nervous or anxious.";
      case Mood.vomiting:
        return "Feeling nauseous or sick.";
      case Mood.overwhelmed:
        return "Feeling overwhelmed or exhausted.";
    }
  }

  String get imgUrl {
    switch (this) {
      case Mood.sad:
        return "assets/images/sad.png";
      case Mood.angry:
        return "assets/images/angry.png";
      case Mood.confused:
        return "assets/images/confused.png";
      case Mood.money:
        return "assets/images/money.png";
      case Mood.fever:
        return "assets/images/fever.png";
      case Mood.inlove:
        return "assets/images/inlove.png";
      case Mood.sleeping:
        return "assets/images/sleeping.png";
      case Mood.sweating:
        return "assets/images/sweating.png";
      case Mood.vomiting:
        return "assets/images/vomiting.png";
      case Mood.overwhelmed:
        return "assets/images/overwhelmed.png";
    }
  }

  Color get emojiColor {
    switch (this) {
      case Mood.sad:
        return const Color(0xFF9999FF);
      case Mood.angry:
        return const Color(0xFFFF0000);
      case Mood.confused:
        return const Color(0xFFFFA500);
      case Mood.money:
        return const Color(0xFF00FF00);
      case Mood.fever:
        return const Color.fromARGB(255, 255, 145, 0);
      case Mood.inlove:
        return const Color(0xFFFF69B4);
      case Mood.sleeping:
        return const Color.fromARGB(255, 106, 91, 121);
      case Mood.sweating:
        return const Color(0xFFFF6347);
      case Mood.vomiting:
        return const Color(0xFFADFF2F);
      case Mood.overwhelmed:
        return const Color(0xFF8B4513);
    }
  }
}

// Adding an extension for more functionality
extension MoodExtension on Mood {
  String moodMessage() {
    return "Your current mood is $name ${emoji}. ${description}";
  }
}

// void main() {
//   Mood currentMood = Mood.excited;

//   print(currentMood.moodMessage());
// }
