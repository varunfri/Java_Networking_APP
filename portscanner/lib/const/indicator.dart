import 'package:portscanner/export.dart';

class ShowIndicator{
Future<dynamic> indicate({required context}){
    return showDialog(
      context: context,
      builder: (_) => Center(child: CircularProgressIndicator()),
    );
}
}
