import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:smart_coupons/model/coupon_model.dart';
import 'package:smart_coupons/pages/coupons/add_or_edit_coupon_page.dart';

import '../bloc/coupon_bloc.dart';

void showCouponAddBottomSheet(
  BuildContext context,
  String categoryId,
) async {
  // final coupon = await showCupertinoSheet(
  //   context: context,
  //   pageBuilder: (_) => BlocProvider.value(
  //     value: context.read<CouponBloc>(),
  //     child: AddOrEditCouponPage(),
  //   ),
  // );
  final coupon = await showCupertinoModalBottomSheet(
    context: context,
    isDismissible: true,
    useRootNavigator: false,
    bounce: false,
    backgroundColor: Colors.transparent,
    barrierColor: Colors.black.withOpacity(0.2),
    clipBehavior: Clip.hardEdge,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(
        top: Radius.circular(20),
      ),
    ),
    builder: (_) => BlocProvider.value(
      value: context.read<CouponBloc>(),
      child: AddOrEditCouponPage(),
    ),
  );
  if (coupon == null) return;
  context.read<CouponBloc>().add(
        AddCoupon(
          categoryId: categoryId,
          coupon: coupon,
        ),
      );
}

void showCouponEditBottomSheet({
  required BuildContext context,
  required String categoryId,
  required Coupon coupon,
}) async {
  // final updatedCoupon = await showCupertinoSheet(
  //   context: context,
  //   pageBuilder: (_) => BlocProvider.value(
  //     value: context.read<CouponBloc>(),
  //     child: AddOrEditCouponPage(
  //       existingCoupon: coupon,
  //       categoryId: categoryId,
  //     ),
  //   ),
  // );
  final updatedCoupon = await showCupertinoModalBottomSheet(
    context: context,
    builder: (_) => BlocProvider.value(
      value: context.read<CouponBloc>(),
      child: AddOrEditCouponPage(
        existingCoupon: coupon,
        categoryId: categoryId,
      ),
    ),
  );
  if (updatedCoupon == null) return;
  context.read<CouponBloc>().add(
        EditCoupon(
          categoryId: categoryId,
          updatedCoupon: updatedCoupon,
        ),
      );
}
