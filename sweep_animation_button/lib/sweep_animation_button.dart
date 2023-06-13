// ignore_for_file: unrelated_type_equality_checks, avoid_print
library sweep_animation_button;

import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'src/widget/build_progress_circle.dart';
import 'src/widget/build_sweeped.dart';

class SweepAnimationButton extends StatefulWidget {
  /// Size Backround Width [width] .
  final double? width;

  /// Size Backround Height [height] .
  final double? height;

  /// Color Backround [colorBackround] .
  final Color? backroundColor;

  /// Color BackroundAnimation [colorBackroundAnimation] .
  final Color? animationColor;

  /// Color Animation Progress Value [animationProgress] .
  final Color? animationProgressColor;

  /// Build Widget of Backroud [child] .
  final Widget? child;

  /// Value Circle And [borderRadiusBackround] White Backround .
  final double? borderRadius;

  /// Function OnTap Type [functionOnTap] .
  final VoidCallback? onTap;

  /// Value Animation Duration Circle [circleDurationValue] .
  final double? durationCircle;

  /// Visibility Show And Hide Progress circle [progressCircle] .
  final bool? hideIcon;

// -----------------------------------------------------------

  const SweepAnimationButton(
      {
      /// Default Size Width Backround [width] .
      this.width = 250,

      /// Default Size Height Backround [height] .
      this.height = 50,

      /// Default Color Backround [colorBackround] .
      this.backroundColor =  const Color(0xFFDCEDC8),

      /// Default Color Sweeped Animation [colorSweepedAnimation] .
      this.animationColor = Colors.lightGreen,

      /// Default Color Animation Progress Value [animationProgress] .
      required this.animationProgressColor,

      /// Default Child Widget [child] .
      this.child = const Text(""),

      /// Default BorderRadius White Backround [borderRadiusBackround] .
      required this.borderRadius,

      /// Default Function OnTap Type [functionOnTap] .
      required this.onTap,

      /// Default Value Animation Duration Circle [circleDurationValue] .
      this.durationCircle = 5,

      /// Default Show And Hide Progress circle [visibility] .
      this.hideIcon = false,

// ---------------------------------------------------------------

      super.key});

  @override
  State<SweepAnimationButton> createState() => _SweepAnimationButtonState();
}

class _SweepAnimationButtonState extends State<SweepAnimationButton>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> animation;
  @override
  void initState() {
    controller = AnimationController(
        vsync: this,
        duration: Duration(seconds: widget.durationCircle!.toInt()));
    animation = Tween<double>(begin: 0, end: 1).animate(controller)
      ..addListener(() {
        setState(() {
          if (controller.isCompleted) {
            autoClicked();
          }
        });
      });
    autoClicked();
    soliderSweepedValue = widget.height!;
    super.initState();
  }

  void autoClicked() {
    if (controller.isCompleted) {
      onTapEnd.call();
    }
  }

  Function() get onTapEnd => widget.onTap!;
  late double soliderSweepedValue;
  bool visibility = false;
  sweepedDownDetector(double sweepedPosition) {
    
    if (sweepedPosition > widget.width!) {
      sweepedPosition = widget.width!;
    }
    if (sweepedPosition < widget.height!) {
      sweepedPosition = widget.height!;
      soliderSweepedValue = widget.height!;
    }
    print("New Pose : ${sweepedPosition.toInt()}");
    setState(() {
      soliderSweepedValue = sweepedPosition;
    });

    if (soliderSweepedValue == widget.width!) {
      controller.forward();
    }
    if (soliderSweepedValue == widget.height!) {
      soliderSweepedValue = widget.height!;
    }
  }

  @override
  Widget build(BuildContext context) {
   
    return Stack(
      alignment: Alignment.center,
      children: [
        GestureDetector(
          onTapDown: (details) => sweepedDownDetector(details.localPosition.dx),
          onHorizontalDragStart: (details) =>
              sweepedDownDetector(details.localPosition.dx),
          onHorizontalDragUpdate: (details) =>
              sweepedDownDetector(details.localPosition.dx),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 1000),
            curve: Curves.fastOutSlowIn,
            width: (soliderSweepedValue < widget.width!)
                ? widget.width!
                : widget.width! / math.pi - widget.height!,
            height: widget.height!,
            decoration: BoxDecoration(
              color: widget.backroundColor!,
              borderRadius: BorderRadius.circular(widget.borderRadius!),
            ),
            child: Stack(
              children: [
                Align(child: FittedBox(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 40),
                    child: widget.child!,
                  ),
                )),
                BuildSweeped(
                  sweepedPosition: soliderSweepedValue,
                  width: widget.width!,
                  height: widget.height!,
                  sweepedColor: widget.animationColor!,
                  backroudCircleColor: widget.backroundColor!,
                  borderRadius: widget.borderRadius!,
                  hideIcon: widget.hideIcon!,
                ),
              ],
            ),
          ),
        ),
        BuildProgressCircle(
          valueAnimation: animation.value,
          animationProgressColor: widget.animationProgressColor,
          backroudCircleColor: widget.animationColor!,
          borderRadius: widget.borderRadius!,
          height: widget.height!,
          width: widget.width!,
          onTap: onTapEnd,
          sweepedWidth: widget.width!,
          sweepedPosition: soliderSweepedValue,
        ),
      ],
    );
  }
}
