// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../module/data/datasource/remote/auth_remote_datasource.dart' as _i5;
import '../module/data/datasource/remote/food_remote_datasource.dart' as _i4;
import '../module/data/datasource/remote/order_remote_datasource.dart' as _i3;
import '../module/data/repositories/auth_domain_repository_impl.dart' as _i7;
import '../module/data/repositories/food_domain_repository_impl.dart' as _i12;
import '../module/data/repositories/order_domain_repository_impl.dart' as _i21;
import '../module/domain/repositories/auth_repository.dart' as _i6;
import '../module/domain/repositories/food_repository.dart' as _i11;
import '../module/domain/repositories/order_repository.dart' as _i20;
import '../module/domain/usecases/auth/login_usecase.dart' as _i9;
import '../module/domain/usecases/auth/profile_usecase.dart' as _i10;
import '../module/domain/usecases/auth/register_usecase.dart' as _i8;
import '../module/domain/usecases/food/food_by_category_usecase.dart' as _i16;
import '../module/domain/usecases/food/food_uuid_usecase.dart' as _i13;
import '../module/domain/usecases/food/list_category_usecase.dart' as _i14;
import '../module/domain/usecases/food/list_food_usecase.dart' as _i15;
import '../module/domain/usecases/order/add_cart_usecase.dart' as _i23;
import '../module/domain/usecases/order/get_all_order_usecase.dart' as _i25;
import '../module/domain/usecases/order/get_cart_usecase.dart' as _i27;
import '../module/domain/usecases/order/get_detail_order_usecase.dart' as _i28;
import '../module/domain/usecases/order/make_order_usecase.dart' as _i26;
import '../module/domain/usecases/order/make_payment_usecase.dart' as _i29;
import '../module/presentation/view/cart/cubit/cart_cubit.dart' as _i33;
import '../module/presentation/view/food_detail/cubit/food_detail_cubit.dart'
    as _i31;
import '../module/presentation/view/food_menu/cubit/food_menu_cubit.dart'
    as _i24;
import '../module/presentation/view/home_screen/cubit/home_screen_cubit.dart'
    as _i22;
import '../module/presentation/view/login/cubit/login_cubit.dart' as _i19;
import '../module/presentation/view/my_order/cubit/my_order_cubit.dart' as _i30;
import '../module/presentation/view/payment/cubit/payment_cubit.dart' as _i32;
import '../module/presentation/view/profile/cubit/profile_cubit.dart' as _i17;
import '../module/presentation/view/register/cubit/register_cubit.dart' as _i18;

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
    gh.factory<_i3.OrderRemoteDatasourceImpl>(
        () => _i3.OrderRemoteDatasourceImpl());
    gh.factory<_i4.FoodRemoteDataSourceImpl>(
        () => _i4.FoodRemoteDataSourceImpl());
    gh.factory<_i5.AuthRemoteDatasourceImpl>(
        () => _i5.AuthRemoteDatasourceImpl());
    gh.factory<_i6.AuthRepository>(() => _i7.AuthDomainRepositoryImpl(
        authRemoteDatasourceImpl: gh<_i5.AuthRemoteDatasourceImpl>()));
    gh.factory<_i8.RegisterUseCase>(
        () => _i8.RegisterUseCase(authRepository: gh<_i6.AuthRepository>()));
    gh.factory<_i9.LoginUseCase>(
        () => _i9.LoginUseCase(authRepository: gh<_i6.AuthRepository>()));
    gh.factory<_i10.ProfileUsecase>(
        () => _i10.ProfileUsecase(authRepository: gh<_i6.AuthRepository>()));
    gh.factory<_i11.FoodRepository>(() => _i12.FoodDomainRepositoryImpl(
        foodRemoteDataSourceImpl: gh<_i4.FoodRemoteDataSourceImpl>()));
    gh.factory<_i13.FoodUuidUseCase>(
        () => _i13.FoodUuidUseCase(foodRepository: gh<_i11.FoodRepository>()));
    gh.factory<_i14.ListCategoryUseCase>(() =>
        _i14.ListCategoryUseCase(foodRepository: gh<_i11.FoodRepository>()));
    gh.factory<_i15.ListFoodUseCase>(
        () => _i15.ListFoodUseCase(foodRepository: gh<_i11.FoodRepository>()));
    gh.factory<_i16.ListFoodByCategoryUseCase>(() =>
        _i16.ListFoodByCategoryUseCase(
            foodRepository: gh<_i11.FoodRepository>()));
    gh.factory<_i17.ProfileCubit>(
        () => _i17.ProfileCubit(gh<_i10.ProfileUsecase>()));
    gh.factory<_i18.RegisterCubit>(
        () => _i18.RegisterCubit(gh<_i8.RegisterUseCase>()));
    gh.factory<_i19.LoginCubit>(() => _i19.LoginCubit(gh<_i9.LoginUseCase>()));
    gh.factory<_i20.OrderRepository>(() => _i21.OrderDomainRepositoryImpl(
        orderRemoteDatasource: gh<_i3.OrderRemoteDatasourceImpl>()));
    gh.factory<_i22.HomeScreenCubit>(() => _i22.HomeScreenCubit(
          gh<_i14.ListCategoryUseCase>(),
          gh<_i15.ListFoodUseCase>(),
        ));
    gh.factory<_i23.AddCartUseCase>(
        () => _i23.AddCartUseCase(orderRepository: gh<_i20.OrderRepository>()));
    gh.factory<_i24.FoodMenuCubit>(() => _i24.FoodMenuCubit(
          gh<_i15.ListFoodUseCase>(),
          gh<_i16.ListFoodByCategoryUseCase>(),
        ));
    gh.factory<_i25.GetAllOrderUsecase>(
        () => _i25.GetAllOrderUsecase(gh<_i20.OrderRepository>()));
    gh.factory<_i26.MakeOrderUsecase>(
        () => _i26.MakeOrderUsecase(gh<_i20.OrderRepository>()));
    gh.factory<_i27.GetCartUseCase>(
        () => _i27.GetCartUseCase(gh<_i20.OrderRepository>()));
    gh.factory<_i28.GetDetailOrderUseCase>(
        () => _i28.GetDetailOrderUseCase(gh<_i20.OrderRepository>()));
    gh.factory<_i29.MakePaymentUsecase>(
        () => _i29.MakePaymentUsecase(gh<_i20.OrderRepository>()));
    gh.factory<_i30.MyOrderCubit>(
        () => _i30.MyOrderCubit(gh<_i25.GetAllOrderUsecase>()));
    gh.factory<_i31.FoodDetailCubit>(() => _i31.FoodDetailCubit(
          gh<_i13.FoodUuidUseCase>(),
          gh<_i23.AddCartUseCase>(),
        ));
    gh.factory<_i32.PaymentCubit>(() => _i32.PaymentCubit(
          gh<_i28.GetDetailOrderUseCase>(),
          gh<_i29.MakePaymentUsecase>(),
        ));
    gh.factory<_i33.CartCubit>(() => _i33.CartCubit(
          gh<_i27.GetCartUseCase>(),
          gh<_i26.MakeOrderUsecase>(),
        ));
    return this;
  }
}
