class SelectionPopupModel {
  SelectionPopupModel(
      {this.id, required this.title, this.value, this.isSelected = false});
  int? id;
  String title;
  dynamic value;
  bool isSelected;
}
