import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class BaseWidget<T extends ChangeNotifier> extends StatefulWidget {

  final Widget Function(BuildContext context, T value, Widget child) builder;
  final T mViewModel;
  final Widget child;
  final Function(T) onViewModelReady;

  BaseWidget(
      {
        Key key,
        this.mViewModel,
        this.builder,
        this.child,
        this.onViewModelReady
      }): super(key: key);

  @override
  _BaseWidgetState<T> createState() => _BaseWidgetState<T>();
}

class _BaseWidgetState<T extends ChangeNotifier> extends State<BaseWidget<T>> {
  // We want to store the instance of the model in the state
  // that way it stays constant through rebuilds
  T model;

  @override
  void initState() {
    // assign the model once when state is initialised
    model = widget.mViewModel;
    if(widget.onViewModelReady != null){
      widget.onViewModelReady(model);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<T>.value(
        value: model,
      child: Consumer<T>(
        builder: widget.builder,
        child: widget.child,
      ),
    );
  }

  @override
  void dispose() {
    print('I have been disposed!!');
    super.dispose();
  }

}


