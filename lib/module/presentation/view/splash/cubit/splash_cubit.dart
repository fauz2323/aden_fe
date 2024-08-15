import 'package:aden_fe/core/helper/token_helper.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'splash_state.dart';
part 'splash_cubit.freezed.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit() : super(SplashState.initial());
  final TokenHelper tokenHelper = TokenHelper();

  init() async {
    await Future.delayed(Duration(seconds: 3));

    tokenHelper.getToken().then((value) {
      print(value);
      if (value == '-') {
        emit(SplashState.loaded(false));
      } else {
        emit(SplashState.loaded(true));
      }
    });
  }
}
