import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../app_pages/input.dart';
import '../localization/methods.dart';
import 'constants.dart'; // Ensure you have screen_util imported

class BasicAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  const BasicAppBar(this.title, {Key? key}) : super(key: key);

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: blue3,
      title: Text(title, style: TextStyle(fontSize: 21.sp)),
    );
  }
}

class InExAppBar extends StatelessWidget implements PreferredSizeWidget {
  final bool isInputPage;
  const InExAppBar(this.isInputPage, {Key? key}) : super(key: key);

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    Tab appBarTab(String title) => Tab(
      child: Container(
        width: double.infinity,
        height: double.infinity,
        child: Align(
          alignment: Alignment.center,
          child: Text(
            getTranslated(context, title) ?? title, // Add fallback to title
            style: TextStyle(fontSize: 19.sp),
          ),
        ),
      ),
    );

    return AppBar(
      backgroundColor: blue2,
      title: TabBar(
        unselectedLabelColor: Colors.white,
        indicatorSize: TabBarIndicatorSize.tab,
        indicator: BoxDecoration(
          borderRadius: BorderRadius.circular(50.r),
          color: Color.fromRGBO(82, 179, 252, 1),
        ),
        tabs: [
          appBarTab('EXPENSE'),
          appBarTab('INCOME'),
        ],
      ),
      actions: isInputPage
          ? [
        IconButton(
          icon: Icon(Icons.check, size: 28),
          onPressed: () {
            saveInputFunc(context, true);
          },
        ),
      ]
          : null,
    );
  }
}

class CategoryAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Widget editCategory;
  const CategoryAppBar(this.editCategory, {Key? key}) : super(key: key);

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: blue3,
      actions: [
        Padding(
          padding: EdgeInsets.only(right: 20.w),
          child: GestureDetector(
            behavior: HitTestBehavior.translucent,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => editCategory),
              );
            },
            child: Row(
              children: [
                Icon(Icons.edit, size: 19.sp),
                SizedBox(width: 3.w),
                Text(
                  getTranslated(context, 'Edit') ?? 'Edit', // Add fallback to 'Edit'
                  style: TextStyle(fontSize: 19.sp),
                ),
              ],
            ),
          ),
        ),
      ],
      title: Text(
        getTranslated(context, 'Category') ?? 'Category', // Add fallback to 'Category'
        style: TextStyle(fontSize: 21.sp),
      ),
    );
  }
}

class EditCategoryAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Widget addCategory;
  const EditCategoryAppBar(this.addCategory, {Key? key}) : super(key: key);

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: blue3,
      actions: [
        Padding(
          padding: EdgeInsets.only(right: 5.w),
          child: TextButton(
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => addCategory),
            ),
            child: Text(
              getTranslated(context, 'Add') ?? 'Add', // Add fallback to 'Add'
              style: TextStyle(fontSize: 18.5.sp, color: Colors.white),
            ),
          ),
        ),
      ],
      title: Text(
        getTranslated(context, 'Edit Category') ?? 'Edit Category', // Add fallback to 'Edit Category'
        style: TextStyle(fontSize: 21.sp),
      ),
    );
  }
}
