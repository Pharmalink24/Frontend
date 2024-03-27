import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';

class FormSearchField extends StatefulWidget {
  final InputDecoration? decoration;
  final String? labelText;
  final FutureOr<List> Function(String search) suggestionsCallback;
  final TextEditingController? controller;
  const FormSearchField({
    super.key,
    this.decoration,
    this.labelText,
    required this.suggestionsCallback,
    this.controller,
  });

  @override
  State<FormSearchField> createState() => _FormSearchFieldState();
}

class _FormSearchFieldState extends State<FormSearchField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      child: TypeAheadField(
        controller: widget.controller,
        hideOnEmpty: true,
        hideOnLoading: true,
        suggestionsCallback: widget.suggestionsCallback,
        builder: (context, controller, focusNode) {
          return TextField(
            controller: controller,
            focusNode: focusNode,
            decoration: widget.decoration?.copyWith(
              labelText: widget.labelText,
            ),
          );
        },
        itemBuilder: (context, drugEyeSearchResponse) {
          return ListTile(
            title: Text(drugEyeSearchResponse.commercialName),
            subtitle: Text(drugEyeSearchResponse.commercialName),
          );
        },
        onSelected: (drug) {},
        loadingBuilder: (context) => const Text('Loading...'),
        errorBuilder: (context, error) => const Text('Error!'),
        emptyBuilder: (context) => const Text('No items found!'),
      ),
    );
  }
}
