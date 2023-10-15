import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';

import '/index.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  WelcomeStateScreen createState() => WelcomeStateScreen();
}

class WelcomeStateScreen extends State<WelcomeScreen> {
  /*  late WelcomeBloc welBloc;
  @override
  void didChangeDependencies() {
    welBloc = BlocProvider.of<WelcomeBloc>(context);
    super.didChangeDependencies();
  }
  @override
  void dispose() {
    welBloc.dis;
    super.dispose();
  } */

  PageController controller = PageController(initialPage: 0);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: BlocBuilder<WelcomeBloc, WelcomeState>(
        builder: (context, state) {
          WelcomeBloc bloc = BlocProvider.of<WelcomeBloc>(context);
          return SafeArea(
            child: SizedBox(
              width: 375.w,
              child: Stack(
                children: <Widget>[
                  PageView(
                    controller: controller,
                    onPageChanged: (i) => bloc.add(OnChangePage(i)),
                    children: [
                      _buildPage1(),
                      _buildPage2(),
                      _buildPage3(),
                    ],
                  ),
                  _buildBackText(state, bloc),
                  _buildActionSection(
                    context,
                    state,
                    onTap: () {
                      if (state.currentPage != 2) {
                        bloc.add(NextPage(controller, state.currentPage));
                      } else {
                        bloc.add(GetStartedPressed(context));
                      }
                    },
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Positioned _buildBackText(WelcomeState state, WelcomeBloc bloc) {
    if (state.currentPage != 0) {
      return Positioned(
        bottom: 170.h,
        right: 6.w,
        child: Hero(
          tag: '<<back>>',
          child: TxtBtn(
            color: AppColors.grey200,
            clipper: OvalLeftBorderClipper(),
            onTap: () => bloc.add(PrviusePage(controller, state.currentPage)),
            TextWidget(
              'back',
              style: styleTit(wordSpacing: 1.r, color: AppColors.pointsColo),
            ),
          ).animate().slideX(
                curve: Curves.fastOutSlowIn,
                duration: const Duration(milliseconds: 500),
              ),
        ),
      );
    } else {
      return const Positioned(child: SizedBox());
    }
  }

  Positioned _buildActionSection(
    BuildContext context,
    WelcomeState state, {
    required void Function() onTap,
  }) =>
      Positioned(
        bottom: 0,
        child: Container(
          decoration: BoxDecoration(
            color: AppColors.primar200,
            borderRadius: BorderRadius.only(topLeft: Radius.circular(150.w)),
          ),
          child: Column(
            children: [
              25.sH,
              SmoothIndicator(count: 3, i: state.currentPage).animate().slideX(
                    curve: Curves.fastEaseInToSlowEaseOut,
                    duration: const Duration(milliseconds: 2500),
                  ),
              Hero(
                tag: '_buildActionSection',
                child: MatBtn(
                  state.currentPage < 2 ? "Next" : "Get Started",
                  width: 325.w,
                  height: 50.h,
                  elv: 7.h,
                  margin: paddingOnly(top: 70, lf: 25, ri: 25, botm: 25.h),
                  backColor: AppColors.primaryElement,
                  onTap: onTap,
                ).animate().slideX(
                      curve: Curves.fastEaseInToSlowEaseOut,
                      duration: const Duration(milliseconds: 2000),
                    ),
              ),
            ],
          ),
        ),
      );

  _buildPage1() => const CustomPageView(
        img: AppImages.wellcom1,
        title: 'First See Learning',
        subTitle:
            'Forget about a for of paper all knowladge in one learning ,and share the knowledge with others.',
      ).animate().fadeIn(duration: const Duration(milliseconds: 2500));
  _buildPage2() => const CustomPageView(
        img: AppImages.wellcom2,
        // img: 'speech-bubble',
        title: 'Connect With Everyone',
        subTitle:
            'Always Keep in touch with Your tutor &\n Friend. let\'s get connected!',
      ).animate().fadeIn(duration: const Duration(milliseconds: 1000));

  _buildPage3() => const CustomPageView(
        img: AppImages.wellcom3,
        title: 'Always Fascinated Learing',
        subTitle:
            'Anywhere, anytime. the time is at your discration so study whereever you want.',
      ).animate().fadeIn(duration: const Duration(milliseconds: 1000));
}
