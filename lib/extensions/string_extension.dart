extension StringExt on String {
  String capitalize() {
    final n = this.toString();
    return "${n[0].toUpperCase()}${n.substring(1)}";
  }

  String toImage() => "$this.png";
}