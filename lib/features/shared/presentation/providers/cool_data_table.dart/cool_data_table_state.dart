class CoolDataTableState {

  final int showQuantity;
  final int currentPage;

  const CoolDataTableState({
      this.showQuantity = 0,
      this.currentPage = 1

  });
  
  CoolDataTableState copyWith({
    int? showQuantity,
    int? currentPage
  }){
    return CoolDataTableState(
      showQuantity: showQuantity ?? this.showQuantity,
      currentPage: currentPage ?? this.currentPage
    );

  }

}