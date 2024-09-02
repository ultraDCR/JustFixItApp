import 'package:flutter/material.dart';
import 'package:just_fix_it/core/theme/dimens.dart';

class BasicCard extends StatelessWidget {
  const BasicCard({
    super.key,
    required this.child,
    this.childPadding,
    this.borderRadius,
  });

  final Widget child;
  final BorderRadius? borderRadius;
  final EdgeInsetsGeometry? childPadding;

  @override
  Widget build(BuildContext context) {
    final contentChild = Padding(
      padding: childPadding ?? const EdgeInsets.all(Dimens.spacing),
      child: child,
    );

    return Card(
      surfaceTintColor: Colors.transparent,
      margin: EdgeInsets.zero,
      shape: RoundedRectangleBorder(
        borderRadius: borderRadius ?? BorderRadius.circular(Dimens.radius),
      ),
      child: contentChild,
    );
  }
}
