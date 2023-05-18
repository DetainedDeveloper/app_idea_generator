// ignore_for_file: must_be_immutable

part of 'dhiwise_bloc.dart';

class DhiwiseState extends Equatable {
  DhiwiseState({this.dhiwiseModelObj});

  DhiwiseModel? dhiwiseModelObj;

  @override
  List<Object?> get props => [
        dhiwiseModelObj,
      ];
  DhiwiseState copyWith({DhiwiseModel? dhiwiseModelObj}) {
    return DhiwiseState(
      dhiwiseModelObj: dhiwiseModelObj ?? this.dhiwiseModelObj,
    );
  }
}
