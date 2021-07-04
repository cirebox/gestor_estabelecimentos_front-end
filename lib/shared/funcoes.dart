import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

var wsToken = '';

String get getDataAtual => DateFormat("dd/MM/yyyy").format(DateTime.now());
String get getHoraAtual => DateFormat("HH:mm:ss").format(DateTime.now());

Future<String> getStorage(String field) async {
  final storage = await SharedPreferences.getInstance();
  return await storage.getString(field) ?? "";
}

void setStorage(String field, String value) async {
  final storage = await SharedPreferences.getInstance();
  await storage.setString(field, value);
}

Future<Map<String, String>> criaHeader() async {
  Map<String, String> v;
  v = {};
  if (wsToken.trim().length > 0) {
    v = {
      'Authorization': 'Bearer ' + wsToken,
    };
  }
  return v;
}
