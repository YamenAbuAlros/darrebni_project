import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:template/core/enums/bottom_navigation.dart';

import '../../../shared/colors.dart';
import '../../../shared/utils.dart';

class BottomNavigationWidget extends StatefulWidget {
  const BottomNavigationWidget({
    super.key,
    required this.bottomNavigationEnum,
    required this.onTap,
  });

  final BottomNavigationEnum bottomNavigationEnum;
  final Function(BottomNavigationEnum, int) onTap;

  @override
  State<BottomNavigationWidget> createState() => _BottomNavigationWidgetState();
}

class _BottomNavigationWidgetState extends State<BottomNavigationWidget> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Container(
          width: width,
          height: height * 0.11,
          alignment: Alignment.bottomCenter,
        ),
        Positioned(
          bottom: 0,
          right: 0,
          left: 0,
          child: Padding(
            padding: EdgeInsets.symmetric(
              vertical: width * 0.025,
              horizontal: width * 0.15,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                navItem(
                  imageName: 'ic_profile',
                  isSelected: widget.bottomNavigationEnum ==
                      BottomNavigationEnum.PROFILE,
                  onTap: () {
                    widget.onTap(BottomNavigationEnum.PROFILE, 3);
                  },
                ),
                navItem(
                  imageName: 'ic_star',
                  isSelected: widget.bottomNavigationEnum ==
                      BottomNavigationEnum.FAVORITE,
                  onTap: () {
                    widget.onTap(BottomNavigationEnum.FAVORITE, 2);
                  },
                ),
                navItem(
                  imageName: 'ic_home',
                  isSelected:
                      widget.bottomNavigationEnum == BottomNavigationEnum.HOME,
                  onTap: () {
                    widget.onTap(BottomNavigationEnum.HOME, 1);
                  },
                ),
                navItem(
                  imageName: 'ic_notification',
                  isSelected: widget.bottomNavigationEnum ==
                      BottomNavigationEnum.Notification,
                  onTap: () {
                    widget.onTap(BottomNavigationEnum.Notification, 0);
                  },
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget navItem({
    required String imageName,
    required bool isSelected,
    required Function onTap,
  }) {
    return InkWell(
      onTap: () {
        onTap();
      },
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(width * 0.01),
            width: width * 0.1,
            height: height * 0.042,
            decoration: isSelected
                ? BoxDecoration(
                    border: Border(
                        bottom: BorderSide(
                            width: width * 0.005,
                            color: AppColors.mainPurple1)))
                : null,
            child: SvgPicture.asset(
              'assets/images/$imageName.svg',
              color: AppColors.mainPurple1,
              width: width * 0.055,
            ),
          ),
        ],
      ),
    );
  }
}
