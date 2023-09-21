import 'package:flutter/material.dart';
import 'package:gdgica/config/index.dart';
import 'package:gdgica/utils/tools.dart';

class ImageCard extends StatelessWidget {
final String? img;

const ImageCard({Key? key, this.img}) : super(key: key);
@override
Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20.0),
      height: MediaQuery.of(context).size.height * 0.3,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: ConfigBloc().darkModeOn
            ? Tools.hexToColor("#1f2124")
            : Colors.white,
        borderRadius: BorderRadius.circular(
          10.0,
        ),
      ),
      child: Image.asset(
        img!,
        fit: BoxFit.cover,
        filterQuality: FilterQuality.high,
      ),
    );
 }
}
