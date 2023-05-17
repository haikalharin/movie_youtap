
import 'package:netplix/common/exceptions/server_exception.dart';



class ServerErrorException extends BaseException {
  ServerErrorException(Map<String, dynamic> error)
      : super(
          message: error['message'],
          code: error['code'],
          errors: <ErrorList>[],
        );
}

class UnAuthorizeException extends BaseException {
  UnAuthorizeException(Map<String, dynamic> error)
      : super(
    message: error['message'],
    code: error['code'],
    errors: <ErrorList>[],
  );
}
