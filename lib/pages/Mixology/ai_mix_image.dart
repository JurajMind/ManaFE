import 'dart:io';

import 'package:app/main_freya.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:chat_gpt_sdk/chat_gpt_sdk.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:openapi/src/model/pipe_accesory_simple_dto.dart';
import 'package:openapi/src/model/tobacco_mix_simple_dto.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:path_provider/path_provider.dart';

class AIMixImageWidget extends StatefulWidget {
  final TobaccoMixSimpleDto? mix;
  final PipeAccesorySimpleDto? tobacco;
  const AIMixImageWidget({super.key, this.mix, this.tobacco});

  @override
  State<AIMixImageWidget> createState() => _AIMixWidgetState();
}

class _AIMixWidgetState extends State<AIMixImageWidget> {
  @override
  void initState() {
    checkImageExist().then(
      (value) {
        if (!value) {
          _generateImage();
        }
      },
    );

    super.initState();
  }

  String img = "";
  String localFile = "";

  int get id => widget.tobacco?.id ?? widget.mix?.id ?? -1;
  void _generateImage() async {
    String prompt = "";
    if (widget.mix != null) {
      var mixFlavor = widget.mix!.tobaccos?.map((e) => e.tobacco?.name).join(' ');

      prompt = "HD photo of flavors : $mixFlavor on dark background , vibrant colors";
    }

    if (widget.tobacco != null) {
      prompt = "HD photo of  : ${widget.tobacco!.brand}  ${widget.tobacco!.name} on dark background , vibrant colors";
    }

    final request = GenerateImage(prompt, 1, size: ImageSize.size256, responseFormat: Format.url);
    var openAi = getIt.get<OpenAI>();
    final response = await openAi.generateImage(request);
    setState(() {
      img = "${response?.data?.last?.url}";
    });
    saveImageToTempDirectory(img);
  }

  Future<bool> checkImageExist() async {
    final tempDir = await getTemporaryDirectory();
    final tempFilePath = '${tempDir.path}/${this.id}_image.jpg';
    if (_checkFileExistsSync(tempFilePath)) {
      setState(() {
        localFile = tempFilePath;
      });
      return true;
    } else {
      return false;
    }
  }

  bool _checkFileExistsSync(String path) {
    return File(path).existsSync();
  }

  Future<void> saveImageToTempDirectory(String imageUrl) async {
    File cachedImage = await DefaultCacheManager().getSingleFile(imageUrl);

    final tempDir = await getTemporaryDirectory();
    final tempFilePath = '${tempDir.path}/${this.id}_image.jpg';

    await cachedImage.copy(tempFilePath);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onLongPress: () => _generateImage(),
        child: insidePicture(
          img: img,
          localFile: localFile,
        ));
  }
}

class insidePicture extends StatelessWidget {
  const insidePicture({
    super.key,
    required this.img,
    required this.localFile,
  });

  final String img;
  final String localFile;

  @override
  Widget build(BuildContext context) {
    if (img.isEmpty && localFile.isEmpty) {
      return CircularProgressIndicator();
    }

    if (img.isNotEmpty) {
      return CachedNetworkImage(
        width: MediaQuery.of(context).size.width,
        imageUrl: img,
        fit: BoxFit.fill,
      );
    }

    if (localFile.isNotEmpty) {
      return Image.file(
        width: MediaQuery.of(context).size.width,
        File(localFile),
        fit: BoxFit.fill,
      );
    }
    return CachedNetworkImage(
      width: MediaQuery.of(context).size.width,
      imageUrl: img,
      fit: BoxFit.fill,
    );
  }
}
