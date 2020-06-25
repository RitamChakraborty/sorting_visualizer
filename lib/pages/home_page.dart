import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:sortingvisualizer/bloc/sorting_page.dart';
import 'package:sortingvisualizer/provider/sorting_provider.dart';

class HomePage extends StatelessWidget {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    SortingProvider sortingProvider = Provider.of<SortingProvider>(context);

    return Material(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Sorting Visualizer"),
        ),
        body: SafeArea(
          child: LayoutBuilder(
              builder: (BuildContext context, BoxConstraints constraints) {
            double maxWidth = constraints.maxWidth;
            double maxHeight = constraints.maxHeight;
            double padding;

            if (maxWidth > maxHeight) {
              padding = maxWidth * 0.1;
            } else {
              padding = 32.0;
            }

            return Container(
              alignment: Alignment.center,
              padding: EdgeInsets.symmetric(horizontal: padding),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    TextFormField(
                      controller: _controller,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        labelText: "Number of bars",
                      ),
                    ),
                    SizedBox(height: 48),
                    MaterialButton(
                      onPressed: () {
                        sortingProvider.size = int.parse(_controller.text);

                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (BuildContext context) => SortingPage(),
                            ));
                      },
                      color: Theme.of(context).accentColor,
                      child: Text(
                        "Visualize",
                        style: Theme.of(context).textTheme.button,
                      ),
                    )
                  ],
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}
