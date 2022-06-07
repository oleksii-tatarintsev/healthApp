import 'package:flutter/material.dart';
import 'package:healthapp/shared/style/export.dart';

class MCChoice extends StatefulWidget {
  final List<String> options;
  final String? selectedOption;
  final bool shrinkWrap;

  final ValueChanged<String> onChanged;

  const MCChoice({
    required this.options,
    required this.onChanged,
    this.shrinkWrap = false,
    this.selectedOption,
    Key? key,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _MCChoice();
  }
}

class _MCChoice extends State<MCChoice> {
  int _selected = 0;

  @override
  void initState() {
    if (widget.selectedOption != null) {
      for (int index = 0; index < widget.options.length; index++) {
        if (widget.options[index] == widget.selectedOption) {
          _selected = index;
        }
      }
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return widget.shrinkWrap
        ? Wrap(
            spacing: 10,
            runSpacing: 10,
            children: _buildOptions(),
          )
        : Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: _buildOptions(),
          );
  }

  List<Widget> _buildOptions() {
    final List<Widget> widgets = [];
    for (int index = 0; index < widget.options.length; index++) {
      widgets.add(_optionButton(index));
    }

    return widgets;
  }

  Widget _optionButton(int index) {

    return ChoiceChip(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(8.0)),
      ),
      label: Container(
        padding: EdgeInsets.symmetric(
          vertical: 15,
          horizontal: 5,
        ),
        constraints: widget.shrinkWrap
            ? null
            : BoxConstraints(
                minHeight: 44.0,
                minWidth: 44.0,
              ),
        child: Text(
          widget.options[index],
          style: MCTextStyles.black12Medium500,
        ),
      ),
      labelStyle: _selected == index ? MCTextStyles.black12Medium500 : null,
      backgroundColor: MCColors.lightViolet,
      selectedColor: MCColors.violet,
      selected: index == _selected,
      onSelected: (bool selected) {
        setState(
          () {
            _selected = index;
          },
        );
        widget.onChanged(widget.options[index]);
      },
    );
  }
}
