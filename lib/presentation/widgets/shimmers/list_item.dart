import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class ListItem extends StatelessWidget {
  final int index;
  const ListItem({required this.index});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      margin: EdgeInsets.all(10.sp),
      child: InkWell(
        splashColor: Colors.orangeAccent,
        onTap: () {},
        child: Padding(
          padding: EdgeInsets.all(8.sp),
          child: ListTile(
            title: Text(''),
            subtitle: Text(
              '',
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ),
      ),
    );
  }
}
