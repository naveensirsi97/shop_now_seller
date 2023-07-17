import 'package:flutter/material.dart';

Widget orderPlaceDetails({title1, title2, d1, d2}) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title1,
              style: const TextStyle(fontWeight: FontWeight.w500),
            ),
            Text(
              d1,
              style: const TextStyle(
                  fontWeight: FontWeight.w500, color: Colors.red),
            ),
          ],
        ),
        SizedBox(
          width: 120,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title2,
                style: const TextStyle(fontWeight: FontWeight.w500),
              ),
              Text(
                d2,
                style: const TextStyle(
                    fontWeight: FontWeight.w500, color: Colors.red),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}
