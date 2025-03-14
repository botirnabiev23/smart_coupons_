import 'dart:io';
import 'package:cupertino_calendar_picker/cupertino_calendar_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:smart_coupons/model/coupon_model.dart';
import 'package:smart_coupons/model/image_source_model.dart';
import 'package:smart_coupons/pages/coupons/widgets/add_link_dialog.dart';
import 'package:smart_coupons/pages/coupons/widgets/coupon_delete_dialog.dart';
import 'package:smart_coupons/pages/coupons/widgets/custom_box_widget.dart';
import 'package:smart_coupons/pages/coupons/widgets/image_picker_option.dart';
import 'package:smart_coupons/theme/colors.dart';
import 'package:smart_coupons/widget/show_date_widget.dart';
import 'package:smart_coupons/widget/text_field_widget.dart';
import 'package:uuid/uuid.dart';
import 'package:path/path.dart' as path;

import 'bloc/coupon_bloc.dart';

class AddOrEditCouponPage extends StatefulWidget {
  final Coupon? existingCoupon;
  final String? categoryId;

  const AddOrEditCouponPage({
    super.key,
    this.existingCoupon,
    this.categoryId,
  });

  @override
  State<AddOrEditCouponPage> createState() => _AddOrEditCouponPageState();
}

class _AddOrEditCouponPageState extends State<AddOrEditCouponPage> {
  final ImagePicker _picker = ImagePicker();
  final TextEditingController _couponNameController = TextEditingController();
  final TextEditingController _imageUrlController = TextEditingController();
  File? _image;
  DateTime selectedDate = DateTime.now();
  Coupon? _currentCoupon;

  @override
  void initState() {
    super.initState();
    if (_isEdit) {
      _currentCoupon = widget.existingCoupon;
      selectedDate =
          _currentCoupon != null ? _currentCoupon!.date : DateTime.now();
      _couponNameController.text = widget.existingCoupon!.name;
      final imageSource = widget.existingCoupon!.imageSource;
      imageSource.map(
        local: (localImage) {
          _image = File(localImage.path);
        },
        network: (networkImage) {
          _imageUrlController.text = networkImage.url;
        },
      );
    }
  }

  Future<void> _pickImage(ImageSource source) async {
    final pickedFile = await _picker.pickImage(source: source);
    if (pickedFile == null) return;

    setState(() {
      _image = File(pickedFile.path);
      _imageUrlController.clear();
    });
  }

  bool get _isEdit => widget.existingCoupon != null;

  bool get _isActive =>
      _hasImage && _couponNameController.text.trim().isNotEmpty;

  bool get _hasImage =>
      _image != null || _imageUrlController.text.trim().isNotEmpty;

  Future<Coupon?> _openAddCouponSheet(
    BuildContext context,
  ) async {
    final imageUrl = _imageUrlController.text.trim();
    if (!_hasImage) return null;

    late ImageSourceModel imageSource;
    if (_image != null) {
      final appDir = await getApplicationDocumentsDirectory();
      final String fileName = path.basename(_image!.path);
      final savedImage = await _image!.copy('${appDir.path}/$fileName');
      imageSource = ImageSourceModel.local(savedImage.path);
    } else if (imageUrl.isNotEmpty) {
      imageSource = ImageSourceModel.network(imageUrl);
    } else {
      return null;
    }

    return Coupon(
      id: _isEdit ? widget.existingCoupon!.id : Uuid().v4(),
      name: _couponNameController.text.trim(),
      imageSource: imageSource,
      date: selectedDate,
    );
  }

  bool _isViewOnly = true;

  @override
  Widget build(BuildContext context) {
    return CupertinoTheme(
      data: CupertinoThemeData(
        primaryColor: primaryColor,
      ),
      child: MediaQuery.removePadding(
        removeTop: true,
        removeBottom: true,
        context: context,
        child: CupertinoPageScaffold(
          resizeToAvoidBottomInset: false,
          navigationBar: CupertinoNavigationBar(
            transitionBetweenRoutes: false,
            previousPageTitle: 'Quit',
            middle: Text(
              _isViewOnly
                  ? widget.existingCoupon?.name ?? 'New Coupon'
                  : (_isEdit ? 'Edit Coupon' : 'New Coupon'),
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.w600,
              ),
            ),
            trailing: CupertinoButton(
              padding: EdgeInsets.zero,
              onPressed: () async {
                if (_isEdit) {
                  if (_isViewOnly) {
                    setState(() {
                      _isViewOnly = false;
                    });
                    return;
                  }
                }
                if (_isActive) {
                  final coupon = await _openAddCouponSheet(context);
                  if (coupon != null) {
                    Navigator.pop(context, coupon);
                  }
                }
              },
              child: Text(
                _isEdit && _isViewOnly ? 'Edit' : 'Save',
                style: TextStyle(
                  color: _isActive
                      ? primaryColor
                      : const Color.fromRGBO(220, 220, 221, 1),
                  fontWeight: FontWeight.w600,
                  fontSize: 17,
                ),
              ),
            ),
          ),
          child: Material(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 32,
                vertical: 16,
              ),
              child: Column(
                children: [
                  Expanded(
                    child: SafeArea(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Gap(8),
                          if (_isViewOnly == false || _isEdit == false) ...[
                            TextFieldWidget(
                              controller: _couponNameController,
                              hintText: 'Name',
                              onChanged: (_) => setState(() {}),
                            ),
                            const Gap(24),
                          ],
                          if (_imageUrlController.text.isEmpty &&
                              _image == null) ...[
                            InkWell(
                              splashColor: Colors.transparent,
                              onTap: () => showImagePickerOptions(
                                context,
                                _pickImage,
                              ),
                              borderRadius: BorderRadius.circular(24),
                              child: Container(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 16),
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  color: primaryColor.withOpacity(0.05),
                                  borderRadius: BorderRadius.circular(24),
                                ),
                                child: Column(
                                  children: [
                                    SvgPicture.asset(
                                      'assets/images/add_image_icon.svg',
                                    ),
                                    const SizedBox(height: 8),
                                    Text(
                                      'Add Image',
                                      style: TextStyle(
                                        color: primaryColor,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            const Gap(8),
                            Row(
                              children: [
                                Expanded(
                                  child: Divider(
                                    color: Colors.grey.shade300,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 16.0,
                                  ),
                                  child: Text(
                                    'Or',
                                    style: TextStyle(
                                      color: Colors.grey.shade600,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Divider(
                                    color: Colors.grey.shade300,
                                  ),
                                ),
                              ],
                            ),
                            const Gap(8),
                            InkWell(
                              splashColor: Colors.transparent,
                              onTap: () => showAddLinkDialog(
                                context,
                                _imageUrlController,
                                () => setState(
                                  () {},
                                ),
                              ),
                              borderRadius: BorderRadius.circular(24),
                              child: Container(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 16),
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  color: primaryColor.withOpacity(0.05),
                                  borderRadius: BorderRadius.circular(24),
                                ),
                                child: Column(
                                  children: [
                                    SvgPicture.asset(
                                      'assets/images/link_icon.svg',
                                    ),
                                    const Gap(8),
                                    Text(
                                      'Add Link',
                                      style: TextStyle(
                                        color: primaryColor,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                          if (_imageUrlController.text.isNotEmpty) ...[
                            TextField(
                              controller: _imageUrlController,
                              readOnly: true,
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: primaryColor.withOpacity(0.05),
                                suffixIcon: _isViewOnly
                                    ? null
                                    : CupertinoButton(
                                        padding: EdgeInsets.zero,
                                        onPressed: () => setState(() {
                                          _imageUrlController.clear();
                                        }),
                                        child: Icon(
                                          CupertinoIcons.clear,
                                          color: primaryColor,
                                        ),
                                      ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                  borderSide: BorderSide.none,
                                ),
                              ),
                            ),
                          ],
                          if (_image != null) ...[
                            Stack(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(24),
                                  child: Image.file(
                                    _image!,
                                    width: double.infinity,
                                    height: 164,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                if (_isViewOnly == false)
                                  Positioned(
                                    top: 10,
                                    right: 10,
                                    child: CustomBox(
                                      onPressed: () {
                                        setState(() {
                                          _image = null;
                                        });
                                      },
                                    ),
                                  ),
                              ],
                            ),
                          ],
                          const Gap(24),
                          ShowDateWidget(
                            isViewOnly: _isEdit ? _isViewOnly : false,
                            dateTime: selectedDate,
                            onDateSelected: (BuildContext ctx) async {
                              final RenderBox? renderBox =
                                  ctx.findRenderObject() as RenderBox?;
                              final nowDate = DateTime.now();
                              await showCupertinoCalendarPicker(
                                context,
                                widgetRenderBox: renderBox,
                                minimumDate:
                                    nowDate.subtract(const Duration(days: 0)),
                                initialDate: selectedDate != nowDate
                                    ? selectedDate
                                    : nowDate,
                                maximumDate:
                                    nowDate.add(const Duration(days: 365)),
                                mainColor: Colors.blue,
                                onDateSelected: (date) {
                                  setState(() {
                                    selectedDate = date;
                                  });
                                  Future.delayed(Duration(milliseconds: 200),
                                      () {
                                    if (context.mounted) {
                                      Navigator.pop(context);
                                    }
                                  });
                                },
                              );
                            },
                          ),
                          const Gap(16),
                        ],
                      ),
                    ),
                  ),
                  if (_isEdit) ...[
                    CupertinoButton(
                      padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16), // Adjust padding as needed
                      color: const Color(0xffE40000).withOpacity(0.05),
                      borderRadius: BorderRadius.circular(8),
                      onPressed: () async {
                        final bool? deleteConfirmed = await showDeleteDialog(context);
                        if (deleteConfirmed == true) {
                          context.read<CouponBloc>().add(
                            DeleteCoupon(
                              categoryId: widget.categoryId!,
                              couponId: widget.existingCoupon!.id,
                            ),
                          );
                          Navigator.of(context).pop();
                        }
                      },
                      child: Text(
                        'Delete Coupon',
                        style: TextStyle(
                          fontSize: 16,
                          color: const Color(0xffE40000),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),

                    const Gap(82),
                  ],
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
