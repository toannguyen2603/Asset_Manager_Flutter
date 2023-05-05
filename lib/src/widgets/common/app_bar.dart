import 'package:flutter/material.dart';
import '../../constaints/export_constraints.dart';

class PAppBar extends StatelessWidget implements PreferredSizeWidget {

  const PAppBar({super.key, this.leading, this.title, this.actions});

  final Widget? leading;
  final Widget? title;
  final List<Widget>? actions;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: title,
      actions: actions,
      automaticallyImplyLeading: leading == null,
      leading: leading,
    );
  }
   @override
  Size get preferredSize => UiParameters.appBarSize;
}
