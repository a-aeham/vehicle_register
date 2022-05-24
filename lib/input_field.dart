import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class InputField extends StatelessWidget {
  final String label;
  final String content;
  final TextEditingController controller;
  final TextInputFormatter inputFormatters;

  const InputField(
      {Key key,
      this.label,
      this.inputFormatters,
      this.content,
      this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return Row(
          children: <Widget>[
            SizedBox(
              width: 140.0,
              child: Text(
                label,
                style: const TextStyle(
                  fontSize: 18.0,
                  fontFamily: 'amiri',
                ),
                textAlign: TextAlign.right,
              ),
            ),
            const SizedBox(
              width: 40.0,
            ),
            Container(
              width: MediaQuery.of(context).size.width / 3.7,
              color: Colors.blue[50],
              child: TextFormField(
                inputFormatters: [inputFormatters],
                controller: controller,
                style: const TextStyle(
                  fontSize: 17.0,
                ),
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.all(10.0),
                  border: OutlineInputBorder(
                    borderSide: const BorderSide(
                        // color: Colors.blue[50],
                        ),
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                        // color: Colors.blue![50],
                        ),
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  hintText: content,
                  fillColor: Colors.blue[50],
                ),
              ),
            ),
            const SizedBox(
              width: 25,
            ),
          ],
        );
      },
    );
  }
}
