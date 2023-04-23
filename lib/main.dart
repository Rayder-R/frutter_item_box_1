import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // title: 'Flutter Demo',
      theme: ThemeData(

        // colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // int _counter = 0;

  // void _incrementCounter() {
  //     setState(() {
  //
  //     });
  // }

  @override
  Widget build(BuildContext context) {

    return const Scaffold(
      body: Column(
        // Standard IconButton
        children: <Widget>[
          Buttons(),

          ///==============
          ///IconButton
          IconToggleButton(
            isEnabled: false,
            tooltip: 'Standard',
          ),
          colDivider,

          IconToggleButton(
            isEnabled: true,
            tooltip: 'Standard (disabled)',
            getDefaultStyle: enabledFilledButtonStyle ,
          ),
          Testclass()
        ],
      ),
    );
  }
}
/// Style Button
ButtonStyle enabledFilledButtonStyle(bool selected, ColorScheme colors) {
  //TODO ButtonStyle in IconButton class
  return IconButton.styleFrom(
    ///ICON color
    foregroundColor: selected ? const Color.fromRGBO(246, 194, 5, 1) : Colors.white,
    ///background color
    backgroundColor: selected ? Colors.black12.withOpacity(0.01) : Colors.black12.withOpacity(0.03),
    ///disable set color
    disabledForegroundColor: colors.onSurface.withOpacity(0.0),
    disabledBackgroundColor: colors.onSurface.withOpacity(0.12),
    ///tap color
    highlightColor: selected
        ? colors.onPrimary
        : colors.onPrimary,
  );
}



//TODO IconToggleButton be Create State
//TODO use a _IconToggleButtonState
/// parent class
class IconToggleButton extends StatefulWidget {

  ///new class
  const IconToggleButton({
    required this.isEnabled, /// require can receive null value
    required this.tooltip,
    this.getDefaultStyle,
    super.key,
  });

  final bool isEnabled;
  final String tooltip;
  final ButtonStyle? Function(bool, ColorScheme)? getDefaultStyle;

  @override
  State<IconToggleButton> createState() => _IconToggleButtonState();
}

/// chilled class extend State
class _IconToggleButtonState extends State<IconToggleButton> {
  bool _selected = false;

  @override
  Widget build(BuildContext context) {
    final ColorScheme colors = Theme.of(context).colorScheme;

    /// if widget.isEnabled is false, button onPressed is turn off
    final VoidCallback? onPressed = widget.isEnabled ? () {
      setState(() {
        _selected = !_selected;
      });
    } : null;

    ButtonStyle? style = widget.getDefaultStyle?.call(_selected, colors);

    return IconButton(
      visualDensity: VisualDensity.standard,
      isSelected: _selected,
      tooltip: widget.tooltip,
      icon: const Icon(Icons.favorite_outline),
      selectedIcon: const Icon(Icons.favorite),
      onPressed: onPressed,
      style: style,
    );
  }
}



class Testclass extends StatefulWidget{
  const Testclass({super.key});


  @override
  State<StatefulWidget> createState() {
    //TODO: implement createState
    return _Testclass();
  }


}
class _Testclass extends State<Testclass>{

  var count  = 0;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return const Row(children: [
      Text("data"),
      IconButton(
          onPressed: null,
          icon: Icon(Icons.ice_skating))]);

  }


}


class Buttons extends StatefulWidget {
  const Buttons({super.key});

  @override
  State<Buttons> createState() => _ButtonsState();
}

class _ButtonsState extends State<Buttons> {
  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          ButtonsWithoutIcon(isDisabled: false),
          ButtonsWithIcon(),
          ButtonsWithoutIcon(isDisabled: true),
        ],
      ),
    );
  }
}

const colDivider = SizedBox(height: 10);
class ButtonsWithoutIcon extends StatelessWidget {
  final bool isDisabled;

  const ButtonsWithoutIcon({super.key, required this.isDisabled});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5.0),
      child: IntrinsicWidth(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            ElevatedButton(
              onPressed: isDisabled ? null : () {},
              child: const Text('Elevated'),
            ),
            colDivider,
            FilledButton(
              onPressed: isDisabled ? null : () {},
              child: const Text('Filled'),
            ),
            colDivider,
            FilledButton.tonal(
              onPressed: isDisabled ? null : () {},
              child: const Text('Filled tonal'),
            ),
            colDivider,
            OutlinedButton(
              onPressed: isDisabled ? null : () {},
              child: const Text('Outlined'),
            ),
            colDivider,
            TextButton(
              onPressed: isDisabled ? null : () {},
              child: const Text('Text'),
            ),
          ],
        ),
      ),
    );
  }
}

class ButtonsWithIcon extends StatelessWidget {
  const ButtonsWithIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: IntrinsicWidth(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            ElevatedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.add),
              label: const Text('Icon'),
            ),
            colDivider,
            FilledButton.icon(
              onPressed: () {},
              label: const Text('Icon'),
              icon: const Icon(Icons.add),
            ),
            colDivider,
            FilledButton.tonalIcon(
              onPressed: () {},
              label: const Text('Icon'),
              icon: const Icon(Icons.add),
            ),
            colDivider,
            OutlinedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.add),
              label: const Text('Icon'),
            ),
            colDivider,
            TextButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.add),
              label: const Text('Icon'),
            )
          ],
        ),
      ),
    );
  }
}