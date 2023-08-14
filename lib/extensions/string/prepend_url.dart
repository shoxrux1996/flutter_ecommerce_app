extension PrependUrl on String {
  String toUrl() {
    return 'http://192.168.68.114:8080$this';
  }
}
