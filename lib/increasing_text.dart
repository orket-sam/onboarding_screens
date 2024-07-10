import 'package:flutter/material.dart';

class IncreasingText extends StatefulWidget {
  final double value;
  const IncreasingText({required this.value, super.key});

  @override
  State<IncreasingText> createState() => _IncreasingTextState();
}

class _IncreasingTextState extends State<IncreasingText>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(
        milliseconds: 900,
      ),
    );

    _animation = Tween<double>(begin: 0, end: widget.value).animate(_controller)
      ..addListener(() {
        setState(() {});
      });

    WidgetsBinding.instance.addPostFrameCallback((timestamp) {
      Future.delayed(
        const Duration(seconds: 1),
      ).then((_) => _controller.forward());
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          _animation.value.toInt().toString(),
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
    );
  }
}
