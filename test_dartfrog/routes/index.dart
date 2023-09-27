import 'package:dart_frog/dart_frog.dart';
int Counter=0;
Response onRequest(RequestContext context) {
  Counter++;
  return Response(body: 'You Called Me $Counter in times');
}
