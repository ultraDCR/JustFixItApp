import 'package:flutter/material.dart';
import 'package:just_fix_it/shared/constants/constants.dart';

enum SnackBarType { error, success, info, warning }

SnackBar myAppSnackBar(
    {SnackBarType? snackBarType = SnackBarType.success,
    required String? message,
    Duration? duration,
      String? clickText,
      VoidCallback? onClick

    }) {
  Color _snackBarColor(SnackBarType snackBarType) {
    switch (snackBarType) {
      case SnackBarType.error:
        return Colors.redAccent;
      case SnackBarType.success:
        return Colors.green;

      case SnackBarType.info:
        return Colors.grey;

      case SnackBarType.warning:
        return Colors.yellow;
    }
  }

  IconData _snackBarIcon(SnackBarType snackBarType) {
    switch (snackBarType) {
      case SnackBarType.error:
        return Icons.error;
      case SnackBarType.success:
        return Icons.check_circle;

      case SnackBarType.info:
        return Icons.info;

      case SnackBarType.warning:
        return Icons.warning_rounded;
    }
  }

  String _snackBarTitle(SnackBarType snackBarType) {
    switch (snackBarType) {
      case SnackBarType.error:
        return 'Error';
      case SnackBarType.success:
        return 'Success';

      case SnackBarType.info:
        return 'Info';

      case SnackBarType.warning:
        return 'Warning';
    }
  }

  return SnackBar(
    behavior: SnackBarBehavior.floating,
    clipBehavior: Clip.antiAlias,
    duration: duration ?? const Duration(milliseconds: 2000),
    margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
    backgroundColor: _snackBarColor(snackBarType ?? SnackBarType.success),
    content: SizedBox(
      child: Row(
        children: [
          Icon(
            _snackBarIcon(snackBarType ?? SnackBarType.success),
            color: Colors.white,
          ),
          const SizedBox(
            width: 12,
          ),
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  _snackBarTitle(snackBarType ?? SnackBarType.success),
                  style: kTextStyleBoldLarge.copyWith(color: Colors.white),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  message ?? '',
                  maxLines: 2,
                  style: kTextStyleSmall.copyWith(
                      color: Colors.white, fontWeight: FontWeight.normal),
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
          if(onClick!=null)
            InkWell(onTap:onClick, child: Text(clickText ?? "Open Cart", style: kTextStyleBoldMedium.copyWith(color: Colors.white),))
        ],
      ),
    ),
  );
}
