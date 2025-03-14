import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:smart_coupons/db/app_database.dart';
import 'package:smart_coupons/pages/coupons/coupons_page.dart';
import 'package:smart_coupons/pages/categories/widgets/categories_bottom_sheet_widget.dart';

class CategoriesItem extends StatelessWidget {
  final Category couponCategory;
  final Color bgColor;
  final Color textColor;

  const CategoriesItem({
    super.key,
    required this.couponCategory,
    required this.bgColor,
    required this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return IntrinsicWidth(
      child: InkWell(
        onLongPress: () => showCategoryOptions(
          context,
          couponCategory,
        ),
        splashColor: Colors.transparent,
        onTap: () {
          Navigator.push(
            context,
            MaterialWithModalsPageRoute(
              builder: (BuildContext context) => CouponsPage(
                categoryId: couponCategory.id,
                title: couponCategory.title,
              ),
            ),
          );
        },
        borderRadius: BorderRadius.circular(8),
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: 36,
            vertical: 24,
          ),
          height: 92,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(8),
            ),
            color: textColor.withOpacity(0.1),
          ),
          child: Align(
            alignment: Alignment.center,
            child: Text(
              softWrap: false,
              maxLines: 2,
              couponCategory.title,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: bgColor,
                fontSize: 15,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
