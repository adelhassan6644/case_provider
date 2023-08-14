import 'package:casaProvider/navigation/custom_navigation.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import '../../../app/core/utils/app_snack_bar.dart';
import '../../../app/core/utils/styles.dart';
import '../../../data/config/di.dart';
import '../../../data/error/failures.dart';
import '../../../main_models/item_model.dart';
import '../../home/provider/home_provider.dart';
import '../repo/session_details_repo.dart';

class SessionDetailsProvider extends ChangeNotifier {
  SessionDetailsRepo repo;
  SessionDetailsProvider({required this.repo});

  late int placesIndex = 0;
  void setPlacesIndex(int index) {
    placesIndex = index;
    notifyListeners();
  }

  ItemModel? model;
  bool isLoading = false;
  getSessionDetails(id) async {
    isLoading = true;
    notifyListeners();
    Either<ServerFailure, Response> response = await repo.getSessionDetails(id);
    response.fold((fail) {
      isLoading = false;
      CustomSnackBar.showSnackBar(
          notification: AppNotification(
              message: fail.error,
              isFloating: true,
              backgroundColor: Styles.IN_ACTIVE,
              borderColor: Colors.transparent));
      notifyListeners();
    }, (success) {
      if (success.data["data"] != null) {
        model = ItemModel.fromJson(success.data["data"]);
      } else {
        model = null;
      }
      isLoading = false;
      notifyListeners();
    });
  }

  bool isEnding = false;
  endSession(id) async {
    isEnding = true;
    notifyListeners();
    Either<ServerFailure, Response> response = await repo.endSession(id);
    response.fold((fail) {
      isEnding = false;
      CustomSnackBar.showSnackBar(
          notification: AppNotification(
              message: fail.error,
              isFloating: true,
              backgroundColor: Styles.IN_ACTIVE,
              borderColor: Colors.transparent));
      notifyListeners();
    }, (success) {
      sl<HomeProvider>().getNextSessions();
      CustomNavigator.pop();
      isEnding = false;
      notifyListeners();
    });
  }
}
