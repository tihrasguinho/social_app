import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  const MyButton({Key? key, required this.title, this.onPressed}) : super(key: key);

  final String title;
  final Function? onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 5),
      child: MaterialButton(
        onPressed: onPressed != null ? () => onPressed!() : () {},
        color: Theme.of(context).primaryColorDark,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(32.0),
        ),
        child: SizedBox(
          height: 48,
          child: Center(
            child: Text(
              title,
              style: const TextStyle(fontWeight: FontWeight.w400),
            ),
          ),
        ),
      ),
    );
  }
}
