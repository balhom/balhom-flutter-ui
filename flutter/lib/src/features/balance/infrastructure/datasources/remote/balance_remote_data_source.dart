import 'package:balance_home_app/src/core/clients/api_client/api_client.dart';
import 'package:balance_home_app/src/core/domain/entities/pagination_entity.dart';
import 'package:balance_home_app/src/core/domain/failures/failure.dart';
import 'package:balance_home_app/src/features/balance/domain/entities/balance_entity.dart';
import 'package:balance_home_app/config/balhom_api_contract.dart';
import 'package:balance_home_app/src/features/balance/domain/entities/balance_years_entity.dart';
import 'package:balance_home_app/src/features/balance/domain/enums/balance_sorting_enum.dart';
import 'package:balance_home_app/src/features/balance/domain/enums/balance_type_enum.dart';
import 'package:fpdart/fpdart.dart';
import 'package:intl/intl.dart';

class BalanceRemoteDataSource {
  final ApiClient apiClient;

  BalanceRemoteDataSource({required this.apiClient});

  Future<Either<Failure, BalanceEntity>> get(final int id) async {
    final response = await apiClient
        .getRequest('${BalhomAPIContract.balance}/${id.toString()}');
    // Check if there is a request failure
    return response.fold((failure) => left(failure),
        (value) => right(BalanceEntity.fromJson(value.data)));
  }

  Future<Either<Failure, List<BalanceEntity>>> list(
      {required BalanceTypeEnum balanceTypeEnum,
      required BalanceSortingEnum balanceSortingEnum,
      required int page,
      DateTime? dateFrom,
      DateTime? dateTo}) async {
    final Map<String, dynamic> queryParameters = {
      "page": page,
      "sorting": balanceSortingEnum.value,
      "balance_type": balanceTypeEnum.name.toUpperCase()
    };
    if (dateFrom != null) {
      queryParameters["date_from"] = DateFormat('yyyy-MM-dd').format(dateFrom);
    }
    if (dateTo != null) {
      queryParameters["date_to"] = DateFormat('yyyy-MM-dd').format(dateTo);
    }
    final response = await apiClient.getRequest(BalhomAPIContract.balance,
        queryParameters: queryParameters);
    // Check if there is a request failure
    return await response.fold((failure) => left(failure), (value) async {
      final PaginationEntity page = PaginationEntity.fromJson(value.data);
      return right(page.results.map((balance) {
        return BalanceEntity.fromJson(balance);
      }).toList());
    });
  }

  Future<Either<Failure, List<int>>> getYears(
      final BalanceTypeEnum balanceTypeEnum) async {
    final String balanceUrl =
        "${BalhomAPIContract.balanceYears}/${balanceTypeEnum.name.toUpperCase()}";

    final response = await apiClient.getRequest(balanceUrl);
    // Check if there is a request failure
    return response.fold((failure) => left(failure),
        (value) => right(BalanceYearsEntity.fromJson(value.data).years));
  }

  Future<Either<Failure, BalanceEntity>> create(
      final BalanceEntity balance) async {
    final response = await apiClient.postRequest(BalhomAPIContract.balance,
        data: balance.toJson());
    // Check if there is a request failure
    return response.fold((failure) => left(failure),
        (value) => right(BalanceEntity.fromJson(value.data)));
  }

  Future<Either<Failure, BalanceEntity>> update(
      final BalanceEntity balance) async {
    final response = await apiClient.putRequest(
        '${BalhomAPIContract.balance}/${balance.id.toString()}',
        data: balance.toJson());
    // Check if there is a request failure
    return response.fold((failure) => left(failure),
        (value) => right(BalanceEntity.fromJson(value.data)));
  }

  Future<Either<Failure, void>> delete(final BalanceEntity balance) async {
    final response = await apiClient
        .delRequest('${BalhomAPIContract.balance}/${balance.id.toString()}');
    // Check if there is a request failure
    return response.fold((failure) => left(failure), (_) => right(null));
  }
}
