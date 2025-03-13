import 'dart:io';
import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:smart_coupons/model/image_source_model.dart';
import 'package:smart_coupons/pages/coupons/bloc/coupon_bloc.dart';
import 'package:smart_coupons/pages/coupons/widgets/coupons_bottom_sheet_widgets.dart';
import 'package:smart_coupons/theme/colors.dart';
import 'package:smart_coupons/widget/format_date.dart';

class CouponsPage extends StatelessWidget {
  final String categoryId;
  final String title;

  const CouponsPage({
    super.key,
    required this.categoryId,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CouponBloc()
        ..add(
          LoadCoupons(categoryId: categoryId),
        ),
      child: CouponsPageBody(
        title: title,
        categoryId: categoryId,
      ),
    );
  }
}

class CouponsPageBody extends StatefulWidget {
  final String categoryId;
  final String title;

  const CouponsPageBody({
    super.key,
    required this.categoryId,
    required this.title,
  });

  @override
  State<CouponsPageBody> createState() => _CouponsPageBodyState();
}

class _CouponsPageBodyState extends State<CouponsPageBody> {
  @override
  Widget build(BuildContext context) {
    return CupertinoTheme(
      data: CupertinoThemeData(
        primaryColor: primaryColor,
      ),
      child: CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          previousPageTitle: 'Back',
          middle: Text(widget.title),
          trailing: IconButton(
            onPressed: () => showCouponAddBottomSheet(
              context,
              widget.categoryId,
            ),
            icon: Icon(
              CupertinoIcons.add,
              color: primaryColor,
            ),
          ),
        ),
        child: Material(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: CustomScrollView(
              slivers: [
                SliverFillRemaining(
                  child: BlocBuilder<CouponBloc, CouponState>(
                    builder: (context, state) {
                      if (state.status == CouponStatus.initial ||
                          state.status == CouponStatus.loading) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                      if (state.status == CouponStatus.error) {
                        return Center(
                          child: Text("Ошибка"),
                        );
                      }
                      if (state.coupons.isNotEmpty) {
                        return Column(
                          children: [
                            Expanded(
                              child: GridView.builder(
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  crossAxisSpacing: 16,
                                  mainAxisSpacing: 16,
                                  childAspectRatio: 1,
                                ),
                                itemCount: state.coupons.length,
                                itemBuilder: (context, index) {
                                  final coupon = state.coupons[index];
                                  return InkWell(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(24),
                                    ),
                                    onTap: () => showCouponEditBottomSheet(
                                      context: context,
                                      categoryId: widget.categoryId,
                                      coupon: coupon,
                                    ),
                                    child: Container(
                                      height: 164,
                                      width: 164,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(24),
                                        ),
                                      ),
                                      child: Stack(
                                        children: [
                                          Positioned.fill(
                                            child: ClipRRect(
                                              borderRadius:
                                                  const BorderRadius.all(
                                                Radius.circular(24),
                                              ),
                                              child: switch (
                                                  coupon.imageSource) {
                                                LocalImageSourceModel(
                                                  :final path
                                                ) =>
                                                  Image.file(
                                                    File(path),
                                                    fit: BoxFit.cover,
                                                  ),
                                                NetworkImageSourceModel(
                                                  :final url
                                                ) =>
                                                  CachedNetworkImage(
                                                    imageUrl: url,
                                                    placeholder:
                                                        (context, url) =>
                                                            Center(
                                                      child:
                                                          const CircularProgressIndicator(),
                                                    ),
                                                    errorWidget:
                                                        (context, url, error) =>
                                                            const Image(
                                                      fit: BoxFit.cover,
                                                      image: AssetImage(
                                                          'assets/images/coupon_isempty.png'),
                                                    ),
                                                    fit: BoxFit.cover,
                                                  ),
                                              },
                                            ),
                                          ),
                                          Positioned(
                                            left: 12,
                                            right: 12,
                                            bottom: 4,
                                            child: Center(
                                              child: ClipRRect(
                                                borderRadius: BorderRadius.all(
                                                  Radius.circular(12),
                                                ),
                                                child: BackdropFilter(
                                                  filter: ImageFilter.blur(
                                                      sigmaX: 4, sigmaY: 4),
                                                  child: Container(
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                      horizontal: 12,
                                                    ),
                                                    height: 39,
                                                    decoration: BoxDecoration(
                                                      color: Colors.white
                                                          .withOpacity(0.8),
                                                      borderRadius:
                                                          BorderRadius.all(
                                                        Radius.circular(12),
                                                      ),
                                                    ),
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.min,
                                                      children: [
                                                        Flexible(
                                                          child: Text(
                                                            coupon.name,
                                                            style: TextStyle(
                                                              overflow:
                                                                  TextOverflow
                                                                      .ellipsis,
                                                              color:
                                                                  Colors.black,
                                                              fontSize: 15,
                                                            ),
                                                          ),
                                                        ),
                                                        Text(
                                                          formatDate(
                                                              coupon.date),
                                                          style: TextStyle(
                                                            color: Color(
                                                                    0xff000000)
                                                                .withOpacity(
                                                                    0.6),
                                                            fontSize: 12,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ],
                        );
                      }
                      return Material(
                        child: Center(
                          child: InkWell(
                            borderRadius: BorderRadius.all(Radius.circular(24)),
                            onTap: () => showCouponAddBottomSheet(
                              context,
                              widget.categoryId,
                            ),
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 48, vertical: 24),
                              decoration: BoxDecoration(
                                color: primaryColor.withOpacity(0.1),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(24)),
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SvgPicture.asset(
                                    'assets/images/coupon_icon.svg',
                                    width: 32,
                                    height: 32,
                                  ),
                                  const Gap(10),
                                  Text(
                                    'Add New\nCoupon',
                                    style: TextStyle(
                                      color: primaryColor,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                      height: 1.2,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
