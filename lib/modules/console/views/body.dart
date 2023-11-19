import 'package:flutter/material.dart';
import 'package:plantix/models/Message.dart';
import 'package:plantix/tools/MqttHandler.dart';
import 'package:plantix/modules/console/mqtt.dart';
import 'package:plantix/components/Bubble.dart';
import 'package:plantix/size_config.dart';
import 'package:plantix/constants.dart';
import 'package:mqtt_client/mqtt_client.dart';
import 'dart:convert';
import 'package:plantix/tools/NotificationService.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  TextEditingController _messageController = TextEditingController();
  MqttHandler mqttHandler = MqttHandler();
  List<Message> _messages = [];

  @override
  void initState() {
    super.initState();
    mqttHandler.connect();
    mqttHandler.client.updates!
        .listen((List<MqttReceivedMessage<MqttMessage?>>? c) {
      setState(() {
        final recMess = c![0].payload as MqttPublishMessage;
        final pt =
            MqttPublishPayload.bytesToStringAsString(recMess.payload.message);
        Map<String, dynamic> data = jsonDecode(pt);
        if (data['from'] != kIdentifier) {
          _messages.add(Message(from: data['from'], msg: data['msg']));
          NotificationService().showNotification(data['from'], data['msg']);
        }
        print(
            'MQTT_LOGS:: New data arrived: topic is <${c[0].topic}>, payload is $pt');
        print('');
      });
    });
  }

  void _sendMessage() {
    String message = _messageController.text.trim();
    if (message.isNotEmpty) {
      setState(() {
        String json = '{"from":"$kIdentifier","msg":"$message"}';
        mqttHandler.publishMessage(json);
        _messages.add(Message(from: kIdentifier, msg: message));
      });
      _messageController.clear();
    }
  }

  @override
  void dispose() {
    super.dispose();
    mqttHandler.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MQTT Console'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                return BubbleChat(
                  message: _messages[index],
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _messageController,
                    decoration: InputDecoration(
                      hintText: "Tulis Pesan...",
                      // If  you are using latest version of flutter then lable text and hint text shown like this
                      // if you r using flutter less then 1.20.* then maybe this is not working properly
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.send),
                  onPressed: _sendMessage,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
