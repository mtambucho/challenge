///extension on String to capitalize the first letter
extension StringHelper on String {
  String capitalize() {
    if (isEmpty) {
      return '';
    }
    return "${this[0].toUpperCase()}${substring(1)}";
  }
}
