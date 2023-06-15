import 'package:flutter/material.dart';

class BuildSweeped extends StatefulWidget {
  /// Size Sweeped Animation Width [width] .
  final double? width;

  /// Size Sweeped Animation Height [height] .
  final double? height;

  /// Color Sweeped Animation Color [colorSweeped] .
  final Color? sweepedColor;

  /// Color Animation Progress circle [progressCircle] .
  final Color? backroudCircleColor;

  /// Value Circle And [borderRadiusSweeped] White Sweeped Animation .
  final double? borderRadius;

  /// Animation Sweeped Value [sweepedPosition] .
  final double? sweepedPosition;

  /// Visibility Show And Hide Progress circle [progressCircle] .
  final bool? hideIcon;

// -----------------------------------------------

  const BuildSweeped(
      {
      /// Default Size Sweeped Width [width] .
      this.width,

      /// Default Size Sweeped Height [height] .
      this.height,

      /// Default Color Sweeped  [colorSweeped] .
      this.sweepedColor,

      /// Default Color Animation Progress circle [progressCircle] .
      this.backroudCircleColor,

      /// Default BorderRadius White Sweeeped [borderRadiusSweeped] .
      this.borderRadius,

      /// Animation Sweeped Value [colorSweeped] .
      this.sweepedPosition,

      /// Default Show And Hide Progress circle [visibility] .
      this.hideIcon = false,

// ----------------------------------------

      super.key});

  @override
  State<BuildSweeped> createState() => _BuildSweepedState();
}

class _BuildSweepedState extends State<BuildSweeped>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  @override
  initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(milliseconds: 700),
      vsync: this,
    )..repeat(reverse: true);
    _animation = CurvedAnimation(parent: _controller, curve: Curves.easeIn);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 50),
      curve: Curves.linear,
      width: widget.sweepedPosition!,
      height: widget.height!,
      decoration: BoxDecoration(
        color: widget.sweepedColor!,
        borderRadius: BorderRadius.circular(widget.borderRadius!),
      ),
      child: Visibility(
        visible: widget.hideIcon!,
        child: Stack(
          alignment: Alignment.centerRight,
          children: [
            FadeTransition(
              opacity: (widget.sweepedPosition! == widget.height!)
                  ? _animation
                  : Tween<double>(begin: 1, end: 1).animate(_controller),
              child: Container(
                width: widget.height!,
                height: widget.height!,
                decoration: BoxDecoration(
                  color: widget.sweepedColor!,
                  borderRadius: BorderRadius.circular(
                    widget.borderRadius!,
                  ),
                ),
                child: Icon(
                  Icons.chevron_right_rounded,
                  size: widget.height! / 1.5,
                  color: widget.backroudCircleColor!,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
