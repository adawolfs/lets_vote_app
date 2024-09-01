import 'package:equatable/equatable.dart';
import 'package:lets_vote_app/common/domain/entity.dart';

class Setup extends Equatable implements Entity {
  final String key;
  final String value;
  const Setup({
    required this.key,
    required this.value,
  });

  @override
  List<Object?> get props => [key, value];
}
