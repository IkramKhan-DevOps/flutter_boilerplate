
class ProfileModel {
  final int pk;
  final String username;
  final String email;
  final String? firstName;
  final String? lastName;
  final String? profileImage;

  ProfileModel({
    required this.pk,
    required this.username,
    required this.email,
    this.firstName,
    this.lastName,
    this.profileImage,
  });

  factory ProfileModel.fromJson(Map<String, dynamic> json) {
    return ProfileModel(
      pk: json['pk'],
      username: json['username'],
      email: json['email'],
      firstName: json['first_name'],
      lastName: json['last_name'],
      profileImage: json['profile_image'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'pk': pk,
      'username': username,
      'email': email,
      'first_name': firstName,
      'last_name': lastName,
      'profile_image': profileImage,
    };
  }
}