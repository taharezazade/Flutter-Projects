//* Calculator
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ماشین حساب ساده',
      home: CalculatorPage(),
    );
  }
}

class _CalculatorPageState extends State<CalculatorPage> {
  final TextEditingController num1Controller = TextEditingController();
  final TextEditingController num2Controller = TextEditingController();
  String result = '';

  void addNumbers() {
    double n1 = double.tryParse(num1Controller.text) ?? 0;
    double n2 = double.tryParse(num2Controller.text) ?? 0;
    double sum = n1 + n2;
    setState(() {
      result = 'نتیجه: $sum';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('ماشین حساب ساده')),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
TextField(
              controller: num1Controller,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'عدد اول را وارد کنید'),
            ),
            TextField(
              controller: num2Controller,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'عدد دوم را وارد کنید'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: addNumbers,
              child: Text('جمع کن'),
            ),
            SizedBox(height: 20),
            Text(result, style: TextStyle(fontSize: 24)),
          ],
        ),
      ),
    );
  }
}


//* Note Application
import 'package:flutter/material.dart';

void main() {	
  runApp(NoteApp());
}

class NoteApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'اپ یادداشت‌برداری',
      home: NoteHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class NoteHomePage extends StatefulWidget {
  @override
  _NoteHomePageState createState() => _NoteHomePageState();
}

class _NoteHomePageState extends State<NoteHomePage> {
  final TextEditingController noteController = TextEditingController();
  List<String> notes = [];

  void addNote() {
    String text = noteController.text.trim();
    if (text.isNotEmpty) {
      setState(() {
        notes.add(text);
        noteController.clear();
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('اپ یادداشت‌برداری'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: noteController,
              decoration: InputDecoration(
                labelText: 'یادداشت خود را وارد کنید',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 12),
            ElevatedButton(
              onPressed: addNote,
              child: Text('افزودن یادداشت'),
            ),
            SizedBox(height: 20),
            Expanded(
              child: notes.isEmpty
                  ? Center(child: Text('هنوز یادداشتی وارد نشده است.'))
                  : ListView.builder(
                      itemCount: notes.length,
                      itemBuilder: (context, index) {
                        return Card(
                          child: ListTile(
                            title: Text(notes[index]),
                          ),
                        );
                      },
                    ),
            )
          ],
        ),
      ),
    );
  }
}

//* Cart Bascket with Delete
import 'package:flutter/material.dart';

void main() {
  runApp(ShoppingListApp());
}

class ShoppingListApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'لیست خرید',
      home: ShoppingListPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class ShoppingListPage extends StatefulWidget {
  @override
  _ShoppingListPageState createState() => _ShoppingListPageState();
}

class _ShoppingListPageState extends State<ShoppingListPage> {
  final TextEditingController itemController = TextEditingController();
  List<String> items = [];

  void addItem() {
    String item = itemController.text.trim();
    if (item.isNotEmpty) {
      setState(() {
        items.add(item);
        itemController.clear();
      });
    }
  }

  void removeItem(int index) {
    setState(() {
      items.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('لیست خرید'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: itemController,
              decoration: InputDecoration(
                labelText: 'مورد جدید را وارد کنید',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 12),
            ElevatedButton(
              onPressed: addItem,
              child: Text('افزودن به لیست'),
            ),
            SizedBox(height: 20),
            Expanded(
              child: items.isEmpty
                  ? Center(child: Text('لیست خرید شما خالی است.'))
                  : ListView.builder(
                      itemCount: items.length,
                      itemBuilder: (context, index) {
                        return Dismissible(
                          key: Key(items[index]),
                          direction: DismissDirection.endToStart,
                          onDismissed: (direction) {
                            removeItem(index);
                          },
                          background: Container(
                            color: Colors.red,
                            alignment: Alignment.centerRight,
                            padding: EdgeInsets.symmetric(horizontal: 20),
                            child: Icon(Icons.delete, color: Colors.white),
                          ),
                          child: Card(
                            child: ListTile(
                              title: Text(items[index]),
                            ),
                          ),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}

//* Quiz_Application.dart
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: QuizPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {

  List<Map<String, Object>> questions = [
    {
      'question': 'پایتخت ایران کدام است؟',
      'answers': ['شیراز', 'تهران', 'اصفهان', 'تبریز'],
      'correct': 'تهران',
    },
    {
      'question': 'نتیجه ۳ + ۵ چیست؟',
      'answers': ['۵', '۸', '۷', '۹'],
      'correct': '۸',
    },
    {
      'question': 'کدام زبان برنامه‌نویسی برای فلاتر استفاده می‌شود؟',
      'answers': ['Java', 'Dart', 'Python', 'C++'],
      'correct': 'Dart',
    },
  ];

  int currentQuestionIndex = 0;
  int score = 0;

  void answerQuestion(String selectedAnswer) {
    String correctAnswer = questions[currentQuestionIndex]['correct'] as String;

    if (selectedAnswer == correctAnswer) {
      score++;
    }

    setState(() {
      currentQuestionIndex++;
    });
  }

  void restartQuiz() {
    setState(() {
      currentQuestionIndex = 0;
      score = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('آزمون ساده'),
        centerTitle: true,
      ),

      body: currentQuestionIndex < questions.length
          ? Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  questions[currentQuestionIndex]['question'] as String,
                  style: TextStyle(fontSize: 22),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 20),
                ...(questions[currentQuestionIndex]['answers'] as List<String>)
                    .map(
                  (answer) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      child: ElevatedButton(
                        onPressed: () => answerQuestion(answer),
                        child: Text(answer),
                      ),
                    );
                  },
                ).toList()
              ],
            )

          : Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'پایان آزمون! \n امتیاز شما : $score',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 22),
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: restartQuiz,
                    child: Text('شروع دوباره'),
                  )
                ],
              ),
            ),
    );
  }
}

//* Timer Application
import 'dart:async';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'شمارنده با تایمر',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const CounterTimerPage(),
    );
  }
}

class CounterTimerPage extends StatefulWidget {
  const CounterTimerPage({super.key});

  @override
  State<CounterTimerPage> createState() => _CounterTimerPageState();
}

class _CounterTimerPageState extends State<CounterTimerPage> {
  int _counter = 0;
  int _seconds = 0;
  Timer? _timer;

  void _startTimer() {
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        _seconds++;
      });
    });
  }

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }





  void _resetAll() {
    _timer?.cancel();
    setState(() {
      _counter = 0;
      _seconds = 0;
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('شمارنده با تایمر')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('زمان سپری شده: $_seconds ثانیه'),
            const SizedBox(height: 16),
            Text('شمارنده: $_counter', style: const TextStyle(fontSize: 24)),
            ElevatedButton(
              onPressed: _startTimer,
              child: const Text('شروع تایمر'),
            ),
            ElevatedButton(
              onPressed: _incrementCounter,
              child: const Text('افزایش شمارنده'),
            ),
            ElevatedButton(
              onPressed: _resetAll,
              child: const Text('ریست'),
            ),
          ],
        ),
      ),
    );
  }
}
