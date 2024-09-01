import 'package:lets_vote_app/setup/domain/entities/setup.dart';

class SetupModel extends Setup {
  const SetupModel({
    required super.key,
    required super.value,
  });

  factory SetupModel.fromMap(Map<String, dynamic> map, String id) {
    return SetupModel(
      key: id,
      value: map['value'],
    );
  }

  Map<String, dynamic> toFirebaseMap() {
    return {
      'value': value,
    };
  }

  static SetupModel fromSetup(Setup setup) {
    // Add your implementation here
    return SetupModel(
      key: setup.key,
      value: setup.value,
    );
  }
}
