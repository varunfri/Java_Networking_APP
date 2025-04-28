import 'package:portscanner/export.dart';

class ToastNotify {
  ToastificationItem toastMessage({
    required String title,
    required ToastificationType type,
    required BuildContext context,
  }) {
    return toastification.show(
      alignment: AlignmentDirectional.topCenter,
      title: Text(title),
    context: context,
      type: type,
      style: ToastificationStyle.fillColored,
      autoCloseDuration: Duration(seconds: 3),
      showProgressBar: true,
    );
  }
}
