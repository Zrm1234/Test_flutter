import 'package:flutter/material.dart';
import 'Abstraction.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

Abstraction app = Abstraction();

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey[300],
        appBar: AppBar(
          backgroundColor: Colors.grey,
          title: Text(
            "اختبار",
            style: TextStyle(
              fontSize: 27,
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ExamPage(),
        ),
      ),
    );
  }
}

class ExamPage extends StatefulWidget {
  const ExamPage({Key? key}) : super(key: key);

  @override
  State<ExamPage> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<ExamPage> {
  List<Widget> answerrse = [];
  int rightanswer = 0;

  void checkanswer(bool whatuserpick) {
    bool corans = app.getquestionanswer();
    setState(() {
      if (whatuserpick == corans) {
        rightanswer++;
        print("اجابة المستخدم كانت صحيحة");
        answerrse.add(Padding(
          padding: const EdgeInsets.all(3.0),
          child: Icon(
            Icons.thumb_up,
            color: Colors.green,
          ),
        ));
      } else {
        answerrse.add(Padding(
          padding: const EdgeInsets.all(3.0),
          child: Padding(
            padding: const EdgeInsets.all(3.0),
            child: Icon(
              Icons.thumb_down,
              color: Colors.red,
            ),
          ),
        ));
        print("اجابة المستخدم كانت خاطئة");
      }
      if (app.isfinshed() == true) {
        Alert(
          context: context,
          title: "أنتهى الاختبار",
          desc: "لقد اجبت على $rightanswer اسئلة من اصل 7 ",
          buttons: [
            DialogButton(
              child: Text(
                "ابدأ من جديد",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              onPressed: () => Navigator.pop(context),
              width: 120,
            )
          ],
        ).show();
        app.reset();
        answerrse = [];
        rightanswer = 0;
      } else {
        app.nextquestion();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          children: answerrse,
        ),
        Expanded(
          flex: 5,
          child: Column(
            children: [
              Image.asset(app.getquestionimage()),
              SizedBox(
                height: 20.0,
              ),
              Text(
                app.getquestiontext(),
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 24.0,
                ),
              ),
            ],
          ),
        ),
        Expanded(
            child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: TextButton(
            style: TextButton.styleFrom(
                primary: Colors.white, backgroundColor: Colors.blue),
            onPressed: () {
              checkanswer(true);
            },
            child: Text(
              "صح",
              style: TextStyle(fontSize: 20),
            ),
          ),
        )),
        Expanded(
            child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: TextButton(
            style: TextButton.styleFrom(
                primary: Colors.white, backgroundColor: Colors.red),
            onPressed: () {
              checkanswer(false);
            },
            child: Text(
              "خطأ",
              style: TextStyle(fontSize: 20),
            ),
          ),
        )),
      ],
    );
  }
}
