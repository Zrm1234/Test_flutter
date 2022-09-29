class Questions {
  String questiontext = "";
  String questionimage = "";
  bool questionanswer = true;
  Questions({
    required String q,
    required String i,
    required bool t,
  }) {
    questiontext = q;
    questionimage = i;
    questionanswer = t;
  }
}
