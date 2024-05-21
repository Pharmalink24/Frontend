import 'package:flutter/material.dart';
import '../theme/styles.dart';

import 'card_container.dart';

class CardContainerWithTitle extends StatelessWidget {
  final String title;
  final Widget child;
  final Widget iconButton;
  final TextStyle? textStyle;
  final EdgeInsets padding;
  final EdgeInsets margin;
  final bool isScrollable;

  const CardContainerWithTitle({
    super.key,
    required this.title,
    required this.child,
    this.iconButton = const SizedBox.shrink(),
    this.padding = const EdgeInsets.all(12.0),
    this.margin = const EdgeInsets.symmetric(vertical: 8.0),
    this.textStyle,
    this.isScrollable = true,
  });

  Widget _buildTitle(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: textStyle ?? AppTextStyle.titleLarge(context),
        ),
        iconButton
      ],
    );
  }

  Widget _buildContent(BuildContext context) {
    Widget childWithPadding = Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: child,
    );

    return isScrollable
        ? SingleChildScrollView(
            child: childWithPadding,
          )
        : childWithPadding;
  }

  @override
  Widget build(BuildContext context) {
    return CardContainer(
      mainAxisAlignment: MainAxisAlignment.start,
      padding: padding,
      margin: margin,
      children: [
        _buildTitle(context),
        Expanded(
          child: _buildContent(context),
        ),
      ],
    );
  }
}
