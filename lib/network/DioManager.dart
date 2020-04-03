import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wardrobe/Config.dart';
import 'package:wardrobe/network/Apis.dart';

import 'LogsInterceptors.dart';
import 'RequestMethod.dart';
import 'entity/BaseEntity.dart';
import 'entity/ErrorEntity.dart';

// https://www.yht7.com/news/16734
class DioManager {
  static final DioManager _dioManager = DioManager._internal();

  factory DioManager() => _dioManager;
  Dio dio;

  DioManager._internal() {
    if (dio == null) {
      BaseOptions options = BaseOptions(
          baseUrl: Apis.BASE_URL,
          contentType: Headers.formUrlEncodedContentType,
          responseType: ResponseType.json,
         headers: {
           'Authorization': SharedPreferences.getInstance()
               .then((value) => value.getString(Config.TOKEN_KEY))
         },
          receiveDataWhenStatusError: false,
          connectTimeout: Config.TIMEOUT_CONNECT,
          receiveTimeout: Config.TIMEOUT_RECEIVE);
      dio = Dio(options);
    }
    if (Config.DEBUG) {
      dio.interceptors.add(LogsInterceptors());
    }
  }

  Future request<T>(RequestMethod method, String path,
      {Map<String, dynamic> map,
//      FormData form,
      Function(T) successCallBack,
      Function(ErrorEntity) errCallBack}) async {
    Response response;
    try {
      if (method == RequestMethod.POST) {
        response = await dio.post(path,
            data: map, options: Options(method: RequestMethodValues[method]));
      } else if (method == RequestMethod.GET) {
        response = await dio.get(path,
            queryParameters: map,
            options: Options(method: RequestMethodValues[method]));
      }

      if (response != null) {
        BaseEntity entity = BaseEntity<T>.fromJson(response.data);

        print('返回数据 => ${entity.data}');

        if (entity.code == 200) {
          successCallBack(entity.data);
        } else {
          errCallBack(ErrorEntity(code: entity.code, message: entity.message));
        }
      } else {
        errCallBack(ErrorEntity(code: -1, message: "未知错误"));
      }
    } on DioError catch (e) {
      errCallBack(createErrorEntity(e));
    }
  }

  ErrorEntity createErrorEntity(DioError error) {
    switch (error.type) {
      case DioErrorType.CANCEL:
        {
          return ErrorEntity(code: -1, message: "请求取消");
        }
        break;
      case DioErrorType.CONNECT_TIMEOUT:
        {
          return ErrorEntity(code: -1, message: "连接超时");
        }
        break;
      case DioErrorType.SEND_TIMEOUT:
        {
          return ErrorEntity(code: -1, message: "请求超时");
        }
        break;
      case DioErrorType.RECEIVE_TIMEOUT:
        {
          return ErrorEntity(code: -1, message: "响应超时");
        }
        break;
      case DioErrorType.RESPONSE:
        {
          try {
            int errCode = error.response.statusCode;
            String errMsg = error.response.statusMessage;
            return ErrorEntity(code: errCode, message: errMsg);
//     switch (errCode) {
//      case 400: {
//       return ErrorEntity(code: errCode, message: "请求语法错误");
//      }
//      break;
//      case 403: {
//       return ErrorEntity(code: errCode, message: "服务器拒绝执行");
//      }
//      break;
//      case 404: {
//       return ErrorEntity(code: errCode, message: "无法连接服务器");
//      }
//      break;
//      case 405: {
//       return ErrorEntity(code: errCode, message: "请求方法被禁止");
//      }
//      break;
//      case 500: {
//       return ErrorEntity(code: errCode, message: "服务器内部错误");
//      }
//      break;
//      case 502: {
//       return ErrorEntity(code: errCode, message: "无效的请求");
//      }
//      break;
//      case 503: {
//       return ErrorEntity(code: errCode, message: "服务器挂了");
//      }
//      break;
//      case 505: {
//       return ErrorEntity(code: errCode, message: "不支持HTTP协议请求");
//      }
//      break;
//      default: {
//       return ErrorEntity(code: errCode, message: "未知错误");
//      }
//     }
          } on Exception catch (_) {
            return ErrorEntity(code: -1, message: "未知错误");
          }
        }
        break;
      default:
        {
          return ErrorEntity(code: -1, message: error.message);
        }
    }
  }
}
