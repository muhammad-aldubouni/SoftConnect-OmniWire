import 'package:state_shell/material.dart';
import 'package:omni_wire/core/themeing/themes.dart';
import 'dart:ui';

import 'package:state_shell/state_shell.dart';

class BlurredContainer extends StatelessWidget {
  final Widget child;
  final double blurStrength;
  final BorderRadius borderRadius;

  const BlurredContainer({
    super.key,
    required this.child,
    this.blurStrength = 10.0,
    this.borderRadius = const BorderRadius.all(Radius.circular(16)),
  });

  @override
  Widget build(BuildContext context) {
    var borderColor = EnterpriseColors.selected;
    double borderWidth = 3;
    // 1. Clip the blur effect so it stays inside the container boundaries
    return ClipRRect(
          borderRadius: borderRadius,
          child: BackdropFilter(
            // 2. Define the blur intensity across horizontal and vertical axes
            filter: ImageFilter.blur(
              sigmaX: blurStrength,
              sigmaY: blurStrength,
            ),
            child: Container(
              // 3. Make the background fully transparent (or semi-transparent)

              decoration: BoxDecoration(
                color: EnterpriseColors.glass, // Ultra-translucent white
                borderRadius: borderRadius,
                border: BorderDirectional(
                  top: BorderSide(
                    color: borderColor, // Subtle glass border
                    width: borderWidth,
                  ),
                  end: BorderSide(
                    color: borderColor, // Subtle glass border
                    width: borderWidth,
                  ),
                  start: BorderSide(
                    color: borderColor, // Subtle glass border
                    width: borderWidth,
                  ),
                ),
              ),

              padding: const EdgeInsets.all(16.0),
              child: child,
            ),
          ),
        )
        .animate(onComplete: (controller) => controller.repeat(reverse: true))
        .shimmer(
          duration: 15.seconds,
          color: EnterpriseColors.isDark
              ? EnterpriseColors.panel.withAlpha(170)
              : EnterpriseColors.textMuted.withAlpha(50),
        );
  }
}
