import 'bloc/dhiwise_bloc.dart';
import 'models/dhiwise_model.dart';
import 'package:app_idea_generator/core/app_export.dart';
import 'package:flutter/material.dart';

class DhiwiseScreen extends StatelessWidget {
  static Widget builder(BuildContext context) {
    return BlocProvider<DhiwiseBloc>(
        create: (context) => DhiwiseBloc(DhiwiseState(dhiwiseModelObj: DhiwiseModel()))
          ..add(DhiwiseInitialEvent()),
        child: DhiwiseScreen());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DhiwiseBloc, DhiwiseState>(builder: (context, state) {
      return SafeArea(
          child: Scaffold(
              backgroundColor: ColorConstant.whiteA700,
              body: Container(
                  width: getHorizontalSize(512),
                  child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
                    CustomImageView(
                      imagePath: ImageConstant.appIcon,
                      height: getVerticalSize(128),
                      width: getHorizontalSize(128),
                      fit: BoxFit.contain,
                    )
                  ]))));
    });
  }
}
