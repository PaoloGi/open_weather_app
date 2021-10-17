import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_excercise/core/viewmodels/wizard_screen_viewmodel.dart';
import 'package:weather_excercise/ui/widgets/wizard_widgets/page_state_scroll.dart';
import 'package:weather_excercise/ui/widgets/wizard_widgets/wizard_page.dart';

class WizardScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => WizardScreenState();
}

class WizardScreenState extends State<WizardScreen> {
  final WizardScreenViewModel wizardScreenViewModel =  WizardScreenViewModel();
  final PageController pageController  = PageController(initialPage: 0);


  @override
  void initState() {
    super.initState();
    pageController.addListener(() {
      wizardScreenViewModel.setPage(pageController.page ?? 0);
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    return
      Scaffold(
          body:
          ChangeNotifierProvider<WizardScreenViewModel>(
            create: (context) => wizardScreenViewModel,
            child: Container(
              color: Colors.white,
                child:
                Column(
                    children: <Widget>[
                      Expanded(
                          child:
                          PageView.builder(
                            controller: pageController,
                            scrollDirection: Axis.horizontal,
                            itemCount: wizardScreenViewModel.pages.length,
                            itemBuilder: (context, position) =>
                                WizardPage(page: wizardScreenViewModel.pages[position])
                          )
                      ),
                      Consumer<WizardScreenViewModel>(
                        builder: (ctx, provider, _) {
                          return Column(
                            children: [
                              Container(
                                margin: EdgeInsets.only(bottom: screenHeight / 100),
                                child: PageStateScroll(
                                  numberOfPages: wizardScreenViewModel.pages.length,
                                  selectedPage: provider.page,
                                  onBackPressed: () =>
                                      pageController.previousPage(
                                                      duration: kTabScrollDuration,
                                                      curve: Curves.ease),
                                  onForwardPressed: () =>
                                      pageController.nextPage(
                                                      duration: kTabScrollDuration,
                                                      curve: Curves.ease),
                                ),
                              ),
                              TextButton(
                                  child: Text("Entra"),
                                  onPressed: () =>
                                      Navigator.pushNamed(context, '/home_screen'))
                            ],
                          );
                    })

                    ])
            ),
          )
      );
  }
}