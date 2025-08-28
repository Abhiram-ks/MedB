
class UserDetailsEntity {
  final String userId;
  final String? clinicId;
  final String? doctorId;
  final List<String>? doctorClinics;
  final String firstName;
  final String? middleName;
  final String lastName;
  final int? age;
  final String? gender;
  final String? designation;
  final String contactNo;
  final String? address;
  final String? city;
  final String? district;
  final String? state;
  final String? country;
  final String? postalCode;
  final String? profilePicture;
  final String email;

  UserDetailsEntity({
    required this.userId,
    this.clinicId,
    this.doctorId,
    this.doctorClinics,
    required this.firstName,
    this.middleName,
    required this.lastName,
    this.age,
    this.gender,
    this.designation,
    required this.contactNo,
    this.address,
    this.city,
    this.district,
    this.state,
    this.country,
    this.postalCode,
    this.profilePicture,
    required this.email,
  });
}
