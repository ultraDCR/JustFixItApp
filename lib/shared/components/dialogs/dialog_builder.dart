import 'package:just_fix_it/core/theme/dimens.dart';
import 'package:flutter/material.dart';
import 'package:just_fix_it/shared/extensions/context_extensions.dart';
import 'package:just_fix_it/shared/constants/constants.dart' as Constants;

class LoadingDialog {
  static bool _isVisible = false;

  static Future<void> show({required BuildContext context, List<Widget> actions = const []}) {
    if (_isVisible == false) {
      _isVisible = true;

      return showDialog(
        context: context,
        barrierDismissible: false,
        useRootNavigator: false,
        builder: (context) {
          return PopScope(
            canPop: false,
            child: AlertDialog.adaptive(
              surfaceTintColor: Colors.transparent,
              backgroundColor: context.colorScheme.surface,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(Dimens.radius)),
              content: const Padding(
                padding: EdgeInsets.all(Dimens.halfSpacing),
                child: Row(
                  children: [
                    SizedBox(
                      width: Dimens.loaderSize,
                      height: Dimens.loaderSize,
                      child: CircularProgressIndicator.adaptive(),
                    ),
                    SizedBox(width: Dimens.spacing),
                    Expanded(child: Text(Constants.loadingDialog_content)),
                  ],
                ),
              ),
            ),
          );
        },
      );
    }
    return Future.value();
  }

  static void hide({required BuildContext context}) {
    if (_isVisible) {
      _isVisible = false;
      Navigator.of(context).pop();
    }
  }
}
