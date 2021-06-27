import 'package:flutter/material.dart' hide RefreshIndicator;
import 'package:flutter/material.dart' as material show RefreshIndicator;
import 'package:takasburada/constants/constants.dart';

class RefreshIndicator extends StatelessWidget {
  final RefreshCallback onRefresh;
  final Widget child;
  const RefreshIndicator({
    Key? key,
    required this.onRefresh,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return material.RefreshIndicator(
      onRefresh: onRefresh,
      backgroundColor: refreshIndicatorBackgroundColor,
      color: refreshIndicatorIconColor,
      displacement: refreshIndicatorDisplacement,
      strokeWidth: refreshIndicatorStrokeWidth,
      child: child,
    );
  }
}
