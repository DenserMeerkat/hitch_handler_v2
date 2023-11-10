import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hitch_handler_v2/app/types/post_types.dart';
import 'package:hitch_handler_v2/data/apis/add_post_api.dart';
import 'package:hitch_handler_v2/data/enums/enums.dart';
import 'package:hitch_handler_v2/data/model/models.dart';
import 'package:hitch_handler_v2/providers/providers.dart';
import 'package:provider/provider.dart';

import 'package:hitch_handler_v2/app/views/widgets/modals/modals.dart';

class PostController {
  late PostProvider _postProvider;

  PostController(BuildContext context) {
    _postProvider = Provider.of<PostProvider>(context, listen: false);
  }

  post(BuildContext context) async {
    PostController postController = PostController(context);
    _postProvider.updateIsLoading(true);
    final scaffoldContext = ScaffoldMessenger.of(context);
    final goContext = GoRouter.of(context);
    MaterialBanner materialBanner;
    SnackBar snackBar;
    UserModel? userModel = context.read<UserProvider>().userModel;
    if (userModel == null) {
      _postProvider.updateIsLoading(false);
      materialBanner = showCustomMaterialBanner(
        context,
        contentText: "No user logged in",
      );
      return;
    }
    String? jwt = context.read<UserProvider>().jwtToken;
    if (jwt == null) {
      _postProvider.updateIsLoading(false);
      materialBanner = showCustomMaterialBanner(
        context,
        contentText: "JWT not found",
      );
      return;
    }
    ResponseModel result;
    result = await addPost(
      PostModel(
        title: _postProvider.title!,
        desc: _postProvider.description!,
        type: getPostType(_postProvider.type).title.toLowerCase(),
        location: _postProvider.useLocation
            ? Location.getLocationString(_postProvider.location)
            : "",
        domain: Domain.getDomainString(_postProvider.domain),
        roll: userModel.roll!,
      ),
      jwt,
    );

    _postProvider.updateIsLoading(false);
    if (result.statusCode == 200) {
      postController.reset();
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
    if (_postProvider.title?.isEmpty ?? true) return false;
    if (_postProvider.description?.isEmpty ?? true) return false;
    if (_postProvider.domain == DomainEnum.none) return false;
    return true;
  }

  reset() {
    debugPrint("Resetting PostProvider");
    _postProvider.updateTitle('');
    _postProvider.updateDescription('');
    _postProvider.updateTypeEnum(PostTypeEnum.public);
    _postProvider.updateLocation(LocationEnum.none);
    _postProvider.updateDomain(DomainEnum.none);
    _postProvider.updateUseLocation(true);
  }

  updateLocation(LocationEnum location) {
    _postProvider.updateLocation(location);
  }

  updateDomain(DomainEnum domain) {
    _postProvider.updateDomain(domain);
  }
}
