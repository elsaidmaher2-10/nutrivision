import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../widgets/scanner_top_bar.dart';
import '../widgets/scanner_frame_overlay.dart';
import '../widgets/scanner_controls.dart';

class MealScannerView extends StatefulWidget {
  const MealScannerView({super.key});

  @override
  State<MealScannerView> createState() => _MealScannerViewState();
}

class _MealScannerViewState extends State<MealScannerView> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  bool _flash = false;
  bool _analyzing = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: const Duration(seconds: 2))..repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _capture() {
    setState(() => _analyzing = true);
    Future.delayed(const Duration(milliseconds: 1200), () {
      if (mounted) {
        setState(() => _analyzing = false);
        context.push('/meal-details', extra: 'طبق كشري مصري متوسط');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          children: [
            ScannerTopBar(flashOn: _flash, onToggleFlash: () => setState(() => _flash = !_flash), onClose: () => context.pop()),
            Expanded(
              child: Center(
                child: AnimatedBuilder(
                  animation: _controller,
                  builder: (context, child) => ScannerFrameOverlay(scanProgress: _controller.value),
                ),
              ),
            ),
            ScannerControls(onCapture: _capture, isAnalyzing: _analyzing),
          ],
        ),
      ),
    );
  }
}
