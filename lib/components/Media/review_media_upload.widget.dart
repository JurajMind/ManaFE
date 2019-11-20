import 'dart:io';

import 'package:app/pages/Common/upload_picture.page.dart';
import 'package:flutter/material.dart';

class ReviewMediaUpload extends StatefulWidget {
  final List<File> files;

  ReviewMediaUpload({Key key, this.files}) : super(key: key);

  @override
  _ReviewMediaUploadState createState() => _ReviewMediaUploadState();
}

class _ReviewMediaUploadState extends State<ReviewMediaUpload> {
  List<File> files;

  @override
  void initState() {
    files = widget.files ?? new List<File>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Text(
            'Media',
            style: Theme.of(context).textTheme.display1,
          ),
          const SizedBox(
            height: 8,
          ),
          Container(
            height: 150,
            child: widget.files.length == 0
                ? Center(
                    child: buildAdd(context),
                  )
                : ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: files.length + 1,
                    itemBuilder: (context, index) {
                      if (index == files.length) {
                        return buildAdd(context);
                      }
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: new BorderRadius.circular(10.0),
                              border:
                                  new Border.all(color: Colors.white, width: 2),
                              color: Colors.transparent),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              const SizedBox(
                                height: 3,
                              ),
                              Container(
                                height: 70,
                                width: 100,
                                child: Image.file(
                                  files[index],
                                  fit: BoxFit.fitHeight,
                                ),
                              ),
                              IconButton(
                                icon: Icon(
                                  Icons.delete,
                                  color: Colors.red,
                                ),
                                onPressed: () {
                                  setState(() {
                                    files.removeAt(index);
                                  });
                                },
                              )
                            ],
                          ),
                        ),
                      );
                    },
                  ),
          ),
          const SizedBox(
            height: 8,
          ),
        ],
      ),
    );
  }

  Widget buildAdd(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => UploadPicturePage(
                  onFileUploaded: (file) {
                    setState(() {
                      files.insert(0, file);
                    });
                  },
                ),
            fullscreenDialog: true));
      },
      child: Padding(
          padding: const EdgeInsets.all(4.0),
          child: Container(
            decoration: BoxDecoration(
                borderRadius: new BorderRadius.circular(10.0),
                border: new Border.all(color: Colors.white, width: 2),
                color: Colors.transparent),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Icon(Icons.add_a_photo),
            ),
          )),
    );
  }
}
