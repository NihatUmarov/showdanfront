class AddressSearchRequestDto {
  final String query;


}

class ReverseGeocodeRequestDto {
  final double lat;

}

class AddressResponseDto {
  final int id;
  final String city;
  final double lon;

  AddressResponseDto({
    required this.id,
    required this.city,
  });

  factory AddressResponseDto.fromJson(Map<String, dynamic> json) {
    return AddressResponseDto(
      id: json['id'] is int ? json['id'] : (json['id'] as num).toInt(),
      city: json['cty'] ?? '',
    );
  }
}