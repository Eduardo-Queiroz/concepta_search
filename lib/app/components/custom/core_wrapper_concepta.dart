import 'package:flutter/material.dart';

class CoreWrapperConcepta extends StatelessWidget {
  const CoreWrapperConcepta({
    super.key,
    required this.children,
  });

  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Stack(
      alignment: Alignment.center,
      children: <Widget>[
        Positioned(
          width: width,
          top: height / 4,
          child: Column(
            children: children,
          ),
        ),
      ],
    );
  }
}
