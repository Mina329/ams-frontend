import 'package:ams_frontend/src/utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

import '../../../../konstants/kcolors.dart';
import '../../../../konstants/kdoubles.dart';
import '../../../../konstants/kicons.dart';

class FloatingActionBubble extends StatelessWidget {
  final Function() onTapFaceID;
  final Function() onTapQrCode;
  final Function() onTapId;
  final Function()? onSubmit;

  const FloatingActionBubble({
    Key? key,
    required this.onTapFaceID,
    required this.onTapQrCode,
    required this.onTapId,
    this.onSubmit,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SpeedDial(
      icon: KIcons.take_attendance_outline,
      activeIcon: KIcons.take_attendance,
      iconTheme: IconThemeData(
        color: KColors.white,
      ),
      backgroundColor: Theme.of(context).primaryColor,
      renderOverlay: false,
      spacing: KSizes.s10,
      elevation: KElevations.e20,
      animationCurve: Curves.fastOutSlowIn,
      children: [
        SpeedDialChild(
          child: Icon(KIcons.camera, color: KColors.white),
          backgroundColor: KColors.lightCyan,
          label: context.l10n.faceId,
          onTap: onTapFaceID,
        ),
        SpeedDialChild(
          child: Icon(
            KIcons.qrCode,
            color: KColors.white,
          ),
          backgroundColor: KColors.lightCyan,
          label: context.l10n.qrCode,
          onTap: onTapQrCode,
        ),
        SpeedDialChild(
          child: Icon(
            KIcons.id,
            color: KColors.white,
          ),
          backgroundColor: KColors.lightCyan,
          label: context.l10n.id,
          onTap: onTapId,
        ),
        if (onSubmit != null)
          SpeedDialChild(
            child: Icon(
              Icons.save_alt_outlined,
              color: KColors.white,
            ),
            backgroundColor: KColors.lightCyan,
            label: 'submit'.hardcoded,
            onTap: onSubmit,
          )
      ],
    );
  }
}
