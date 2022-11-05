import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TitleRow extends StatelessWidget {
  final void Function()? onTap;
  final String? title;
  const TitleRow({Key? key, this.onTap, this.title = ""}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(vertical: 15.h, horizontal: 10.w),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title!,
              style: TextStyle(
                  fontSize: 18.sp,
                  color: Colors.white,
                  fontWeight: FontWeight.w600),
            ),
            InkWell(
              onTap: onTap ?? () {},
              child: Row(
                children: [
                  Text(
                    "See More",
                    style: TextStyle(fontSize: 14.sp, color: Colors.white),
                  ),
                  Icon(
                    Icons.arrow_forward_ios,
                    size: 14.0.h,
                    color: Colors.white,
                  )
                ],
              ),
            )
          ],
        ));
  }
}
