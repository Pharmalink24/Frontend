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
  final int flex;
  final bool isScrollable;

  const CardContainerWithTitle({
    super.key,
    required this.title,
    required this.child,
    this.iconButton = const SizedBox.shrink(),
    this.padding = const EdgeInsets.all(12.0),
    this.margin = const EdgeInsets.symmetric(vertical: 8.0),
    this.textStyle,
    this.flex = 4,
    this.isScrollable = true,
  });

  Widget _buildTitle(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: textStyle ?? AppTextStyle.headlineMedium(context),
        ),
        iconButton
      ],
    );
  }

  Widget _buildContent(BuildContext context) {
    Widget childWithPadding = Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0),
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
        Expanded(
          flex: 1,
          child: _buildTitle(context),
        ),
        Expanded(
          flex: flex,
          child: _buildContent(context),
        ),
      ],
    );
  }
}
