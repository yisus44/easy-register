class ResponseDto<T> {
  final int status;
  final T data;
  final String? error;

  ResponseDto(this.status, this.data, this.error);
}
