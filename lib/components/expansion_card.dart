import 'package:banking_app/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ExpansionCard extends StatelessWidget {
  final bool selectedState;
  final String trailing;
  final String leading;
  final List<Widget> children;
  final void Function(bool) onExpansionChanged;

  ExpansionCard({
    @required this.selectedState,
    @required this.trailing,
    @required this.leading,
    @required this.children,
    @required this.onExpansionChanged,
  });

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      key: new Key(selectedState.toString()),
      initiallyExpanded: selectedState == true,
      onExpansionChanged: onExpansionChanged,
      collapsedBackgroundColor: AppColors.light,
      title: Text(""),
      trailing: Text(
        trailing,
        style: TextStyle(fontSize: 20),
      ),
      maintainState: true,
      backgroundColor: AppColors.light,
      leading: Text(
        leading,
        style: TextStyle(
          fontSize: 20,
        ),
      ),
      children: children,
    );
  }
}
