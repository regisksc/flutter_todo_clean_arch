extension ColorExtensions on String {
  int get toColorHex {
    final hexColor = replaceAll('#', '');
    return int.parse('0xFF$hexColor');
  }
}
