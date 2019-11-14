@JS() // sets the context, in this case being `window`
library main; // required library declaration

import 'package:js/js.dart'; // Pull in our dependency

@JS('window.test')
external void logIframe(dynamic str);

@JS('console.log') // annotates `log` function to call `console.log`
external void log(dynamic str);
void main() {
  log('Hello world!'); // invokes console.log() in JavaScript land
}
