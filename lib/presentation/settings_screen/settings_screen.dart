import 'package:app_idea_generator/core/app_export.dart';
import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool unsaved = false, canDelete = false;
  String? token;

  final TextEditingController tokenController = TextEditingController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      token = await PrefUtils.getOpenAIToken();

      setState(() {
        if (token != null) {
          tokenController.text = token!;
          canDelete = true;
        }
      });
    });
  }

  @override
  void dispose() {
    tokenController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppDecoration.surface.color,
        iconTheme: Theme.of(context).iconTheme.copyWith(
          color: Theme.of(context).hintColor,
        ),
        centerTitle: true,
        title: Text(
          "lbl_settings".tr,
          overflow: TextOverflow.ellipsis,
          textAlign: TextAlign.left,
          style: AppStyle.txtRobotoMedium14.copyWith(
            letterSpacing: getHorizontalSize(1.5),
          ),
        ),
        actions: [
          IconButton(
            tooltip: 'Save',
            icon: Icon(
              Icons.save,
              color: unsaved
                  ? Theme.of(context).hintColor
                  : Theme.of(context).dividerColor,
            ),
            onPressed: () async {
              if (unsaved) {
                await PrefUtils.setOpenAIToken(tokenController.text.trim());

                setState(() {
                  unsaved = false;
                  canDelete = true;
                });

                FocusScope.of(context).unfocus();

                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Token saved'),
                  ),
                );
              }
            },
          ),
          IconButton(
            tooltip: 'Delete API Token',
            icon: Icon(
              Icons.delete_forever,
              color: canDelete
                  ? Theme.of(context).hintColor
                  : Theme.of(context).dividerColor,
            ),
            onPressed: () async {
              if (canDelete) {
                await PrefUtils.deleteOpenAIToken();

                setState(() {
                  tokenController.clear();
                  unsaved = false;
                  canDelete = false;
                });

                FocusScope.of(context).unfocus();

                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Token deleted'),
                  ),
                );
              }
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: tokenController,
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.key),
              ),
              style: AppStyle.txtRobotoRegular16,
              onChanged: (value) {
                setState(() {
                  unsaved = value.isNotEmpty;
                });
              },
              minLines: 1,
              maxLines: 1,
              textAlignVertical: TextAlignVertical.center,
              keyboardType: TextInputType.text,
            ),
          ),
        ],
      ),
    );
  }
}
