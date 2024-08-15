// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../module/data/datasource/remote/auth_remote_datasource.dart' as _i3;
import '../module/data/repositories/auth_domain_repository_impl.dart' as _i5;
import '../module/domain/repositories/auth_repository.dart' as _i4;
import '../module/domain/usecases/auth/login_usecase.dart' as _i6;
import '../module/presentation/view/login/cubit/login_cubit.dart' as _i7;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.factory<_i3.AuthRemoteDatasourceImpl>(
        () => _i3.AuthRemoteDatasourceImpl());
    gh.factory<_i4.AuthRepository>(() => _i5.AuthDomainRepositoryImpl(
        authRemoteDatasourceImpl: gh<_i3.AuthRemoteDatasourceImpl>()));
    gh.factory<_i6.LoginUseCase>(
        () => _i6.LoginUseCase(authRepository: gh<_i4.AuthRepository>()));
    gh.factory<_i7.LoginCubit>(() => _i7.LoginCubit(gh<_i6.LoginUseCase>()));
    return this;
  }
}
