import 'package:flutter/material.dart';
import 'package:lojaflutter/config/config.dart';

class SearchDialog extends StatelessWidget {
  final String initialText;
  const SearchDialog({this.initialText});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Positioned(
          top: 2,
          left: 4,
          right: 4,
          child: Card(
            child: TextFormField(
              initialValue: initialText,
              textInputAction: TextInputAction.search,
              autofocus: true,
              cursorColor: secondaryColor,
              decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: const EdgeInsets.symmetric(vertical: 15),
                prefixIcon: IconButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: Icon(
                    Icons.arrow_back,
                    color: secondaryColor,
                  ),
                ),
              ),
              onFieldSubmitted: (text) {
                Navigator.of(context).pop(text);
              },
            ),
          ),
        ),
      ],
    );
  }
}
