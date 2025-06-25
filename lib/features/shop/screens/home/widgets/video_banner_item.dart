// import 'package:flutter/material.dart';
// import 'package:video_player/video_player.dart';
// import '../../../../../common/widgets/images/t_rounded_image.dart';
// import '../../../../../utils/constants/sizes.dart';

// class VideoBannerItem extends StatefulWidget {
//   final String videoUrl;
//   final String? thumbnailUrl;
//   final VoidCallback? onTap;

//   const VideoBannerItem({
//     super.key,
//     required this.videoUrl,
//     this.thumbnailUrl,
//     this.onTap,
//   });

//   @override
//   State<VideoBannerItem> createState() => _VideoBannerItemState();
// }

// class _VideoBannerItemState extends State<VideoBannerItem> {
//   late VideoPlayerController _videoController;
//   bool _isInitialized = false;
//   bool _isPlaying = false;

//   @override
//   void initState() {
//     super.initState();
//     _initializeVideo();
//   }

//   Future<void> _initializeVideo() async {
//     _videoController = VideoPlayerController.networkUrl(Uri.parse(widget.videoUrl));
//     await _videoController.initialize();
//     _videoController.setLooping(true);
//     setState(() => _isInitialized = true);
//   }


//   @override
//   void dispose() {
//     _videoController.dispose();
//     super.dispose();
//   }

//   void _togglePlayPause() {
//     setState(() {
//       if (_videoController.value.isPlaying) {
//         _videoController.pause();
//         _isPlaying = false;
//       } else {
//         _videoController.play();
//         _isPlaying = true;
//       }
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: widget.onTap,
//       child: ClipRRect(
//         borderRadius: BorderRadius.circular(TSizes.md),
//         child: Stack(
//           alignment: Alignment.center,
//           children: [
//             // Video or thumbnail
//             _isInitialized
//                 ? AspectRatio(
//                     aspectRatio: _videoController.value.aspectRatio,
//                     child: VideoPlayer(_videoController),
//                   )
//                 : widget.thumbnailUrl != null
//                     ? TRoundedImage(
//                         imageUrl: widget.thumbnailUrl!,
//                         isNetworkImage: true,
//                       )
//                     : const Center(child: CircularProgressIndicator()),

//             // Centered Play/Pause button
//             if (_isInitialized)
//               IconButton(
//                 icon: Icon(
//                   _isPlaying ? Icons.pause_circle_filled : Icons.play_circle_fill,
//                   size: 64,
//                   color: Colors.white.withOpacity(0.9),
//                 ),
//                 onPressed: _togglePlayPause,
//               ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// // 2nd version
// import 'package:flutter/material.dart';
// import 'package:video_player/video_player.dart';
// import '../../../../../common/widgets/images/t_rounded_image.dart';
// import '../../../../../utils/constants/sizes.dart';

// class VideoBannerItem extends StatefulWidget {
//   final String videoUrl;
//   final String? thumbnailUrl;
//   final VoidCallback? onTap;
//   final bool autoPlay;

//   const VideoBannerItem({
//     super.key,
//     required this.videoUrl,
//     this.thumbnailUrl,
//     this.onTap,
//     this.autoPlay = false,
//   });

//   @override
//   State<VideoBannerItem> createState() => _VideoBannerItemState();
// }

// class _VideoBannerItemState extends State<VideoBannerItem> {
//   late VideoPlayerController _videoController;
//   bool _isInitialized = false;
//   bool _isPlaying = false;

//   @override
//   void initState() {
//     super.initState();
//     _initializeVideo();
//   }

//   Future<void> _initializeVideo() async {
//     _videoController = VideoPlayerController.networkUrl(Uri.parse(widget.videoUrl));
//     await _videoController.initialize();
//     _videoController.setLooping(false);
    
//     _videoController.addListener(_videoListener);
    
//     setState(() => _isInitialized = true);
//     if (widget.autoPlay) {
//       _videoController.play();
//       _isPlaying = true;
//     }
//   }

//   void _videoListener() {
//     if (!_videoController.value.isPlaying && 
//         _videoController.value.position == _videoController.value.duration) {
//       widget.onTap?.call();
//     }
//   }

//   @override
//   void dispose() {
//     _videoController.removeListener(_videoListener);
//     _videoController.dispose();
//     super.dispose();
//   }

//   void _togglePlayPause() {
//     setState(() {
//       if (_videoController.value.isPlaying) {
//         _videoController.pause();
//         _isPlaying = false;
//       } else {
//         _videoController.play();
//         _isPlaying = true;
//       }
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: widget.onTap,
//       child: ClipRRect(
//         borderRadius: BorderRadius.circular(TSizes.md),
//         child: Stack(
//           alignment: Alignment.center,
//           children: [
//             // Video or thumbnail
//             _isInitialized
//                 ? AspectRatio(
//                     aspectRatio: _videoController.value.aspectRatio,
//                     child: VideoPlayer(_videoController),
//                   )
//                 : widget.thumbnailUrl != null
//                     ? TRoundedImage(
//                         imageUrl: widget.thumbnailUrl!,
//                         isNetworkImage: true,
//                       )
//                     : const Center(child: CircularProgressIndicator()),

//             // Play/Pause button
//             if (_isInitialized)
//               IconButton(
//                 icon: Icon(
//                   _isPlaying ? Icons.pause_circle_filled : Icons.play_circle_fill,
//                   size: 64,
//                   color: Colors.white.withOpacity(0.9),
//                 ),
//                 onPressed: _togglePlayPause,
//               ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// // 3rd version (Correct)
// import 'package:flutter/material.dart';
// import 'package:flutter_cache_manager/flutter_cache_manager.dart';
// import 'package:get/get.dart';
// import 'package:video_player/video_player.dart';
// import '../../../../../common/widgets/images/t_rounded_image.dart';
// import '../../../../../utils/constants/sizes.dart';
// import '../../../../../features/shop/controllers/banner_controller.dart';

// class VideoBannerItem extends StatefulWidget {
//   final String videoUrl;
//   final String? thumbnailUrl;
//   final VoidCallback? onTap;
//   final bool autoPlay;

//   const VideoBannerItem({
//     super.key,
//     required this.videoUrl,
//     this.thumbnailUrl,
//     this.onTap,
//     this.autoPlay = false,
//   });

//   @override
//   State<VideoBannerItem> createState() => _VideoBannerItemState();
// }

// class _VideoBannerItemState extends State<VideoBannerItem> {
//   late VideoPlayerController _videoController;
//   bool _isInitialized = false;
//   bool _isPlaying = false;
//   final BannerController _bannerController = Get.find();

//   @override
//   void initState() {
//     super.initState();
//     _initializeVideo();
//   }

//   Future<void> _initializeVideo() async {
//     _videoController = VideoPlayerController.networkUrl(Uri.parse(widget.videoUrl));
//     await _videoController.initialize();
//     _videoController.setLooping(false);
    
//     _videoController.addListener(_videoListener);
    
//     setState(() => _isInitialized = true);
//     if (widget.autoPlay) {
//       _playVideo();
//     }
//   }

//   void _videoListener() {
//     final isPlaying = _videoController.value.isPlaying;
//     final position = _videoController.value.position;
//     final duration = _videoController.value.duration;
    
//     _bannerController.setVideoPlaying(
//       isPlaying,
//       duration: duration.inSeconds,
//     );

//     if (!isPlaying && position == duration) {
//       widget.onTap?.call();
//     }
//   }

//   void _playVideo() {
//     _videoController.play();
//     setState(() => _isPlaying = true);
//     _bannerController.setVideoPlaying(true);
//   }

//   void _pauseVideo() {
//     _videoController.pause();
//     setState(() => _isPlaying = false);
//     _bannerController.setVideoPlaying(false);
//   }

//   @override
//   void dispose() {
//     _videoController.removeListener(_videoListener);
//     _videoController.dispose();
//     _bannerController.setVideoPlaying(false);
//     super.dispose();
//   }

//   void _togglePlayPause() {
//     if (_isPlaying) {
//       _pauseVideo();
//     } else {
//       _playVideo();
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: widget.onTap,
//       child: ClipRRect(
//         borderRadius: BorderRadius.circular(TSizes.md),
//         child: Stack(
//           alignment: Alignment.center,
//           children: [
//             _isInitialized
//                 ? AspectRatio(
//                     aspectRatio: _videoController.value.aspectRatio,
//                     child: VideoPlayer(_videoController),
//                   )
//                 : widget.thumbnailUrl != null
//                     ? TRoundedImage(
//                         imageUrl: widget.thumbnailUrl!,
//                         isNetworkImage: true,
//                       )
//                     : const Center(child: CircularProgressIndicator()),

//             if (_isInitialized)
//               IconButton(
//                 icon: Icon(
//                   _isPlaying ? Icons.pause_circle_filled : Icons.play_circle_fill,
//                   size: 64,
//                   color: Colors.white.withOpacity(0.9),
//                 ),
//                 onPressed: _togglePlayPause,
//               ),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';
import '../../../../../common/widgets/images/t_rounded_image.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../features/shop/controllers/banner_controller.dart';

class VideoBannerItem extends StatefulWidget {
  final String videoUrl;
  final String? thumbnailUrl;
  final VoidCallback? onTap;
  final bool autoPlay;

  const VideoBannerItem({
    super.key,
    required this.videoUrl,
    this.thumbnailUrl,
    this.onTap,
    this.autoPlay = false,
  });

  @override
  State<VideoBannerItem> createState() => _VideoBannerItemState();
}

class _VideoBannerItemState extends State<VideoBannerItem> {
  late VideoPlayerController _videoController;
  bool _isInitialized = false;
  bool _isPlaying = false;
  bool _cacheFailed = false;
  final BannerController _bannerController = Get.find();

  @override
  void initState() {
    super.initState();
    _initializeVideoWithCache();
  }

  Future<void> _initializeVideoWithCache() async {
    try {
      // Try to get the cached file first
      final file = await DefaultCacheManager().getSingleFile(
        widget.videoUrl,
        headers: {'Cache-Control': 'max-age=604800'}, // 1 week cache
      );
      
      _initializeVideoController(VideoPlayerController.file(file));
    } catch (e) {
      // If cache fails, fall back to network
      if (mounted) {
        setState(() => _cacheFailed = true);
      }
      _initializeVideoController(
        VideoPlayerController.networkUrl(
          Uri.parse(widget.videoUrl),
          httpHeaders: {'Cache-Control': 'max-age=604800'},
        )
      );
    }
  }

  void _initializeVideoController(VideoPlayerController controller) {
    _videoController = controller
      ..initialize().then((_) {
        if (!mounted) return;
        
        _videoController.setLooping(false);
        _videoController.addListener(_videoListener);
        
        setState(() => _isInitialized = true);
        if (widget.autoPlay) {
          _playVideo();
        }
      }).catchError((error) {
        if (mounted) {
          setState(() => _isInitialized = false);
        }
      });
  }

  void _videoListener() {
    final isPlaying = _videoController.value.isPlaying;
    final position = _videoController.value.position;
    final duration = _videoController.value.duration;
    
    _bannerController.setVideoPlaying(
      isPlaying,
      duration: duration.inSeconds,
    );

    if (!isPlaying && position == duration) {
      widget.onTap?.call();
    }
  }

  void _playVideo() {
    _videoController.play();
    setState(() => _isPlaying = true);
    _bannerController.setVideoPlaying(true);
  }

  void _pauseVideo() {
    _videoController.pause();
    setState(() => _isPlaying = false);
    _bannerController.setVideoPlaying(false);
  }

  @override
  void dispose() {
    _videoController.removeListener(_videoListener);
    _videoController.dispose();
    _bannerController.setVideoPlaying(false);
    super.dispose();
  }

  void _togglePlayPause() {
    if (_isPlaying) {
      _pauseVideo();
    } else {
      _playVideo();
    }
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
            if (_isInitialized)
              AspectRatio(
                aspectRatio: _videoController.value.aspectRatio,
                child: VideoPlayer(_videoController),
              )
            else if (widget.thumbnailUrl != null)
              TRoundedImage(
                imageUrl: widget.thumbnailUrl!,
                isNetworkImage: true,
              )
            else
              const Center(child: CircularProgressIndicator()),

            if (_isInitialized)
              IconButton(
                icon: Icon(
                  _isPlaying ? Icons.pause_circle_filled : Icons.play_circle_fill,
                  size: 64,
                  color: Colors.white.withOpacity(0.9),
                ),
                onPressed: _togglePlayPause,
              ),
              
            if (_cacheFailed && _isInitialized)
              Positioned(
                bottom: 8,
                right: 8,
                child: Container(
                  padding: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    color: Colors.black54,
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: const Text(
                    'Streaming',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 10,
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}