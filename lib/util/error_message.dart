// lib/util/error_utils.dart
import 'package:flutter/material.dart';
import 'package:listadetarefas/util/theme_settings.dart';

void showErrorDialog(BuildContext context, String message) {
  final overlay = Overlay.of(context);
  final overlayEntry = OverlayEntry(
    builder: (context) => Positioned(
      bottom: 75,
      left: 60,
      right: 60,
      child: Material(
        color: Colors.transparent,
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.black38,
              width: 2
            ),
            color: ThemeSettings.darkColor,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Text(
            message,
            style: TextStyle(
              color: ThemeSettings.getSecondaryColor(),
              fontSize: 16,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    ),
  );

  overlay.insert(overlayEntry);

  Future.delayed(const Duration(seconds: 1), () {
    overlayEntry.remove();
  });
}
