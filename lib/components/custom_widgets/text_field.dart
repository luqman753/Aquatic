
import 'package:flutter/material.dart';

import '../../AppTheme.dart';
import '../../size_config.dart';

Widget customTextField(
  context,
  controller,
  hintText,
  labelText,
  keyboardType,
) {
  return TextFormField(
    style: AppTheme.getTextStyle(
      Theme.of(context).textTheme.bodyText1,
    ),
    controller: controller,
    onChanged: (value) {},
    decoration: InputDecoration(
      contentPadding: EdgeInsets.symmetric(horizontal: MySize.size10),
      filled: true,
      hintText: hintText,
      labelText: labelText,
      enabledBorder: InputBorder.none,
      focusedBorder: InputBorder.none,
    ),
    keyboardType: TextInputType.visiblePassword,
  );
}
