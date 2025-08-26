import 'package:flutter/material.dart';
import '../theme.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Widget? backBtn;
  final List<Widget>? actionBtn;
  final Widget? titleWidget;
  final String? title;
  final bool homeMode;

  const CustomAppBar({
    Key? key,
    this.backBtn,
    this.actionBtn,
    this.title,
    this.titleWidget,
    this.homeMode = false,
  }) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(65);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: preferredSize.height,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 0,
            blurRadius: 5,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Back button
          if (!homeMode)
            backBtn ??
                IconButton(
                  onPressed: () => Navigator.of(context).pop(true),
                  icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
                )
          else
            const SizedBox(width: 48), // espacio para mantener simetría

          // Título centrado
          Expanded(
            child: Center(
              child: titleWidget ??
                  Text(
                    title ?? "",
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontSize: 16,
                    ),
                    textAlign: TextAlign.center,
                  ),
            ),
          ),

          // Botones de acción
          if (actionBtn != null)
            Row(children: actionBtn!)
          else
            const SizedBox(width: 48), // espacio para mantener simetría
        ],
      ),
    );
  }
}

/// AppBar simple con logo centrado
AppBar simpleAppBar() {
  return AppBar(
    automaticallyImplyLeading: false,
    backgroundColor: primaryColor,
    centerTitle: true,
    leading: null,
    title: Center(child: Image.asset('assets/logo_w.png', height: 50)),
  );
}
