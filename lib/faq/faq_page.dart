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
      question: "¿Qué es GDG Ica?",
      answer: "GDG Ica es el capítulo oficial de Google Developers Group en la ciudad de Ica. Es una comunidad de desarrolladores y entusiastas de la tecnología que se reúnen para explorar nuevas tecnologías y aprender juntos.",
    ),
    FaqItem(
      question: "¿Qué significa GDG?",
      answer: "GDG significa Google Developers Group, es una comunidad global de desarrolladores que se enfoca en aprender y compartir conocimientos sobre tecnologías de Google y otras tecnologías relacionadas.",
    ),
    FaqItem(
      question: "¿Qué tipo de eventos y actividades organiza GDG Ica?",
      answer: "GDG Ica organiza una variedad de eventos y actividades, como charlas técnicas, talleres, hackatones y reuniones de networking. Estos eventos están diseñados para fomentar el aprendizaje y la colaboración entre desarrolladores y entusiastas de la tecnología.",
    ),
    FaqItem(
      question: "¿Qué es DevFest?",
      answer: "DevFest es una conferencia tecnológica anual descentralizada organizada por grupos de desarrolladores de Google en todo el mundo. Es un evento que reúne a la comunidad tecnológica para aprender y compartir conocimientos sobre diversas tecnologías.",
    ),
    FaqItem(
      question: "¿Cuándo se llevará a cabo el DevFest de este año?",
      answer: "El DevFest de este año se llevará a cabo el 2 de diciembre. Contaremos con dos auditorios, uno destinado al público en general cuyo horario será de 9:30 a.m. a 6:00 p.m. en el auditorio Raúl Porras Barrenechea y el segundo para estudiantes de secundaria de 9:30 a.m. a 1:00 p.m. en el teatrin Abraham Valdelomar. Ambos auditorios están ubicados a una cuadra de la Plaza de Armas.",
    ),
    FaqItem(
      question: "¿Cuál es el objetivo del DevFest?",
      answer: "El objetivo del DevFest es proporcionar charlas técnicas y talleres sobre tecnologías emergentes y tendencias en el mundo de la tecnología. También promueve la colaboración y el networking entre profesionales y entusiastas de la tecnología.",
    ),
    FaqItem(
      question: "¿Qué tipo de charlas y temas se tratarán en el DevFest?",
      answer: "El DevFest incluye charlas y talleres sobre una amplia variedad de temas tecnológicos, que van desde desarrollo de aplicaciones móviles hasta inteligencia artificial, desarrollo web, cloud computing y más. Los temas específicos pueden variar cada año.",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("FAQ"),
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

