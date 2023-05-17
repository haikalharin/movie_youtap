



import 'package:netplix/common/exceptions/server_exception.dart';

class FirebaseAuthErrorException extends BaseException {
  FirebaseAuthErrorException(Map<String, dynamic> error)
      : super(
          message: error['message'],
          code: 200,
          errors: <ErrorList>[],
        );
}
