import 'package:portscanner/export.dart';

class ShowIndicator{
Future<dynamic> indicate({required context}){
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) => Center(child: CircularProgressIndicator()),
    );
}
}
