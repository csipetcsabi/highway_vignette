import 'package:flutter/material.dart';

class RoundedBottomAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  final AppBar child;
  final double height;

  const RoundedBottomAppBar({super.key,
    required this.child,
    this.height = kToolbarHeight,
  });

  @override
  Size get preferredSize => Size.fromHeight(height);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.vertical(bottom: Radius.circular(20)),
      child: child,
    );
  }
}
