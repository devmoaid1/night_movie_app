import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class HeaderBar extends StatelessWidget implements PreferredSizeWidget {
  const HeaderBar({
    Key? key,
    required this.page,
  }) : super(key: key);

  final String page;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      backgroundColor: Colors.black.withOpacity(0.3),
      leading: InkWell(
        onTap: () => Get.back(),
        child: Icon(Icons.arrow_back_ios, color: Colors.white, size: 25.sp),
      ),
      title: Text(
        "$page Movies",
        style: TextStyle(color: Colors.white, fontSize: 16.sp),
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size(Get.width, 80.h);
}
