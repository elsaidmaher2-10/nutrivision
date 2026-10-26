import 'package:flutter/material.dart';

class ScannerTopBar extends StatelessWidget {
  const ScannerTopBar({
    required this.flashOn,
    required this.onToggleFlash,
    required this.onClose,
    super.key,
  });

  final bool flashOn;
  final VoidCallback onToggleFlash;
  final VoidCallback onClose;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            icon: const Icon(Icons.close_rounded, color: Colors.white, size: 28),
            onPressed: onClose,
          ),
          const Text(
            'مسح الوجبة بالذكاء الاصطناعي',
            style: TextStyle(fontFamily: 'Cairo', fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          IconButton(
            icon: Icon(flashOn ? Icons.flash_on_rounded : Icons.flash_off_rounded, color: Colors.white, size: 26),
            onPressed: onToggleFlash,
          ),
        ],
      ),
    );
  }
}
