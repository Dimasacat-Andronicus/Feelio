String getMoodEmoji(String mood) {
  switch (mood) {
    case 'Happy':
      return '😊';
    case 'Sad':
      return '😢';
    case 'Angry':
      return '😡';
    case 'Nervous':
      return '😰';
    case 'Sleepy':
      return '😴';
    case 'Curious':
      return '🤔';
    case 'Overthinking':
      return '🤯';
    case 'Wow':
      return '😲';
    case 'Cool':
      return '😎';
    default:
      return '❓';
  }
}