import 'package:lets_vote_app/vote/domain/entities/vote.dart';

class VoteModel extends Vote {
  const VoteModel({required super.value});

  factory VoteModel.fromMap(Map<String, dynamic> map, String id) {
    return VoteModel(
      value: map['value'],
    );
  }

  Map<String, dynamic> toFirebaseMap() {
    return {
      'value': value,
    };
  }
}
