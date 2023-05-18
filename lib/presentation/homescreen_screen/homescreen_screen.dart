import 'bloc/homescreen_bloc.dart';
import 'package:app_idea_generator/core/app_export.dart';
import 'package:app_idea_generator/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class HomescreenScreen extends StatelessWidget {
  static Widget builder(BuildContext context) {
    return BlocProvider<HomescreenBloc>(
      create: (context) =>
          HomescreenBloc(HomescreenState(appIdea: null))..add(HomescreenInitialEvent()),
      child: HomescreenScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomescreenBloc, HomescreenState>(
      builder: (context, state) {
        return SafeArea(
          child: Scaffold(
            backgroundColor: ColorConstant.whiteA700,
            appBar: AppBar(
              backgroundColor: AppDecoration.surface.color,
              centerTitle: true,
              leading: Center(
                child: CustomImageView(
                  imagePath: ImageConstant.appIcon,
                    height: getVerticalSize(32),
                    width: getHorizontalSize(32),
                ),
              ),
              title: Text(
                "msg_app_idea_generator".tr,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.left,
                style: AppStyle.txtRobotoMedium14.copyWith(
                  letterSpacing: getHorizontalSize(1.5),
                ),
              ),
              actions: [
                IconButton(
                  icon: Icon(
                    Icons.settings,
                    color: Theme.of(context).hintColor,
                  ),
                  onPressed: () => Navigator.pushNamed(context, AppRoutes.settingsScreen),
                ),
              ],
            ),
            body: Container(
              width: double.maxFinite,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  state.appIdea != null
                      ? Container(
                          margin: getMargin(left: 8, right: 8, top: 16, bottom: 16),
                          padding: getPadding(left: 12, top: 16, right: 12, bottom: 12),
                          decoration: AppDecoration.surface,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                "lbl_title".tr.toUpperCase(),
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.left,
                                style: AppStyle.txtRobotoMedium10.copyWith(
                                  letterSpacing: getHorizontalSize(1.5),
                                ),
                              ),
                              Padding(
                                padding: getPadding(top: 6),
                                child: Text(
                                  state.appIdea!.name.tr,
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.left,
                                  style: AppStyle.txtRobotoRegular20.copyWith(
                                    letterSpacing: getHorizontalSize(1.5),
                                  ),
                                ),
                              ),
                              Container(
                                width: getHorizontalSize(358),
                                margin: getMargin(top: 4),
                                child: Text(
                                  state.appIdea!.description,
                                  maxLines: null,
                                  textAlign: TextAlign.left,
                                  style: AppStyle.txtRobotoRegular16.copyWith(
                                    letterSpacing: getHorizontalSize(0.25),
                                  ),
                                ),
                              ),
                              Padding(
                                  padding: const EdgeInsets.symmetric(vertical: 16.0)),
                              Text(
                                "lbl_features".tr.toUpperCase(),
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.left,
                                style: AppStyle.txtRobotoMedium10.copyWith(
                                  letterSpacing: getHorizontalSize(1.5),
                                ),
                              ),
                              Padding(padding: const EdgeInsets.symmetric(vertical: 4.0)),
                              Column(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: List.generate(
                                  state.appIdea!.features.length,
                                  (index) => Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Padding(
                                        padding:
                                            const EdgeInsets.symmetric(vertical: 4.0),
                                        child: Text(
                                          '${index + 1}. ${state.appIdea!.features[index]}',
                                          maxLines: null,
                                          textAlign: TextAlign.start,
                                          style: AppStyle.txtRobotoRegular16.copyWith(
                                            letterSpacing: getHorizontalSize(0.25),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
                      : Expanded(
                          child: Center(
                            child: Text(
                              "msg_generate_an_idea".tr,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                              style: AppStyle.txtRobotoRegular16.copyWith(
                                letterSpacing: getHorizontalSize(0.5),
                              ),
                            ),
                          ),
                        ),
                  Spacer(),
                  CustomButton(
                    height: getVerticalSize(48),
                    width: getHorizontalSize(88),
                    text: "lbl_generate".tr,
                    alignment: Alignment.center,
                    margin: getMargin(bottom: 48),
                    onTap: () async {
                      String? token = await PrefUtils.getOpenAIToken();

                      if (token != null) {
                        fetchAppIdea(context, token);
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Please configure ⚙ API token'),
                          ),
                        );
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  fetchAppIdea(BuildContext context, String token) {
    context.read<HomescreenBloc>().add(
          CreateCompletionsEvent(
            token: token,
            onCreateCompletionsEventSuccess: () {
              _onCreateCompletionsEventSuccess(context);
            },
            onCreateCompletionsEventError: (message) {
              _onCreateCompletionsEventError(context, message);
            },
          ),
        );
  }

  void _onCreateCompletionsEventSuccess(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Idea generated successfully'),
      ),
    );
  }

  void _onCreateCompletionsEventError(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          message.isNotEmpty ? message : 'Failed to generate idea, try again',
        ),
      ),
    );
  }
}
