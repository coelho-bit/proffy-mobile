import 'package:flutter/material.dart';
import 'package:mobile/fonts/fontStyles.dart';

class Filter extends StatefulWidget {
  final List<String> items;
  final String filterLabel;
  final Function setData;

  Filter({ this.items, this.filterLabel, this.setData });

  @override
  _FilterState createState() => _FilterState();
}

class _FilterState extends State<Filter> {
  String _dropDownValue;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(widget.filterLabel, style: CustomFontStyles.filterItemLabel,),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.0),
            color: Color(0xffFAFAFC)
          ),
          padding: EdgeInsets.symmetric(horizontal: 10.0),
          child: DropdownButtonHideUnderline(
            child: DropdownButton(
              hint: _dropDownValue == null
                  ? Text('Selecione', style: CustomFontStyles.filterHint)
                  : Text(
                      _dropDownValue,
                    ),
              isExpanded: true,
              iconSize: 30.0,
              items: widget.items.map(
                (val) {
                  return DropdownMenuItem<String>(
                    value: val,
                    child: Text(val),
                  );
                },
              ).toList(),
              onChanged: (val) {
                widget.setData(val);
                setState(
                  () {
                    _dropDownValue = val;
                  },
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
