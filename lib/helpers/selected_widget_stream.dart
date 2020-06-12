import 'dart:async';

import 'package:playstationappcopy/helpers/enums.dart';

StreamController<SelectedWidget> streamController =
    StreamController<SelectedWidget>();
Stream selectedWidgetStream = streamController.stream;
