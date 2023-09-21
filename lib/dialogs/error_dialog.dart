import 'package:flutter/material.dart';
import 'package:gdgica/utils/devfest.dart';

class ErrorDialog extends StatelessWidget {
  final Widget? child;
  final dynamic error;
  final Function? onTap;

  const ErrorDialog(
      {Key? key, this.child, this.error = Devfest.someErrorText, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text(error),
                const SizedBox(
                  height: 10,
                ),
                // FlatButton(
                //   colorBrightness: Brightness.dark,
                //   child: Text(Devfest.try_again_text),
                //   color: Colors.red,
                //   onPressed: () {
                //     Navigator.pop(context);
                //     if (onTap != null) {
                //       onTap();
                //     }
                //   },
                // )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
