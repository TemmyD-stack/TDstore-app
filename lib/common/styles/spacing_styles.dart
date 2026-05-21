
import 'package:flutter/material.dart';
import 'package:t_store/utils/constants/sizes.dart';

class TSpacingStyle{
  static const EdgeInsetsGeometry paddingWithAppBarHeight = EdgeInsets.only(
    left: TSizes.defaultSpace, 
    right: TSizes.defaultSpace, 
    bottom: TSizes.defaultSpace, 
    top: TSizes.appBarHeight
    );
}