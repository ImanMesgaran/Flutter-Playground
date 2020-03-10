import 'package:clean_architecture/features/domain/entities/number_trivia.dart';
import 'package:meta/meta.dart';

class NumberTriviaModel extends NumberTrivia {
  NumberTriviaModel({@required int number, @required String text})
      : super(number: number, text: text);

  factory NumberTriviaModel.fromJson(Map<String, dynamic> json) =>
      NumberTriviaModel(
          number: (json['number'] as num).toInt(), text: json['text']);

  Map<String, dynamic> toJson() => {"number": number, "text": text};
}
