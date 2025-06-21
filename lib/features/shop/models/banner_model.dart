import 'package:cloud_firestore/cloud_firestore.dart';

class BannerModel {
  final String? imageUrl;
  final String? videoUrl;
  final String type;
  final String? thumbnailUrl;
  final String? targetScreen;
  final bool active;

  BannerModel({
    this.imageUrl, 
    this.videoUrl,
    required this.type,
    this.targetScreen, 
    required this.active,
    this.thumbnailUrl,
  });

  Map<String, dynamic> toJson() {
    return {
      'Active': active,
      'ImageUrl': imageUrl,
      'VideoUrl': videoUrl,
      'TargetScreen': targetScreen,
      'Type': type,
      'ThumbnailUrl': thumbnailUrl,
    };
  }

  // factory BannerModel.fromSnapshot(DocumentSnapshot snapshot) {
  //   final data = snapshot.data() as Map<String, dynamic>;
  //   return BannerModel(
  //     imageUrl: data['ImageUrl'] ?? '',
  //     targetScreen: data['TargetScreen'] ?? '',
  //     active: data['Active'] ?? false,
  //   );
  // Create from Firestore DocumentSnapshot
  factory BannerModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> snapshot) {
    final data = snapshot.data()!;
    return BannerModel(
      active: data['Active'] ?? false,
      imageUrl: data['ImageUrl'],
      videoUrl: data['VideoUrl'],
      targetScreen: data['TargetScreen'],
      type: data['Type'] ?? 'image', // Default to image if not specified
      thumbnailUrl: data['ThumbnailUrl'],
    );
  }
}
