extension PrependUrl on String {
  String toUrl() {
    return 'http://valiant.local/$this';
  }
}
