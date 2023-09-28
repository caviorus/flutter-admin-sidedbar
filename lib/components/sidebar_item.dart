import 'package:flutter/material.dart';

class SidebarItem extends StatelessWidget {
  final IconData icon;
  final String text;
  final Function onTap;

  const SidebarItem({super.key, required this.icon, required this.text, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onTap();
      },
      child: ListTile(
        leading: Icon(icon),
        title: Text(text),
      ),
    );
  }
}

class SidebarSubItem extends StatefulWidget {
  final bool? expanded;
  final IconData icon;
  final String title;
  final List<Widget>? submenu;
  const SidebarSubItem({super.key, this.expanded,required this.icon, required this.title, this.submenu});

  @override
  State<SidebarSubItem> createState() => _SidebarSubItemState();
}

class _SidebarSubItemState extends State<SidebarSubItem> {
  bool isExpanded = false;
  bool stateChanged = false;
  
  @override
  Widget build(BuildContext context) {
    if(!stateChanged){
      setState(() {
        isExpanded = widget.expanded ?? false;
      });
    }

    return Column(
      children: [
        SidebarItem(
          icon: widget.icon,
          text: widget.title,
          onTap: () {
            setState(() {
              isExpanded = !isExpanded;
              stateChanged = true;
            });
          },
        ),
        AnimatedContainer(
          duration:
              const Duration(milliseconds: 300), // Adjust the duration as needed
          height: isExpanded ? 120 : 0, // Set the desired height when expanded
          child: SingleChildScrollView(
            // Wrap with SingleChildScrollView
            child: Column(
              children: widget.submenu ?? [],
            ),
          ),
        ),
      ],
    );
  }
}