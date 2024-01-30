import 'package:http/http.dart' as http;
import 'dart:convert';
import 'hivedata.dart';

Future<void> sendHiveData(Hive hive) async {
  final response = await http.post(
    Uri.parse('https://brendansbeez.com/api/hives'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, dynamic>{
      'id': hive.hiveID,
      'type': hive.type,
      'broodBoxes': hive.broodBoxes,
      'supers': hive.supers,
      'hasFeeder': hive.hasFeeder,
      'hasRoomToLay': hive.queenHasRoomToLay,
      'hasQueenCells': hive.hasQueenCells,
      'queenIsSeen': hive.queenIsSeen,
      'queenIsLaying': hive.queenIsLaying,
      'broodFrames': hive.broodFrames,
      'pollenAmount': hive.pollenAmount,
      'honeyAmount': hive.honeyAmount,
      'diseaseInfo': hive.diseaseInfo,
      'queen': {
        'queenID': hive.queen.queenID,
        'docility': hive.queen.docility,
        'steadiness': hive.queen.steadiness,
        'broodPattern': hive.queen.broodPattern,
        'pollenStore': hive.queen.pollenStore,
        'combBuilding': hive.queen.combBuilding,
        'propolis': hive.queen.propolis,
      },
    }),
  );

  if (response.statusCode == 200) {
    // If the server returns a 200 OK response, then parse the JSON.
    print('Data sent successfully');
  } else {
    // If the server returns an unsuccessful response code, then throw an exception.
    throw Exception('Failed to send hive data');
  }
}
