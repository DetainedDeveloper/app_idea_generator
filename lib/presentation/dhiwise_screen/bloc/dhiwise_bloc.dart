import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import 'package:app_idea_generator/presentation/dhiwise_screen/models/dhiwise_model.dart';
part 'dhiwise_event.dart';
part 'dhiwise_state.dart';

class DhiwiseBloc extends Bloc<DhiwiseEvent, DhiwiseState> {
  DhiwiseBloc(DhiwiseState initialState) : super(initialState) {
    on<DhiwiseInitialEvent>(_onInitialize);
  }

  _onInitialize(
    DhiwiseInitialEvent event,
    Emitter<DhiwiseState> emit,
  ) async {
    Future.delayed(const Duration(milliseconds: 3000), () {
      NavigatorService.popAndPushNamed(
        AppRoutes.homescreenScreen,
      );
    });
  }
}
