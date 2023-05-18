// ignore_for_file: must_be_immutable

part of 'dhiwise_bloc.dart';

@immutable
abstract class DhiwiseEvent extends Equatable {}

class DhiwiseInitialEvent extends DhiwiseEvent {
  @override
  List<Object?> get props => [];
}
