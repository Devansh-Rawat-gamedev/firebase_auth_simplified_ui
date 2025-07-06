import 'package:flutter/material.dart';

class DefaultAuthTheme extends InheritedWidget {
  final Color backgroundColor;
  final EdgeInsets padding;
  final InputDecoration inputDecoration;
  final ButtonStyle primaryButtonStyle;
  final TextStyle primaryButtonTextStyle;
  final TextStyle linkStyle;
  final TextStyle errorTextStyle;
  final TextStyle infoTextStyle;
  final TextStyle titleStyle;
  final Widget? logo;

  const DefaultAuthTheme({
    Key? key,
    required Widget child,
    this.backgroundColor = Colors.white,
    this.padding = const EdgeInsets.all(24),
    this.inputDecoration = const InputDecoration(
      filled: true,
      fillColor: Color(0x1F5F5F87),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(30)),
      ),
    ),
    this.primaryButtonStyle = const ButtonStyle(
      backgroundColor: MaterialStatePropertyAll(Colors.teal),
      foregroundColor: MaterialStatePropertyAll(Colors.white),
      shape: MaterialStatePropertyAll(
        RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(30))),
      ),
    ),
    this.primaryButtonTextStyle = const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
    this.linkStyle = const TextStyle(color: Colors.blue),
    this.errorTextStyle = const TextStyle(color: Colors.red),
    this.infoTextStyle = const TextStyle(color: Colors.teal),
    this.titleStyle = const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
    this.logo,
  }) : super(key: key, child: child);

  static DefaultAuthTheme of(BuildContext ctx) => ctx.dependOnInheritedWidgetOfExactType<DefaultAuthTheme>()!;

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) => false;
}
