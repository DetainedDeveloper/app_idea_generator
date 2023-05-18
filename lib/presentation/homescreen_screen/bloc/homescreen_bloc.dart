import 'dart:convert';

import 'package:app_idea_generator/data/models/app_idea.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import 'package:app_idea_generator/data/models/completions/post_completions_resp.dart';
import 'package:app_idea_generator/data/models/completions/post_completions_req.dart';
import 'dart:async';
import 'package:app_idea_generator/data/repository/repository.dart';

part 'homescreen_event.dart';

part 'homescreen_state.dart';

class HomescreenBloc extends Bloc<HomescreenEvent, HomescreenState> {
  HomescreenBloc(HomescreenState initialState) : super(initialState) {
    on<HomescreenInitialEvent>(_onInitialize);
    on<CreateCompletionsEvent>(_callCreateCompletions);
  }

  final _repository = Repository();

  var postCompletionsResp = PostCompletionsResp();

  _onInitialize(
    HomescreenInitialEvent event,
    Emitter<HomescreenState> emit,
  ) async {}

  FutureOr<void> _callCreateCompletions(
    CreateCompletionsEvent event,
    Emitter<HomescreenState> emit,
  ) async {
    var postCompletionsReq = PostCompletionsReq(
      model: Constants.openaiModel,
      prompt: Constants.openaiPrompt,
      maxTokens: Constants.openaiMaxTokens,
    );

    await _repository.createCompletions(
      headers: {
        'Content-type': 'application/json',
        'Authorization': 'Bearer ${event.token}',
      },
      requestData: postCompletionsReq.toJson(),
    ).then(
      (value) async {
        postCompletionsResp = value;
        _onCreateCompletionsSuccess(value, emit);
        event.onCreateCompletionsEventSuccess.call();
      },
    ).onError(
      (error, stackTrace) {
        _onCreateCompletionsError();
        event.onCreateCompletionsEventError.call(error.toString());
      },
    );
  }

  void _onCreateCompletionsSuccess(
    PostCompletionsResp resp,
    Emitter<HomescreenState> emit,
  ) {
    try {
      AppIdea appIdea = AppIdea.fromData(json.decode(resp.choices![0].text!));
      emit(state.copyWith(appIdea: appIdea));
    } catch (e, s) {
      print('Error : $e\nStacktrace : $s');
    }
  }

  void _onCreateCompletionsError() {
    //implement error method body...
  }
}
