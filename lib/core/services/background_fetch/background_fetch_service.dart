import 'package:background_fetch/background_fetch.dart';

class BackgroundFetchService {

@pragma('vm:entry-point')
static void backgroundFetchHeadlessTask(HeadlessTask task) async {

  String taskId = task.taskId;
  bool isTimeout = task.timeout;

  if (isTimeout) {

    // This task has exceeded its allowed running-time.  
    // You must stop what you're doing and immediately .finish(taskId)
    //print("[BackgroundFetch] Headless task timed-out: $taskId");
    BackgroundFetch.finish(taskId);
    return;

  }  

  //print('[BackgroundFetch] Headless event received.');

  // Do your work here...
  BackgroundFetch.finish(taskId);

}

}