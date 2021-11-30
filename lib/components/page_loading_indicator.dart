import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class PageLoadingIndicator extends StatelessWidget {
  final bool statusState;
  final double opacity;
  final Widget child;

  PageLoadingIndicator(
      {this.statusState, this.opacity = 0.70, @required this.child});
  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
        child: child,
        inAsyncCall:
            statusState, //if onlineStatus == true shows the loading modal
        opacity: opacity);
  }
}
