import 'package:clipboard/clipboard.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Copytext(),
    );
  }
}

class Copytext extends StatefulWidget {
  const Copytext({super.key});

  @override
  State<Copytext> createState() => _CopytextState();
}

class _CopytextState extends State<Copytext> {

  String copytext = '''Machine language is a collection of binary digits or bits that the computer reads and interprets. Machine language is the only language a computer is capable of understanding. Machine level language is a language that supports the machine side of the programming or does not provide human side of the programming. It consists of (binary) zeros and ones. Each instruction in a program is represented by a numeric code, and numerical addresses are used throughout the program to refer to memory locations in the computer’s memory. Microcode allows for the expression of some of the more powerful machine level instructions in terms of a set of basic machine instructions.''';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text('Copy Text'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            Text(
              copytext,
              textAlign: TextAlign.justify,
              style: const TextStyle(
                fontSize: 15,
              ) 
            ),
            const SizedBox(height: 15,),
            InkWell(
              onTap: () {
                FlutterClipboard.copy(copytext);
                SnackBarrr(context,"Copied Text");
              },
              child: Container(
                height: 40,
                width: 100,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(10)
                ),
                child: Text('Copy Text',style: TextStyle(color: Colors.white),),
              ),
            )
          ],
        ),
      ),
    );
  }
}


SnackBarrr(BuildContext context, String title){
  return ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Padding(
        padding: const EdgeInsets.only(left: 20),
        child: Text(title, style: const TextStyle(color: Colors.white),),
      ),
      backgroundColor: Colors.green.withOpacity(0.8),
      action: SnackBarAction(label: "",textColor: Colors.white, onPressed: (){}),
      padding: const EdgeInsets.only(top: 5,left: 8),
      duration: const Duration(seconds: 3),
    ),
  );
}