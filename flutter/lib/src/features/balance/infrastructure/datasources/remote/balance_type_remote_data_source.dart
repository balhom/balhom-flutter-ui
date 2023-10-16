import 'package:balance_home_app/src/core/clients/api_client/api_client.dart';
import 'package:balance_home_app/config/balhom_api_contract.dart';
import 'package:balance_home_app/src/core/domain/failures/failure.dart';
import 'package:balance_home_app/src/features/balance/domain/entities/balance_type_entity.dart';
import 'package:balance_home_app/src/features/balance/domain/enums/balance_type_enum.dart';
import 'package:fpdart/fpdart.dart';

class BalanceTypeRemoteDataSource {
  final ApiClient apiClient;

  BalanceTypeRemoteDataSource({required this.apiClient});

  Future<Either<Failure, BalanceTypeEntity>> get(
      final String name, final BalanceTypeEnum balanceTypeEnum) async {
    final response = await apiClient.getRequest(
        "${BalhomAPIContract.balanceType}/${balanceTypeEnum.name.toUpperCase()}/$name");
    // Check if there is a request failure
    return response.fold((failure) => left(failure),
        (value) => right(BalanceTypeEntity.fromJson(value.data)));
  }

  Future<Either<Failure, List<BalanceTypeEntity>>> list(
      final BalanceTypeEnum balanceTypeEnum) async {
    final String balanceTypeUrl =
        "${BalhomAPIContract.balanceType}/${balanceTypeEnum.name.toUpperCase()}";
    final response = await apiClient.getRequest(balanceTypeUrl);
    // Check if there is a request failure
    return await response.fold((failure) => left(failure), (value) async {
      final List<dynamic> responseList = value.data as List;
      final List<BalanceTypeEntity> balanceTypes =
          responseList.map((data) => BalanceTypeEntity.fromJson(data)).toList();
      return right(balanceTypes);
    });
  }
}
