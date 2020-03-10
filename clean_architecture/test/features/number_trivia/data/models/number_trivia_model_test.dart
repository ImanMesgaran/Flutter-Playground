import 'dart:convert';

import 'package:clean_architecture/features/data/models/number_trivia_model.dart';
import 'package:clean_architecture/features/domain/entities/number_trivia.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../fixtures/fixture.dart';

void main() {
  final NumberTriviaModel tNumberTriviaModel =
      NumberTriviaModel(number: 1, text: 'test text');

  test('should be a subclass of number trivia entity', () async {
    // assert
    expect(tNumberTriviaModel, isA<NumberTrivia>());
  });

  group('fromJson', () {
    test('should return a valid model when the JSON number is an Integer.',
        () async {
      // arrange
      final Map<String, dynamic> jsonMap =
          json.decode(fixture('number_trivia.json'));
      // act
      final result = NumberTriviaModel.fromJson(jsonMap);
      // assert
      expect(result, tNumberTriviaModel);
    });

    test('should return a valid model when the Json number is a double',
        () async {
      // arrange
      final Map<String, dynamic> jsonMap =
          json.decode(fixture('number_trivia_double.json'));
      // act
      final result = NumberTriviaModel.fromJson(jsonMap);
      // assert
      expect(result, tNumberTriviaModel);
    });
  });

  group('toJson', () {
    test('should return a Json Map containing the proper data', () async {
      // arrange
      var expectedResult = {"text": "test text", "number": 1};
      // act
      final result = tNumberTriviaModel.toJson();
      // assert
      expect(result, expectedResult);
    });
  });
}
