import 'question.dart';

class Abstraction {
  int _qnumber = 0;
  List<Questions> _questionGroup = [
    Questions(
        q: "عدد الكواكب الشمسية هو ثمانية ", i: "images/image-1.jpg", t: true),
    Questions(q: "القطط حيوانات لاحمة", i: "images/image-2.jpg", t: true),
    Questions(
        q: "الصين موجودة في القارة الافريقية",
        i: 'images/image-3.jpg',
        t: false),
    Questions(q: "الارض مسطحة وليست كروية", i: 'images/image-4.jpg', t: false),
    Questions(
        q: "بأستطاعة الانسان البقاء على قيد الحياة بدون اكل اللحوم",
        i: "images/image-5.jpg",
        t: true),
    Questions(q: "الشمس تدور حول الأرض ", i: "images/image-6.jpg", t: false),
    Questions(q: "الحيوانات لا تشعر بلألم", i: "images/image-7.jpg", t: false),
  ];
  void nextquestion() {
    if (_qnumber < _questionGroup.length - 1) {
      _qnumber++;
    }
  }

  String getquestiontext() {
    return _questionGroup[_qnumber].questiontext;
  }

  String getquestionimage() {
    return _questionGroup[_qnumber].questionimage;
  }

  bool getquestionanswer() {
    return _questionGroup[_qnumber].questionanswer;
  }

  bool isfinshed() {
    if (_qnumber >= _questionGroup.length - 1) {
      return true;
    } else {
      return false;
    }
  }

  void reset() {
    _qnumber = 0;
  }
}
