class MoodHelpers {
  String getEmojiName(int index) {
    switch (index) {
      case 0:
        return "Happy";
      case 1:
        return 'Sad';
      case 2:
        return 'Angry';
      case 3:
        return 'Nervous';
      case 4:
        return 'Sleepy';
      case 5:
        return 'Curious';
      case 6:
        return 'Overthinking';
      case 7:
        return 'Wow';
      case 8:
        return 'Cool';
      default:
        return 'unknown';
    }
  }
}
