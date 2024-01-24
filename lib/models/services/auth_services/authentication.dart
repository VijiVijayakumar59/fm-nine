import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;

class AuthService {
  final String baseUrl = 'https://fm9-malayalam.onrender.com/api';

  Future<Map<String, dynamic>> signUp(String userName, String email,
      String phoneNumber, String password) async {
    final String signUpUrl = '$baseUrl/signup';

    final Map<String, dynamic> requestBody = {
      'userName': userName,
      'email': email,
      'phoneNumber': phoneNumber,
      'password': password,
    };

    final response = await http.post(
      Uri.parse(signUpUrl),
      body: json.encode(requestBody),
      headers: {'Content-Type': 'application/json'},
    );

    log('Response from server: ${response.statusCode} - ${response.body}');

    if (response.statusCode == 200) {
      // Successful signup
      return {'success': true, 'message': 'Signup successful'};
    } else {
      // Check for non-JSON response
      if (response.headers['content-type']?.contains('application/json') !=
          true) {
        return {'success': false, 'error': 'Unexpected response format'};
      }

      // Try to decode JSON response
      try {
        final Map<String, dynamic> errorResponse = json.decode(response.body);
        return {'success': false, 'error': errorResponse['message']};
      } catch (e) {
        return {'success': false, 'error': 'Failed to decode server response'};
      }
    }
  }

//====================verify email otp =====================//

  Future<Map<String, dynamic>> verifyOTP(
    String userName,
    String email,
    String phoneNumber,
    String password,
    String otp,
  ) async {
    try {
      final String verifyOtpUrl = '$baseUrl/verify-email/$otp';
      final response = await http.post(
        Uri.parse(verifyOtpUrl),
        body: {
          'userName': userName,
          'email': email,
          'phoneNumber': phoneNumber,
          'password': password,
          'otp': otp,
        },
      );

      // Parse the response and return the result
      if (response.statusCode == 200) {
        return json.decode(response.body);
      } else {
        // Handle non-200 status code
        return {'success': false, 'error': 'Failed to verify OTP'};
      }
    } catch (error) {
      // Handle network or other errors
      return {
        'success': false,
        'error': 'Error during OTP verification: $error'
      };
    }
  }

//=========================Login=========================//

  Future<Map<String, dynamic>> login(String email, String password) async {
    try {
      final String loginUrl = '$baseUrl/login';

      final Map<String, dynamic> requestBody = {
        'email': email,
        'password': password,
      };

      final response = await http.post(
        Uri.parse(loginUrl),
        body: json.encode(requestBody),
        headers: {'Content-Type': 'application/json'},
      );

      log('Response from server: ${response.statusCode} - ${response.body}');

      if (response.statusCode == 200) {
        return {'success': true, 'message': 'Login successful'};
      } else {
        if (response.headers['content-type']?.contains('application/json') !=
            true) {
          return {'success': false, 'error': 'Unexpected response format'};
        }
        try {
          final Map<String, dynamic> errorResponse = json.decode(response.body);
          return {'success': false, 'error': errorResponse['message']};
        } catch (e) {
          return {
            'success': false,
            'error': 'Failed to decode server response'
          };
        }
      }
    } catch (error) {
      return {'success': false, 'error': 'Error during login: $error'};
    }
  }

  //======================phone number login======================//
Future<Map<String, dynamic>> loginWithPhoneNumber(String phoneNumber) async {
  final String loginUrl = '$baseUrl/phonenumber-login';

  final Map<String, dynamic> requestBody = {
    'phoneNumber': phoneNumber,
  };

  try {
    final response = await http.post(
      Uri.parse(loginUrl),
      body: json.encode(requestBody),
      headers: {'Content-Type': 'application/json'},
    );

    log('Response from server: ${response.statusCode} - ${response.body}');

    if (response.statusCode == 200) {
      // Successful login
      return {'success': true, 'message': 'Login successful'};
    } else {
      // Check for non-JSON response
      if (response.headers['content-type']?.contains('application/json') !=
          true) {
        return {'success': false, 'error': 'Unexpected response format'};
      }

      // Try to decode JSON response
      try {
        final Map<String, dynamic> errorResponse = json.decode(response.body);
        return {'success': false, 'error': errorResponse['message']};
      } catch (e) {
        return {
          'success': false,
          'error': 'Failed to decode server response'
        };
      }
    }
  } catch (error) {
    // Handle network or other errors
    return {
      'success': false,
      'error': 'Error during phone number login: $error',
    };
  }
}

//==================phone otp verify================//

  Future<Map<String, dynamic>> phoneOtp(
    String phoneNumber,
    String otp,
  ) async {
    final String verifyOtpUrl = '$baseUrl/verify-otp';

    final Map<String, dynamic> requestBody = {
      'phoneNumber': phoneNumber,
      'otp': otp,
    };

    try {
      final response = await http.post(
        Uri.parse(verifyOtpUrl),
        body: json.encode(requestBody),
        headers: {'Content-Type': 'application/json'},
      );

      log('Response from server: ${response.statusCode} - ${response.body}');

      if (response.statusCode == 200) {
        // Successful OTP verification
        return {'success': true, 'message': 'OTP verification successful'};
      } else {
        // Check for non-JSON response
        if (response.headers['content-type']?.contains('application/json') !=
            true) {
          return {'success': false, 'error': 'Unexpected response format'};
        }

        // Try to decode JSON response
        try {
          final Map<String, dynamic> errorResponse = json.decode(response.body);
          return {'success': false, 'error': errorResponse['message']};
        } catch (e) {
          return {
            'success': false,
            'error': 'Failed to decode server response'
          };
        }
      }
    } catch (error) {
      // Handle network or other errors
      return {
        'success': false,
        'error': 'Error during OTP verification: $error',
      };
    }
  }
}
