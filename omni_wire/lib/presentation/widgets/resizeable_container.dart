import 'package:state_shell/material.dart';

class ResizableContainer extends StatefulWidget {
  final Widget child;
  final Decoration decoration;
  const ResizableContainer({
    super.key,
    required this.child,
    required this.decoration,
  });

  @override
  State<ResizableContainer> createState() => _ResizableContainerState();
}

class _ResizableContainerState extends State<ResizableContainer> {
  // 1. Store dimensions in state

  // Minimum and maximum boundaries
  double minWidth = 300.0;
  double width = 300.0;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // The main content container
        Container(
          width: width,

          decoration: widget.decoration,
          child: widget.child,
        ),

        // 2. The draggable corner handle
        Positioned(
          child: Align(
            alignment: AlignmentGeometry.xy(-1, 0),
            child: GestureDetector(
              onPanUpdate: (details) {
                setState(() {
                  // Update width and height based on touch drag movement
                  width = (width - details.delta.dx).clamp(
                    minWidth,
                    double.infinity,
                  );
                });
              },
              child: Padding(
                padding: const EdgeInsets.only(top: 40.0),
                child: MouseRegion(
                  cursor: SystemMouseCursors.resizeLeftRight,
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.8,
                    width: 10,
                    color: Colors.transparent,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
