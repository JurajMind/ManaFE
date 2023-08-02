import 'dart:math' as math;
import 'package:arkit_plugin/arkit_plugin.dart';
import 'package:flutter/material.dart';
import 'package:vector_math/vector_math_64.dart' as vector;

class PlaneDetectionPage extends StatefulWidget {
  @override
  _PlaneDetectionPageState createState() => _PlaneDetectionPageState();
}

class _PlaneDetectionPageState extends State<PlaneDetectionPage> {
  late ARKitController arkitController;
  ARKitPlane? plane;
  ARKitNode? node;
  String? anchorId;
  double x = 0, y = 0;
  double width = 1, height = 1;
  Matrix4 transform = Matrix4.identity();

  @override
  void dispose() {
    arkitController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(title: const Text('Plane Detection Sample')),
        body: Container(
          child: Stack(
            children: [
              ARKitSceneView(
                showFeaturePoints: true,
                planeDetection: ARPlaneDetection.horizontal,
                onARKitViewCreated: onARKitViewCreated,
              ),
              anchorId == ''
                  ? SizedBox.shrink()
                  : Positioned(
                      left: x,
                      top: y,
                      child: Container(
                        transform: transform,
                        width: width,
                        height: height,
                        child: const MyArStats(
                          title: 'Widgets in AR',
                        ),
                      ),
                    ),
            ],
          ),
        ),
      );

  void onARKitViewCreated(ARKitController arkitController) {
    this.arkitController = arkitController;
    this.arkitController.onAddNodeForAnchor = _handleAddAnchor;
    this.arkitController.onUpdateNodeForAnchor = _handleUpdateAnchor;
  }

  void _handleAddAnchor(ARKitAnchor anchor) {
    if (!(anchor is ARKitPlaneAnchor)) {
      return;
    }
    _addPlane(arkitController, anchor);
  }

  void _handleUpdateAnchor(ARKitAnchor anchor) {
    if (anchor.identifier != anchorId || anchor is! ARKitPlaneAnchor) {
      return;
    }
    node?.position = vector.Vector3(anchor.center.x, 0, anchor.center.z);
    plane?.width.value = anchor.extent.x;
    plane?.height.value = anchor.extent.z;
    _updatePosition(anchor);
    _updateRotation(anchor);
  }

  void _addPlane(ARKitController controller, ARKitPlaneAnchor anchor) {
    anchorId = anchor.identifier;
    plane = ARKitPlane(
      width: anchor.extent.x,
      height: anchor.extent.z,
      materials: [
        ARKitMaterial(
          transparency: 0.5,
          diffuse: ARKitMaterialProperty.color(Colors.white),
        )
      ],
    );

    node = ARKitNode(
      geometry: plane,
      position: vector.Vector3(anchor.center.x, 0, anchor.center.z),
      rotation: vector.Vector4(1, 0, 0, -math.pi / 2),
    );
    controller.add(node!, parentNodeName: anchor.nodeName);
  }

  Future _updateRotation(ARKitAnchor anchor) async {
    final t = anchor.transform.clone();
    t.invertRotation();
    t.rotateZ(math.pi / 2);
    t.rotateX(math.pi / 2);
    //t.rotateX(math.pi / 2);
    setState(() {
      transform = t;
    });
  }

  Future _updatePosition(ARKitPlaneAnchor anchor) async {
    final transform = anchor.transform;
    final width = math.min(anchor.extent.x, 200).toDouble();
    final height = math.min(anchor.extent.y, 200).toDouble();
    node?.position = vector.Vector3(anchor.center.x, 0, anchor.center.z);
    plane?.width.value = anchor.extent.x;
    plane?.height.value = anchor.extent.z;

    final topRight = vector.Vector4(width, 0, -height, 1)..applyMatrix4(transform);
    final bottomRight = vector.Vector4(width, 0, height, 1)..applyMatrix4(transform);
    final bottomLeft = vector.Vector4(-width, 0, -height, 1)..applyMatrix4(transform);
    final topLeft = vector.Vector4(-width, 0, height, 1)..applyMatrix4(transform);

    final pointsWorldSpace = [topRight, bottomRight, bottomLeft, topLeft];

    final pointsViewportSpace =
        pointsWorldSpace.map((p) => arkitController.projectPoint(vector.Vector3(p.x, p.y, p.z)));
    final pointsViewportSpaceResults = await Future.wait(pointsViewportSpace);

    setState(() {
      x = pointsViewportSpaceResults[2]!.x;
      y = pointsViewportSpaceResults[2]!.y;
      this.width = pointsViewportSpaceResults[0]!.distanceTo(pointsViewportSpaceResults[3]!);
      this.height = pointsViewportSpaceResults[1]!.distanceTo(pointsViewportSpaceResults[2]!);
    });
  }
}

class MyArStats extends StatefulWidget {
  const MyArStats({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

  @override
  MyArStatsState createState() => MyArStatsState();
}

class MyArStatsState extends State<MyArStats> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Puf count',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
    );
  }
}
