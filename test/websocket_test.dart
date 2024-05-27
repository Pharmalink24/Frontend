import 'package:logger/logger.dart';
import 'package:pharmalink/core/networking/socket_constants.dart';
import 'package:pharmalink/features/main/chat/data/models/message.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

void main() {
  String url = '${WebSocketConstants.wsDomain}${WebSocketConstants.messagingChannel}';

  Map<String, dynamic> pathParams = {
    'user_id': '1',
  };

  pathParams.forEach((key, value) {
    url = url.replaceFirst('{$key}', value.toString());
  });

  Logger().i(url);

  final channel = WebSocketChannel.connect(
    Uri.parse(url),
  );

  Message msg = Message(
    message: 'Hello!',
    senderUserId: 2,
    receiverDoctorId: 1,
  );

  channel.sink.add(msg);
  channel.stream.listen((message) {
    Logger().i(message);
    channel.sink.close();
  });
}
