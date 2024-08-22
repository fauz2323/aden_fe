// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../module/data/datasource/remote/auth_remote_datasource.dart' as _i4;
import '../module/data/datasource/remote/food_remote_datasource.dart' as _i3;
import '../module/data/datasource/remote/order_remote_datasource.dart' as _i5;
import '../module/data/repositories/auth_domain_repository_impl.dart' as _i7;
import '../module/data/repositories/food_domain_repository_impl.dart' as _i11;
import '../module/data/repositories/order_domain_repository_impl.dart' as _i18;
import '../module/domain/repositories/auth_repository.dart' as _i6;
import '../module/domain/repositories/food_repository.dart' as _i10;
import '../module/domain/repositories/order_repository.dart' as _i17;
import '../module/domain/usecases/auth/login_usecase.dart' as _i9;
import '../module/domain/usecases/auth/register_usecase.dart' as _i8;
import '../module/domain/usecases/food/food_uuid_usecase.dart' as _i14;
import '../module/domain/usecases/food/list_category_usecase.dart' as _i12;
import '../module/domain/usecases/food/list_food_usecase.dart' as _i13;
import '../module/domain/usecases/order/add_cart_usecase.dart' as _i21;
import '../module/domain/usecases/order/get_cart_usecase.dart' as _i22;
import '../module/domain/usecases/order/make_order_usecase.dart' as _i23;
import '../module/domain/usecases/order/make_payment_usecase.dart' as _i24;
import '../module/presentation/view/cart/cubit/cart_cubit.dart' as _i26;
import '../module/presentation/view/food_detail/cubit/food_detail_cubit.dart'
    as _i25;
import '../module/presentation/view/food_menu/cubit/food_menu_cubit.dart'
    as _i20;
import '../module/presentation/view/home_screen/cubit/home_screen_cubit.dart'
    as _i19;
import '../module/presentation/view/login/cubit/login_cubit.dart' as _i16;
import '../module/presentation/view/register/cubit/register_cubit.dart' as _i15;

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
    gh.factory<_i3.FoodRemoteDataSourceImpl>(
        () => _i3.FoodRemoteDataSourceImpl());
    gh.factory<_i4.AuthRemoteDatasourceImpl>(
        () => _i4.AuthRemoteDatasourceImpl());
    gh.factory<_i5.OrderRemoteDatasourceImpl>(
        () => _i5.OrderRemoteDatasourceImpl());
    gh.factory<_i6.AuthRepository>(() => _i7.AuthDomainRepositoryImpl(
        authRemoteDatasourceImpl: gh<_i4.AuthRemoteDatasourceImpl>()));
    gh.factory<_i8.RegisterUseCase>(
        () => _i8.RegisterUseCase(authRepository: gh<_i6.AuthRepository>()));
    gh.factory<_i9.LoginUseCase>(
        () => _i9.LoginUseCase(authRepository: gh<_i6.AuthRepository>()));
    gh.factory<_i10.FoodRepository>(() => _i11.FoodDomainRepositoryImpl(
        foodRemoteDataSourceImpl: gh<_i3.FoodRemoteDataSourceImpl>()));
    gh.factory<_i12.ListCategoryUseCase>(() =>
        _i12.ListCategoryUseCase(foodRepository: gh<_i10.FoodRepository>()));
    gh.factory<_i13.ListFoodUseCase>(
        () => _i13.ListFoodUseCase(foodRepository: gh<_i10.FoodRepository>()));
    gh.factory<_i14.FoodUuidUseCase>(
        () => _i14.FoodUuidUseCase(foodRepository: gh<_i10.FoodRepository>()));
    gh.factory<_i15.RegisterCubit>(
        () => _i15.RegisterCubit(gh<_i8.RegisterUseCase>()));
    gh.factory<_i16.LoginCubit>(() => _i16.LoginCubit(gh<_i9.LoginUseCase>()));
    gh.factory<_i17.OrderRepository>(() => _i18.OrderDomainRepositoryImpl(
        orderRemoteDatasource: gh<_i5.OrderRemoteDatasourceImpl>()));
    gh.factory<_i19.HomeScreenCubit>(() => _i19.HomeScreenCubit(
          gh<_i12.ListCategoryUseCase>(),
          gh<_i13.ListFoodUseCase>(),
        ));
    gh.factory<_i20.FoodMenuCubit>(
        () => _i20.FoodMenuCubit(gh<_i13.ListFoodUseCase>()));
    gh.factory<_i21.AddCartUseCase>(
        () => _i21.AddCartUseCase(orderRepository: gh<_i17.OrderRepository>()));
    gh.factory<_i22.GetCartUseCase>(
        () => _i22.GetCartUseCase(gh<_i17.OrderRepository>()));
    gh.factory<_i23.MakeOrderUsecase>(
        () => _i23.MakeOrderUsecase(gh<_i17.OrderRepository>()));
    gh.factory<_i24.MakePaymentUsecase>(
        () => _i24.MakePaymentUsecase(gh<_i17.OrderRepository>()));
    gh.factory<_i25.FoodDetailCubit>(() => _i25.FoodDetailCubit(
          gh<_i14.FoodUuidUseCase>(),
          gh<_i21.AddCartUseCase>(),
        ));
    gh.factory<_i26.CartCubit>(() => _i26.CartCubit(
          gh<_i22.GetCartUseCase>(),
          gh<_i23.MakeOrderUsecase>(),
        ));
    return this;
  }
}
