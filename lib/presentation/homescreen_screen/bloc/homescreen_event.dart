// ignore_for_file: must_be_immutable

part of 'homescreen_bloc.dart';

@immutable
abstract class HomescreenEvent extends Equatable {}

class HomescreenInitialEvent extends HomescreenEvent {
  @override
  List<Object?> get props => [];
}

class CreateCompletionsEvent extends HomescreenEvent {
  CreateCompletionsEvent({
    required this.token,
    required this.onCreateCompletionsEventSuccess,
    required this.onCreateCompletionsEventError,
  });

  String token;

  Function onCreateCompletionsEventSuccess;

  Function(String) onCreateCompletionsEventError;

  @override
  List<Object?> get props => [
        token,
        onCreateCompletionsEventSuccess,
        onCreateCompletionsEventError,
      ];
}
