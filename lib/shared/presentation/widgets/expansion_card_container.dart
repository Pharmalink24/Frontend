import 'package:expansion_tile_card/expansion_tile_card.dart';
import 'package:flutter/material.dart';
import 'package:pharmalink/core/theme/colors.dart';
import '../../../core/theme/styles.dart';

class ExpansionCardContainer extends StatelessWidget {
  final String title;
  final String? subTitle;
  final List<Widget> children;
  final EdgeInsets margin;
  final EdgeInsets padding;
  final BorderRadiusGeometry borderRadius;

  const ExpansionCardContainer({
    super.key,
    required this.title,
    this.subTitle,
    required this.children,
    this.borderRadius = const BorderRadius.all(Radius.circular(16.0)),
    this.margin = const EdgeInsets.symmetric(vertical: 8.0),
    this.padding = const EdgeInsets.all(12.0),
  });

  Widget _buildChildren() {
    return Padding(
      padding: padding,
      child: Column(
        children: children,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ExpansionTileCard(
      title: Text(
        title,
        style: AppTextStyle.titleLarge(context),
      ),
      subtitle: subTitle != null? Text(
        subTitle ?? '',
        style: AppTextStyle.bodyMedium(context),
      ):null,
      initialPadding: margin,
      finalPadding: margin,
      baseColor: context.colorScheme.primaryContainer,
      expandedColor: context.colorScheme.primaryContainer,
      borderRadius: borderRadius,
      children: [
        _buildChildren(),
      ],
    );
  }
}
