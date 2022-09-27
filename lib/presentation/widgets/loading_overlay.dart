import 'package:flutter/material.dart';
import 'package:notesgram/theme/resources.dart';

class LoadingOverlay extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(
        color: Resources.color.indigo700,
      ),
    );
  }
}
