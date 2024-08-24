import 'package:fpdart/fpdart.dart';
import 'package:lets_vote_app/common/domain/failure.dart';

abstract class UseCase<T, P> {
  Future<Either<Failure, T>> call(P params);
}
