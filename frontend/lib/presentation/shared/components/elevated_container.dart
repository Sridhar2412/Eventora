import 'package:flutter/material.dart';

class ElevatedContainer extends StatelessWidget {
  const ElevatedContainer({
    super.key,
    this.padding,
    this.height,
    this.width,
    this.margin,
    this.color,
    this.gradient,
    this.radius,
    required this.child,
  });

  final EdgeInsets? padding;
  final EdgeInsets? margin;
  final Widget child;
  final double? height;
  final double? width;
  final double? radius;
  final Color? color;
  final Gradient? gradient;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      padding: padding,
      margin: margin ?? const EdgeInsets.all(10),
      decoration: ShapeDecoration(
        color: color ?? (gradient != null ? null : Colors.white),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radius ?? 12),
        ),
        gradient: gradient,
        //TODO(sridhar): add the below shadow if required in other pages again
        // shadows: const [
        //   BoxShadow(
        //     color: Color(0xFF273451),
        //     blurRadius: 12,
        //     offset: Offset(8, 8),
        //   )
        // ],
      ),
      child: child,
    );
  }
}
