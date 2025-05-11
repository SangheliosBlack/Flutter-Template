class ApiResponse<T> {
  
  final String status;
  final String message;
  final T? data;

  ApiResponse({
    required this.status,
    required this.message,
    this.data,
  });

  factory ApiResponse.fromJson(Map<String, dynamic> json) {
    return ApiResponse<T>(
      status: json['status']?.toString() ?? 'UNKNOWN',
      message: json['message']?.toString() ?? '',
      data: json['data'] as T?,
    );
  }
}