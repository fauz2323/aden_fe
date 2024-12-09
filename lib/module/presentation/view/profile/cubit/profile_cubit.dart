import 'package:aden_fe/core/helper/token_helper.dart';
import 'package:aden_fe/module/domain/entities/profile_entities.dart';
import 'package:aden_fe/module/domain/usecases/auth/profile_usecase.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'profile_state.dart';
part 'profile_cubit.freezed.dart';

@injectable
class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit(this.profileUsecase) : super(ProfileState.loading());

  final ProfileUsecase profileUsecase;
  final TokenHelper tokenHelper = TokenHelper();
  late String token;

  initial() async {
    token = await tokenHelper.getToken();
    print("token is " + token);

    final dataProfile = await profileUsecase.auth(token);

    dataProfile.fold(
      (l) => emit(ProfileState.error(l.message)),
      (r) => emit(ProfileState.loaded(r)),
    );
  }
}
