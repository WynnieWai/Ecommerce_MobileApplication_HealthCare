import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import '../../../../../common/widgets/images/t_rounded_image.dart';
import '../../../../../utils/constants/sizes.dart';

class VideoBannerItem extends StatefulWidget {
  final String videoUrl;
  final String? thumbnailUrl;
  final VoidCallback? onTap;

  const VideoBannerItem({
    super.key,
    required this.videoUrl,
    this.thumbnailUrl,
    this.onTap,
  });

  @override
  State<VideoBannerItem> createState() => _VideoBannerItemState();
}

class _VideoBannerItemState extends State<VideoBannerItem> {
  late VideoPlayerController _videoController;
  bool _isInitialized = false;
  bool _isPlaying = false;

  @override
  void initState() {
    super.initState();
    _initializeVideo();
  }

  Future<void> _initializeVideo() async {
    _videoController = VideoPlayerController.networkUrl(Uri.parse(widget.videoUrl));
    await _videoController.initialize();
    _videoController.setLooping(true);
    setState(() => _isInitialized = true);
  }

  @override
  void dispose() {
    _videoController.dispose();
    super.dispose();
  }

  void _togglePlayPause() {
    setState(() {
      if (_videoController.value.isPlaying) {
        _videoController.pause();
        _isPlaying = false;
      } else {
        _videoController.play();
        _isPlaying = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(TSizes.md),
        child: Stack(
          alignment: Alignment.center,
          children: [
            // Video or thumbnail
            _isInitialized
                ? AspectRatio(
                    aspectRatio: _videoController.value.aspectRatio,
                    child: VideoPlayer(_videoController),
                  )
                : widget.thumbnailUrl != null
                    ? TRoundedImage(
                        imageUrl: widget.thumbnailUrl!,
                        isNetworkImage: true,
                      )
                    : const Center(child: CircularProgressIndicator()),

            // Centered Play/Pause button
            if (_isInitialized)
              IconButton(
                icon: Icon(
                  _isPlaying ? Icons.pause_circle_filled : Icons.play_circle_fill,
                  size: 64,
                  color: Colors.white.withOpacity(0.9),
                ),
                onPressed: _togglePlayPause,
              ),
          ],
        ),
      ),
    );
  }
}
