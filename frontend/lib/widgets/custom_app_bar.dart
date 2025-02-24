import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final VoidCallback? onLogoPressed;

  const CustomAppBar({
    super.key,
    this.onLogoPressed,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: GestureDetector(
        onTap: onLogoPressed,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset('assets/azar-logo.png'),
        ),
      ),
      backgroundColor: Color(0xFF2A2A2A),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}