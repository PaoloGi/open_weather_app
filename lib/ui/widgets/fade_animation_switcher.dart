import 'package:flutter/material.dart';

class FadeAnimationSwitcher extends StatelessWidget{

  final Widget child;
  const FadeAnimationSwitcher({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return
      AnimatedSwitcher(
          duration: Duration(milliseconds: 500),
          transitionBuilder: (Widget child, Animation<double> animation) {
            return FadeTransition(child: child, opacity: animation);
          },
          child: child);
  }

}