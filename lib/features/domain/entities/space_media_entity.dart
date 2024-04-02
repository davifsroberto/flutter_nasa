import 'package:equatable/equatable.dart';

class SpaceMediaEntity extends Equatable {
  final String description;
  final String mediaType;
  final String title;
  final String mediaURL;

  SpaceMediaEntity({
    required this.description,
    required this.mediaType,
    required this.title,
    required this.mediaURL,
  });

  @override
  List<Object> get props => [
        description,
        mediaType,
        title,
        mediaURL,
      ];
}
