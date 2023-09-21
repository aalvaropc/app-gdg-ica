import 'package:flutter/material.dart';

class FaqPage extends StatefulWidget {
  static const String routeName = "/faq";
  const FaqPage({Key? key}) : super(key: key);

  @override
  _FaqPageState createState() => _FaqPageState();
}

class _FaqPageState extends State<FaqPage> {
  List<FaqItem> faqItems = [
    FaqItem(
      question: "¿Qué es Devfest?",
      answer: "DevFest son eventos globales organizados por capítulos de GDG en todo el mundo, donde la comunidad de desarrolladores se reúne para aprender sobre las tecnologías de Google y fortalecer sus lazos.",
    ),
    FaqItem(
      question: "¿Qué es el GDG?",
      answer: "Los Grupos de Google Developers (GDG) son la comunidad de desarrolladores más grande del mundo. Existen más de 1,000 GDG en más de 140 países. El programa facilita que los desarrolladores se conecten entre sí y aprendan a crear productos en todas las plataformas de Google.",
    ),

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("FAQ"),
      ),
      body: ListView.builder(
              itemCount: faqItems.length,
              itemBuilder: (context, index) {
                return ExpansionTile(
                  title: Text(faqItems[index].question),
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(
                        faqItems[index].answer,
                        textAlign: TextAlign.justify,
                      ),
                    ),
                  ],
                );
              },
            )
    );
  }
}

class FaqItem {
  final String question;
  final String answer;

  FaqItem({required this.question, required this.answer});
}

