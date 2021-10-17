

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slider_drawer/flutter_slider_drawer.dart';

class WeatherMenuIconButton extends StatefulWidget {
  final GlobalKey<SliderMenuContainerState> keyMenu;
  const WeatherMenuIconButton({Key? key, required this.keyMenu}) : super(key: key);
  @override
  State<StatefulWidget> createState() => WeatherMenuIconButtonState();
}

class WeatherMenuIconButtonState extends State<WeatherMenuIconButton> with TickerProviderStateMixin {
  bool _flag = true;
  Animation<double>? _myAnimation;
  AnimationController? _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 200),
    );
    _myAnimation = CurvedAnimation(
        curve: Curves.linear,
        parent: _controller!
    );
  }

  @override
  Widget build(BuildContext context) {
    return
      IconButton(
          icon: AnimatedIcon(
            progress: _myAnimation!,
            icon: AnimatedIcons.menu_close,
            color: Colors.black54,
          ),
          onPressed: (){
            widget.keyMenu.currentState!.isDrawerOpen ? _controller!.reverse() : _controller!.forward();
            widget.keyMenu.currentState!.toggle();
          });
  }


}