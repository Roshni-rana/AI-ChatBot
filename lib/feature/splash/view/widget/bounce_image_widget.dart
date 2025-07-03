import 'package:flutter/material.dart';

class BounceImage extends StatefulWidget {
  final String imagePath;
  const BounceImage({super.key, required this.imagePath});

  @override
  State<BounceImage> createState() => _BounceImageState();
}

class _BounceImageState extends State<BounceImage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _bounceAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    )..repeat(reverse: true);

    _bounceAnimation = Tween<double>(
      begin: 0,
      end: -20,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _bounceAnimation,
      builder: (context, child) {
        return Transform.translate(
          offset: Offset(0, _bounceAnimation.value),
          child: Image.asset(widget.imagePath, height: 250),
        );
      },
    );
  }
}
