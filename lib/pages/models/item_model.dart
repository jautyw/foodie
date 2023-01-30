import 'dart:ffi';
import 'package:flutter/foundation.dart';

class Item {
  String name;
  String image;
  String expiryDate;
  int daysUntilExpiry;
  int maxPrice;
  int minPrice;

  Item({required this.name, required this.image, required this.expiryDate, required this.daysUntilExpiry, required this.maxPrice, required this.minPrice});
}
