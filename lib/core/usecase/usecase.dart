import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:nba_flutter/core/usecase/error/failure.dart';

abstract class Usecase<Output, Input> {
  Future<Either<Failure, Output>> call(Input params);
}

class NoParams extends Equatable {
  @override
  List<Object> get props => [];
}
