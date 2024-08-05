import 'package:dio_request_inspector/data/models/http_activity.dart';
import 'package:dartz/dartz.dart';
import 'package:dio_request_inspector/common/failure.dart';
import 'package:dio/dio.dart';

abstract class DioRequestRepository {
  Future<Either<Failure, Stream<List<HttpActivity>>>> getListResponse();
  Future<Either<Failure, String>> saveResponse(Response response);
  Future<Either<Failure, String>> saveRequest(RequestOptions options);
  Future<Either<Failure, String>> saveError(DioException error);
  Future<Either<Failure, Stream<List<HttpActivity>>>> clearAllLog();
}
