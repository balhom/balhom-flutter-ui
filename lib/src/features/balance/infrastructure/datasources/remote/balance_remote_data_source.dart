import 'package:balhom/src/core/clients/api_client.dart';
import 'package:balhom/src/core/domain/entities/pagination_entity.dart';
import 'package:balhom/src/core/domain/failures/failure.dart';
import 'package:balhom/src/features/balance/domain/entities/balance_entity.dart';
import 'package:balhom/config/balhom_api_contract.dart';
import 'package:balhom/src/features/balance/domain/entities/balance_summary_entity.dart';
import 'package:balhom/src/features/balance/domain/enums/balance_sorting_enum.dart';
import 'package:balhom/src/features/balance/domain/enums/balance_type_enum.dart';
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
      required DateTime dateFrom,
      required DateTime dateTo}) async {
    final Map<String, dynamic> queryParameters = {
      "page": page,
      "sorting": balanceSortingEnum.value,
      "balance_type": balanceTypeEnum.name.toUpperCase(),
      "date_from": DateFormat('yyyy-MM-dd').format(dateFrom),
      "date_to": DateFormat('yyyy-MM-dd').format(dateTo)
    };
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
    return response.fold(
        (failure) => left(failure),
        (value) =>
            right((value.data as List<dynamic>).map((e) => e as int).toList()));
  }

  Future<Either<Failure, List<BalanceSummaryEntity>>> getMonthSummary(
      final int month, final int year) async {
    final String balanceUrl =
        "${BalhomAPIContract.balanceSummary}/$year/$month";
    final response = await apiClient.getRequest(balanceUrl);
    // Check if there is a request failure
    return response.fold((failure) => left(failure), (value) {
      final List<dynamic> responseList = value.data as List;
      final List<BalanceSummaryEntity> summaryList = responseList
          .map((data) => BalanceSummaryEntity.fromJson(data))
          .toList();
      return right(summaryList);
    });
  }

  Future<Either<Failure, List<BalanceSummaryEntity>>> getYearSummary(
      final int year) async {
    final String balanceUrl = "${BalhomAPIContract.balanceSummary}/$year";
    final response = await apiClient.getRequest(balanceUrl);
    // Check if there is a request failure
    return response.fold((failure) => left(failure), (value) {
      final List<dynamic> responseList = value.data as List;
      final List<BalanceSummaryEntity> summaryList = responseList
          .map((data) => BalanceSummaryEntity.fromJson(data))
          .toList();
      return right(summaryList);
    });
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

  Future<Either<Failure, void>> delete(final int id) async {
    final response = await apiClient
        .delRequest('${BalhomAPIContract.balance}/${id.toString()}');
    // Check if there is a request failure
    return response.fold((failure) => left(failure), (_) => right(null));
  }
}
