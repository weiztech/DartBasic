// Sink and Streams
import 'dart:async';

class Pilot {
  String name;
  Pilot(this.name);
}

class Plane {
  String name;
  Pilot pilot;

  Plane(this.name, this.pilot);
}


void main(){
  final pilot = Pilot("Honey Boney");
  final pilotz = Pilot("Gomu Gomu");

  // way 1 (Basic)
  print("Start Controller 1");
  final controler = StreamController();

  controler.stream
    .listen(
      (data) => print('Got eem! Pilot `${data.name}` is ready'),
      onError: (err) => print('Got an error! $err'),
      onDone: () => print('Done 1'),
      cancelOnError: false,
    );
  controler.sink.add(pilot);
  controler.sink.add(pilotz);
  controler.addError("Errror here");
  controler.sink.close();

  // way 2 (Using StreamTransformer)
  print("Start Controller 2");
  final controler2 = StreamController<Pilot>();

  final streamTransformer = StreamTransformer<Pilot, Plane>.fromHandlers(
    handleData: (Pilot pilot, EventSink sink) {
      sink.add(Plane("JET", pilot));
    }, 
    handleError: (error, stacktrace, sink) {
      sink.addError('HANDLE ERRROR $error $sink');
    }, 
    handleDone: (sink) {
      sink.close();
    },
  );

  controler2.sink.add(pilot);
  controler2.sink.add(pilotz);
  controler2.sink.addError("Hey error Controller 2");
  controler2.sink.close();

  controler2.stream
    .map((data){
      print("MAP data $data");
      return data;
    })
    .transform(streamTransformer)
    .listen(
      (data) => print("READY: ${data.name} with pilot ${data.pilot.name}"),
      onDone: () => print("Done 2"),
      onError: (err) => print("Error controller 2: $err"),
      cancelOnError: false,
    );
}


/*
void main() {
  // just another version without `Type inference`
  print("Start Controller 2");
  final controler2 = StreamController();

  final streamTransformer = StreamTransformer.fromHandlers(
    handleData: (pilot, EventSink sink) {
      sink.add(Plane("JET", pilot));
    }, 
    handleError: (error, stacktrace, sink) {
      sink.addError('$error');
    }, 
    handleDone: (sink) {
      sink.close();
    },
  );

  controler2.sink.add(pilot);
  controler2.sink.add(pilotz);
  controler2.sink.addError("Hey error Controller 2");
  controler2.sink.close();

  controler2.stream
    .map((data){
      print("MAP data $data");
      return data;
    })
    .transform(streamTransformer)
    .listen(
      (data) => print("READY: ${data.name} with pilot ${data.pilot.name}"),
      onDone: () => print("Done 2"),
      onError: (err) => print("Error controller 2: $err"),
      cancelOnError: false,
    );
}
*/