import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:receive_file_intent/receive_file_intent.dart';

void main() {
  const MethodChannel channel = MethodChannel('receive_file_intent');
  const _testUriString = "content://media/external/images/media/43993";

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      switch (methodCall.method) {
        case "getInitialIntentData":
          return [_testUriString];
        case "getInitialIntentDataAsUri":
          return [Uri.parse(_testUriString)];
        case "getIntentDataStream":
          return Stream<List<String>>.fromFuture(
              Future.value([_testUriString]));
        case "getIntentDataStreamAsUri":
          return Stream<List<Uri>>.fromFuture(
              Future.value([Uri.parse(_testUriString)]));
        default:
          throw UnimplementedError();
      }
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

/*  test('getInitialIntentData', () async {
    var actual = await ReceiveFileIntent.getInitialIntentData();
    expect(actual[0], _testUriString);
  });

  test('getInitialIntentDataAsUri', () async {
    var actual = await ReceiveFileIntent.getInitialIntentDataAsUri();
    expect(actual[0], Uri.parse(_testUriString));
  });

  test('getIntentDataStream', () async {
    var actual = await ReceiveFileIntent.getIntentDataStream().toList();
    expect(actual[0][0], _testUriString);
  });

  test('getIntentDataStreamAsUri', () async {
    var actual = await ReceiveFileIntent.getIntentDataStreamAsUri().toList();
    expect(actual[0][0], Uri.parse(_testUriString));
  });*/
}
