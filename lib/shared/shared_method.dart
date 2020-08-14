part of 'shared.dart';

Future<File> getImage() async {
  var image = await ImagePicker().getImage(source: ImageSource.gallery);
  return File(image.path);
}

void pushOrderNotification({String content, String heading}) async {
  var status = await OneSignal.shared.getPermissionSubscriptionState();

  var playerId = status.subscriptionStatus.userId;

  await OneSignal.shared.postNotification(OSCreateNotification(
    playerIds: [playerId],
    content: content,
    heading: heading,
  ));
}
