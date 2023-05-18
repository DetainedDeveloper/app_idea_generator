// ignore_for_file: must_be_immutable

part of 'homescreen_bloc.dart';

class HomescreenState extends Equatable {
  HomescreenState({this.appIdea});

  final AppIdea? appIdea;

  @override
  List<Object?> get props => [
        appIdea,
      ];

  HomescreenState copyWith({AppIdea? appIdea}) {
    return HomescreenState(
      appIdea: appIdea ?? this.appIdea,
    );
  }
}
