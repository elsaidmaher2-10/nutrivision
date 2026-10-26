import 'package:flutter/material.dart';
import '../../../../../core/constants/app_colors.dart';

class ScannerControls extends StatelessWidget {
  const ScannerControls({
    required this.onCapture,
    required this.isAnalyzing,
    super.key,
  });

  final VoidCallback onCapture;
  final bool isAnalyzing;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 36),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
            'وجّه الكاميرا نحو طبقك واضغط للتصوير',
            style: TextStyle(fontFamily: 'Cairo', color: Colors.white70, fontSize: 13),
          ),
          const SizedBox(height: 20),
          GestureDetector(
            onTap: isAnalyzing ? null : onCapture,
            child: Container(
              width: 76,
              height: 76,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Colors.white, width: 4),
                color: AppColors.primary,
              ),
              child: isAnalyzing
                  ? const Padding(
                      padding: EdgeInsets.all(20),
                      child: CircularProgressIndicator(color: Colors.white, strokeWidth: 3),
                    )
                  : const Icon(Icons.camera_alt_rounded, color: Colors.white, size: 36),
            ),
          ),
        ],
      ),
    );
  }
}
