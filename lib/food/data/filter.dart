// import 'package:chip_example/model/filter_chip_data.dart';
// import 'package:flutter/material.dart';
//
// class FilterChips {
//   static final all = <FilterChipData>[
//     FilterChipData(
//       label: 'Price: Low To High',
//       isSelected: false,
//       color: Colors.green,
//     ),
//     FilterChipData(
//       label: 'Price: High To Low',
//       isSelected: false,
//       color: Colors.red,
//     ),
//     FilterChipData(
//       label: 'Get By Tomorrow',
//       isSelected: false,
//       color: Colors.blue,
//     ),
//     FilterChipData(
//       label: 'Avg. Customer Review',
//       isSelected: false,
//       color: Colors.orange,
//     ),
//     FilterChipData(
//       label: 'Sort By Relevance',
//       isSelected: false,
//       color: Colors.purple,
//     ),
//   ];
// }
//
// class FilterChipData {
//   final String label;
//   final Color color;
//   final bool isSelected;
//
//   const FilterChipData({
//     @required this.label,
//     @required this.color,
//     this.isSelected = false,
//   });
//
//   FilterChipData copy({
//     String label,
//     Color color,
//     bool isSelected,
//   }) =>
//       FilterChipData(
//         label: label ?? this.label,
//         color: color ?? this.color,
//         isSelected: isSelected ?? this.isSelected,
//       );
//
//   @override
//   bool operator ==(Object other) =>
//       identical(this, other) ||
//           other is FilterChipData &&
//               runtimeType == other.runtimeType &&
//               label == other.label &&
//               color == other.color &&
//               isSelected == other.isSelected;
//
//   @override
//   int get hashCode => label.hashCode ^ color.hashCode ^ isSelected.hashCode;
// }