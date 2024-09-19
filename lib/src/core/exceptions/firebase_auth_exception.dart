class HFirebaseAuthException implements Exception {
  final String code;

  HFirebaseAuthException({required this.code});
  Exception get message {
    switch (code) {
      case 'password-mismatch':
        return Exception(
            'The password and repeated password do not match. Please make sure both fields are identical.');
      case 'unknown':
        return Exception(
            'An unknown Firebase error has occurred. Please try again.');
      case 'user-disabled':
        return Exception('The user account has been disabled.');
      case 'user-not-found':
        return Exception('No user found with the given email address or UID.');
      case 'invalid-email':
        return Exception(
            'The provided email address is invalid. Please enter a valid email address.');
      case 'email-already-in-use':
        return Exception(
            'The email address is already registered. Please use a different email address.');
      case 'wrong-password':
        return Exception(
            'Incorrect password. Please check your password and try again.');
      case 'weak-password':
        return Exception(
            'The password is too weak. Please choose a stronger password.');
      case 'provider-already-linked':
        return Exception(
            'The account is already linked with a different provider.');
      case 'operation-not-allowed':
        return Exception(
            'This operation is not allowed. Please contact support for assistance.');
      case 'invalid-credential':
        return Exception(
            'The provided credential is either incorrect or expired.');
      case 'account-exists-with-different-credential':
        return Exception(
            'An account already exists with the same email but with different credentials.');
      case 'user-token-expired':
        return Exception(
            'The user token has expired, re-authentication is required. Please log in again.');
      case 'credential-already-in-use':
        return Exception(
            'This credential is already associated with another user account.');
      default:
        return Exception(
            'An unexpected Firebase error has occurred. Please try again.');
    }
    // switch (code) {
    //   case 'unknown':
    //     return 'Đã xảy ra một lỗi Firebase không xác định. Vui lòng thử lại.';
    //   case 'user-disabled':
    //     return 'Tài khoản người dùng đã bị vô hiệu hóa.';
    //   case 'user-not-found':
    //     return 'Không tìm thấy người dùng với địa chỉ email hoặc UID đã cho.';
    //   case 'invalid-email':
    //     return 'Địa chỉ email cung cấp không hợp lệ. Vui lòng nhập một địa chỉ email hợp lệ.';
    //   case 'email-already-in-use':
    //     return 'Địa chỉ email đã được đăng ký. Vui lòng sử dụng một địa chỉ email khác.';
    //   case 'wrong-password':
    //     return 'Mật khẩu không đúng. Vui lòng kiểm tra mật khẩu và thử lại.';
    //   case 'weak-password':
    //     return 'Mật khẩu quá yếu. Vui lòng chọn một mật khẩu mạnh hơn.';
    //   case 'provider-already-linked':
    //     return 'Tài khoản đã được liên kết với một nhà cung cấp khác.';
    //   case 'operation-not-allowed':
    //     return 'Thao tác này không được phép. Liên hệ với hỗ trợ để được hỗ trợ.';
    //   case 'invalid-credential':
    //     return 'Chứng chỉ cung cấp bị lỗi hoặc đã hết hạn.';
    //   case 'account-exists-with-different-credential':
    //     return 'Một tài khoản đã tồn tại với cùng một email nhưng với thông tin đăng nhập khác nhau.';
    //   case 'user-token-expired':
    //     return 'Token người dùng đã hết hạn, yêu cầu xác thực lại. Vui lòng đăng nhập lại.';
    //   case 'credential-already-in-use':
    //     return 'Chứng chỉ này đã được liên kết với một tài khoản người dùng khác.';
    //   default:
    //     return 'Đã xảy ra một lỗi Firebase không mong đợi. Vui lòng thử lại.';
    // }
  }
}
