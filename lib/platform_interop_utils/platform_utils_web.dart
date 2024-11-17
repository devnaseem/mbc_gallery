// platform_utils_web.dart
import 'dart:html' as html;

void dispatchBackPressedEvent() {
  html.window.dispatchEvent(html.CustomEvent('back_pressed'));
}
