import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hitch_handler_v2/app/types/post_types.dart';
import 'package:hitch_handler_v2/data/apis/add_post_api.dart';
import 'package:hitch_handler_v2/data/enums/enums.dart';
import 'package:hitch_handler_v2/data/model/models.dart';
import 'package:hitch_handler_v2/providers/providers.dart';
import 'package:provider/provider.dart';

import 'package:hitch_handler_v2/app/views/widgets/modals/modals.dart';

class AddPostController {
  late AddPostProvider _addPostProvider;

  AddPostController(BuildContext context) {
    _addPostProvider = Provider.of<AddPostProvider>(context, listen: false);
  }

  post(BuildContext context) async {
    AddPostController addPostController = AddPostController(context);
    _addPostProvider.updateIsLoading(true);
    final scaffoldContext = ScaffoldMessenger.of(context);
    final goContext = GoRouter.of(context);
    MaterialBanner materialBanner;
    SnackBar snackBar;
    UserModel? userModel = context.read<UserProvider>().userModel;
    if (userModel == null) {
      _addPostProvider.updateIsLoading(false);
      materialBanner = showCustomMaterialBanner(
        context,
        contentText: "No user logged in",
      );
      return;
    }
    String? jwt = context.read<UserProvider>().jwtToken;
    if (jwt == null) {
      _addPostProvider.updateIsLoading(false);
      materialBanner = showCustomMaterialBanner(
        context,
        contentText: "JWT not found",
      );
      return;
    }
    ResponseModel result;
    result = await addPost(
      PostModel(
        title: _addPostProvider.title!,
        desc: _addPostProvider.description!,
        type: getPostType(_addPostProvider.type).title.toLowerCase(),
        location: _addPostProvider.useLocation
            ? Location.getLocationString(_addPostProvider.location)
            : "",
        domain: Domain.getDomainString(_addPostProvider.domain),
        roll: userModel.roll!,
      ),
      jwt,
    );

    _addPostProvider.updateIsLoading(false);
    if (result.statusCode == 200) {
      addPostController.reset();
      goContext.pop();
      if (context.mounted) {
        snackBar = showSnackBar(
          context,
          contentText: result.message,
        );
        scaffoldContext.hideCurrentSnackBar();
        scaffoldContext.showSnackBar(snackBar);
      }
    } else {
      if (context.mounted) {
        materialBanner = showCustomMaterialBanner(
          context,
          contentText: result.message,
        );
        scaffoldContext.hideCurrentMaterialBanner();
        scaffoldContext.showMaterialBanner(materialBanner);
      }
    }
  }

  bool isFromValid() {
    if (_addPostProvider.title?.isEmpty ?? true) return false;
    if (_addPostProvider.description?.isEmpty ?? true) return false;
    if (_addPostProvider.domain == DomainEnum.none) return false;
    return true;
  }

  reset() {
    debugPrint("Resetting AddPostProvider");
    _addPostProvider.updateTitle('');
    _addPostProvider.updateDescription('');
    _addPostProvider.updateTypeEnum(PostTypeEnum.public);
    _addPostProvider.updateLocation(LocationEnum.none);
    _addPostProvider.updateDomain(DomainEnum.none);
    _addPostProvider.updateUseLocation(true);
  }

  updateLocation(LocationEnum location) {
    _addPostProvider.updateLocation(location);
  }

  updateDomain(DomainEnum domain) {
    _addPostProvider.updateDomain(domain);
  }
}
