# Manapipes flutter app

Crazy idea that make it true... write native app in flutter

To run : 

edit in fluter core ( focus_manager.dart) function in case of focus issue
```
  void requestFocus(FocusNode node) {
    assert(node != null);

    // set the first focus on all parents up to the root
    FocusScopeNode current = this;
    while (current != null) {
      current._parent?.setFirstFocus(current);
      current = current._parent;
    }

    if (_focus == node)
      return;
    _focus?.unfocus();
    node._hasKeyboardToken = true;
    _setFocus(node);
  }
  ```