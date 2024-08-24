import 'package:equatable/equatable.dart';
import 'package:lets_vote_app/common/domain/entity.dart';

class Vote extends Equatable implements Entity {
  final String value;
  const Vote({
    required this.value,
  });

  @override
  List<Object?> get props => [value];
}
