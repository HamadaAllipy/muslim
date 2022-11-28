class Verse {
  final String verseText;

  final int numberOfVerse;

  final String fromSurah;

  final int index;
  final int surahNumber;

  final double offset;

  Verse({
    required this.verseText,
    required this.fromSurah,
    required this.numberOfVerse,
    required this.index,
    required this.surahNumber,
    required this.offset,
  });
}
