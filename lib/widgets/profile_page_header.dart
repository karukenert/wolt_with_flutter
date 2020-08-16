import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import '../userdata.dart' as userdata;

class ProfilePageHeader implements SliverPersistentHeaderDelegate {
  final double minExtent = 60;
  final double maxExtent = 120;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Container(
          color: Colors.white,
        ),
        Positioned(
          left: 20,
          bottom: 16,
          child: Text(
            'Howdy ${userdata.firstName}!',
            style: TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.bold,
              color: Colors.black.withOpacity(titleOpacity(shrinkOffset)),
            ),
          ),
        ),
        Positioned(
          left: 20,
          top: 16,
          child: Text(
            'Profile',
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black.withOpacity(profileOpacity(shrinkOffset))),
          ),
        ),
        Positioned(
          right: 20,
          top: 10,
          child: CircleAvatar(
            backgroundColor: Colors.grey[200],
            radius: 20,
            child: IconButton(
              icon: Icon(Icons.settings),
              color: Colors.black,
              onPressed: () {},
            ),
          ),
          //TODO remove onpressed animation from the settings button
          //TODO implement settings button function ()=>ScrollDown();
        ),
        Positioned(
          left: 0,
          bottom: -3,
          child: Container(
            width: 1000,
            height: 1,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color:
                      Colors.grey.withOpacity(bottomLineOpacity(shrinkOffset)),
                  spreadRadius: 1,
                  blurRadius: 5,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  double titleOpacity(double shrinkOffset) {
    // simple formula: fade out text as soon as shrinkOffset > 0

    return 1 - max(0, shrinkOffset) / maxExtent;

    // return 1.0 - max(0.0, (shrinkOffset - minExtent)) / (maxExtent - minExtent);
  }

  double profileOpacity(double shrinkOffset) {
    return 0 + max(0.0, shrinkOffset) / maxExtent;
  }

  double bottomLineOpacity(double shrinkOffset) {
    // more complex formula: starts fading in text when shrinkOffset > minExtent
    return 0 + max(0.0, (shrinkOffset - minExtent)) / (maxExtent - minExtent);
  }

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }

  @override
  FloatingHeaderSnapConfiguration get snapConfiguration => null;

  @override
  OverScrollHeaderStretchConfiguration get stretchConfiguration => null;
}
