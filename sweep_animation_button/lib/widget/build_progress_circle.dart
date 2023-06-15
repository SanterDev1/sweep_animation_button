
import 'package:flutter/material.dart';

class BuildProgressCircle extends StatelessWidget {
  /// Size Backround circle [width] .
  final double? width;

  /// Size Backround circle [height] .
  final double? height;

  /// Color Animation Progress circle [progressCircle] .
  final Color? backroudCircleColor;

  /// Color Animation Progress Value [animationProgress] .
  final Color? animationProgressColor;

  /// Value Animation Value [animationValue]
  final double? valueAnimation;

  /// Value Circle And [borderRadiusBackround] White Backround .
  final double? borderRadius;

  /// Function OnTap Type [functionOnTap] .
  final VoidCallback? onTap;

  /// Animation Sweeped Value [sweepedPosition] .
  final double? sweepedPosition;

  /// Size Sweeped Animation Width [width] .
  final double? sweepedWidth;

// ---------------------------------------------------

  const BuildProgressCircle(
      {
      /// Default Size Height progress Circle [height] .
      this.width,

      /// Default Size Height progress Circle [height] .
      this.height,

      /// Default Color Animation Progress circle [progressCircle] .
      this.backroudCircleColor,

      /// Default Value Animation Value [animationValue]
      this.valueAnimation,

      /// Default Color Animation Progress Value [animationProgress] .
      required this.animationProgressColor,

      /// Default BorderRadius White Backround [borderRadiusBackround] .
      required this.borderRadius,

      /// Default Function OnTap Type [functionOnTap] .
      this.onTap,

      /// Animation Sweeped Value [colorSweeped] .
      this.sweepedPosition,

      /// Default Size Sweeped Width [width] .
      this.sweepedWidth,

// -----------------------------------------------------

      super.key});

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: sweepedPosition == width! ? true : false,
      child: Container(
        width: height!,
        height: height!,
        decoration: BoxDecoration(
          color: backroudCircleColor!,
          borderRadius: BorderRadius.circular(borderRadius!),
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            SizedBox(
              width: height! - 15,
              height: height! - 15,
              child: CircularProgressIndicator(
                color: animationProgressColor!,
                value: valueAnimation!,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
