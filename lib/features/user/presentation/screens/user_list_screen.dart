import 'package:demo_flutter/features/user/presentation/controller/user_controller.dart';
import 'package:demo_flutter/features/user/presentation/widgets/status_container.dart';
import 'package:demo_flutter/features/user/domain/entities/user_entity.dart';
import 'package:demo_flutter/common/widget/spinkit_indicator.dart';
import 'package:demo_flutter/features/user/data/models/user.dart';
import 'package:demo_flutter/common/dialog/retry_dialog.dart';
import 'package:demo_flutter/common/widget/empty_widget.dart';
import 'package:demo_flutter/common/widget/popup_menu.dart';
import 'package:demo_flutter/core/app_extension.dart';
import 'package:demo_flutter/core/app_style.dart';
import 'package:demo_flutter/di.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

enum UserOperation { edit, delete, post, todo }

class UserListScreen extends StatefulWidget {
  const UserListScreen({super.key});

  @override
  State<UserListScreen> createState() => _UserListScreenState();
}

class _UserListScreenState extends State<UserListScreen> {
  final UserController controller = getIt<UserController>();

  PreferredSizeWidget get _appBar {
    return AppBar(
      leading: IconButton(
        onPressed: controller.getUserList,
        icon: const Icon(Icons.refresh),
      ),
      actions: [
        PopupMenu<UserStatus>(
          icon: Icons.filter_list_outlined,
          items: UserStatus.values,
          onChanged: (UserStatus value) {
            controller.getUserList(status: value);
          },
        ),
        PopupMenu<Gender>(
          icon: Icons.filter_alt_outlined,
          items: Gender.values,
          onChanged: (Gender value) => controller.getUserList(gender: value),
        )
      ],
      title: const Text("Users"),
      backgroundColor: Theme.of(context).colorScheme.inversePrimary,
    );
  }

  Widget get floatingActionButton {
    return FloatingActionButton(
      onPressed: () async {
      },
      child: const Icon(Icons.add),
    );
  }

  Widget userListItem(User user) {
    return Card(
      child: Row(
        children: [
          Image.asset(user.gender.name.getGenderWidget, height: 75),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(user.name, style: headLine4),
                const SizedBox(height: 10),
                Text(user.email, style: headLine6)
              ],
            ),
          ),
          const SizedBox(width: 15),
          StatusContainer(status: user.status),
          PopupMenu<UserOperation>(
            items: UserOperation.values,
            onChanged: (UserOperation value) async {
              switch (value) {
                case UserOperation.post:
                  break;
                case UserOperation.todo:
                  break;
                case UserOperation.delete:
                  break;
                case UserOperation.edit:
              }
            },
          ),
        ],
      ),
    );
  }


  @override
  void initState() {
    controller.getUserList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: floatingActionButton,
      appBar: _appBar,
      body: controller.obx(
        (state) => ListView.builder(
          shrinkWrap: true,
          itemCount: state?.length,
          itemBuilder: (_, index) {
            User user = state![index];
            return userListItem(user).marginSymmetric(horizontal: 10);
          },
        ),
        onLoading: const SpinKitIndicator(type: SpinKitType.circle),
        onError: (error) => RetryDialog(
          title: "$error",
          onRetryPressed: () => controller.getUserList(),
        ),
        onEmpty: const EmptyWidget(message: "No user!"),
      ),
    );
  }
}
