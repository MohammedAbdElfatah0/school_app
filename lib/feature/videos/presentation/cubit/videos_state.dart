part of 'videos_cubit.dart';

sealed class VideosState {}

final class VideosInitial extends VideosState {}

final class VideosLoading extends VideosState {}

final class VideosSuccess extends VideosState {
  final List<VideoModel> videos;
  VideosSuccess({required this.videos});
}

final class VideosError extends VideosState {
  final String message;
  VideosError({required this.message});
}
