import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';

class MyLoading extends StatefulWidget {
  const MyLoading({Key? key}) : super(key: key);

  @override
  State<MyLoading> createState() => _MyLoadingState();
}

class _MyLoadingState extends State<MyLoading> with SingleTickerProviderStateMixin {
  late final _ctrl = AnimationController(vsync: this, duration: const Duration(seconds: 1));

  @override
  void initState() {
    super.initState();
    _ctrl.repeat();
  }

  @override
  void dispose() {
    _ctrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 2.5, sigmaY: 2.5),
        child: Container(
          color: Colors.white10,
          child: AnimatedBuilder(
            animation: _ctrl,
            builder: (context, child) {
              return Stack(
                children: [
                  Center(
                    child: SizedBox(
                      height: 52,
                      width: 52,
                      child: Transform.rotate(
                        angle: Tween<double>(begin: 0.0, end: pi / 0.5).animate(CurvedAnimation(parent: _ctrl, curve: Curves.decelerate)).value,
                        // angle: pi / 0.5,
                        child: const CircularProgressIndicator(
                          strokeWidth: 1,
                          value: 0.75,
                        ),
                      ),
                    ),
                  ),
                  Center(
                    child: SizedBox(
                      height: 42,
                      width: 42,
                      child: Transform.rotate(
                        angle: Tween<double>(begin: pi / 0.5, end: 0.0).animate(CurvedAnimation(parent: _ctrl, curve: Curves.decelerate)).value,
                        child: const CircularProgressIndicator(
                          strokeWidth: 1,
                          value: 0.65,
                        ),
                      ),
                    ),
                  ),
                  Center(
                    child: SizedBox(
                      height: 32,
                      width: 32,
                      child: Transform.rotate(
                        angle: Tween<double>(begin: 0.0, end: pi / 0.5).animate(CurvedAnimation(parent: _ctrl, curve: Curves.decelerate)).value,
                        child: const CircularProgressIndicator(
                          strokeWidth: 1,
                          value: 0.65,
                        ),
                      ),
                    ),
                  ),
                  Center(
                    child: SizedBox(
                      height: 22,
                      width: 22,
                      child: Transform.rotate(
                        angle: Tween<double>(begin: 0.0, end: -pi / 0.5).animate(CurvedAnimation(parent: _ctrl, curve: Curves.decelerate)).value,
                        child: const CircularProgressIndicator(
                          strokeWidth: 1,
                          value: 0.75,
                        ),
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
