import 'package:flutter/material.dart';
class FullScreenImagePage extends StatelessWidget {
  final String imagePath;

  const FullScreenImagePage({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Center(
            child: InteractiveViewer(
              child: Image.asset(
                imagePath,
                fit: BoxFit.contain,
                errorBuilder: (context, error, stackTrace) =>
                const Icon(Icons.broken_image, size: 100, color: Colors.white),
              ),
            ),
          ),

          // 🔙 Botón para cerrar
          Positioned(
            top: 40,
            left: 20,
            child: IconButton(
              icon: const Icon(Icons.close, color: Colors.white, size: 30),
              onPressed: () => Navigator.pop(context),
            ),
          ),
        ],
      ),
    );
  }
}
