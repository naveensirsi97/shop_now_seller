import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

Widget chatBubble() {
  return Directionality(
    // textDirection: data['uid'] == auth.currentUser!.uid
    //     ? TextDirection.rtl
    //     : TextDirection.ltr,
    textDirection: TextDirection.ltr,
    child: Container(
      padding: const EdgeInsets.all(12),
      margin: const EdgeInsets.only(bottom: 8),
      decoration: const BoxDecoration(
        // color: data['uid'] == auth.currentUser!.uid ? Colors.red : Colors.grey,
        color: Colors.grey,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
          bottomLeft: Radius.circular(20),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            // '${data['last_msg']}',
            'Your message here...',
            style: TextStyle(color: Colors.white, fontSize: 16),
          ),
          10.heightBox,
          const Text(
            //  time,
            '10:55 AM',
            style: TextStyle(color: Colors.white, fontSize: 16),
          ),
        ],
      ),
    ),
  );
}
