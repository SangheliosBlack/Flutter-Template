class ClientFormState {

  final String name;
  final String phone;
  final String address;
  final String reference;

  ClientFormState({
    this.name = "",
    this.phone = "",
    this.address = "",
    this.reference = "",
  });

  ClientFormState copyWith({
    String? name,
    String? phone,
    String? address,
    String? reference,
  }) {
    return ClientFormState(
      name: name ?? this.name,
      phone: phone ?? this.phone,
      address: address ?? this.address,
      reference: reference ?? this.reference,
    );
  }

  bool get isValid {

    final phoneSanitized = phone.replaceAll(" ", "");
    
    return name.isNotEmpty && phone.isNotEmpty && phoneSanitized.length >= 10 && address.isNotEmpty;
    
  }

}