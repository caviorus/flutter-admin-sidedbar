import 'package:flutter/material.dart';

class SidebarContainer extends StatelessWidget {
  final List<Widget> sidebarItem;
  final Color? backgroundColor;
  final double? width;
  final Widget? content;
  const SidebarContainer(
      {super.key,
      required this.sidebarItem,
      this.backgroundColor,
      this.width,
      this.content});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Material(
          color: backgroundColor ?? Theme.of(context).primaryColor,
          child: SizedBox(
            width: width ?? 200,
            height: MediaQuery.of(context).size.height,
            child: ListView(
              children: sidebarItem,
            ),
          ),
        ),
        Container(
          child: content,
        )
      ],
    );
  }
}