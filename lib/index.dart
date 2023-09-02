library index;

export 'package:flutter_animate/flutter_animate.dart';
export 'package:flutter/material.dart';
export 'package:flutter_bloc/flutter_bloc.dart';
export 'package:font_awesome_flutter/font_awesome_flutter.dart';
export 'package:progress_state_button/iconed_button.dart';
export 'package:progress_state_button/progress_button.dart';
export 'package:flutter/services.dart';
export 'package:flutter_screenutil/flutter_screenutil.dart';

//app
export 'presentation/bloc/observers/my_bloc_observer.dart';
export 'app/my_app.dart';
export 'data/network/error/failure.dart';
export 'app/usecase/use_case.dart';
export 'app/typedef/typedef.dart';

/// config
export 'app/config/routes/app_routes.dart';
export 'app/config/routes/routes.dart';

export 'app/services/services_locator.dart';
export 'app/services/navigation_service.dart';

/// extension
export 'app/extension/size_box.dart';
export 'app/extension/padding.dart';
export 'app/extension/divider.dart';

/// domain
export 'domain/repository/authentication_repository.dart';
export 'domain/entites/user/user_entity.dart';
export 'domain/usecase/user_login_usecase.dart';

// presentation

/////// screens
export 'presentation/screens/welcome/welcome_screen.dart';
export 'presentation/screens/splash/splash_screen.dart';
export 'presentation/screens/auth/sign_screen.dart';
export 'presentation/screens/auth/sign_in/sign_in_form_body.dart';
export 'presentation/screens/home/home_page.dart';
export 'tests/test.dart';

/////// presentation  widegt
export 'presentation/screens/auth/widget/face_google_sign.dart';
export 'presentation/screens/auth/widget/sign_divider_checker.dart';
export 'presentation/screens/auth/sign_up/sign_up_form_body.dart';
export 'presentation/screens/auth/widget/sigin_btn.dart';
export 'presentation/screens/welcome/widget/custom_page_view.dart';
export 'presentation/screens/auth/widget/text_field.dart';

/////// resources
export 'presentation/resources/constans_manager.dart';
export 'presentation/resources/colors_manager.dart';
export 'presentation/resources/image_manager.dart';
export 'presentation/resources/size_confing_manager.dart';
export 'presentation/resources/strings_manager.dart';

/////// Bloc  && state  &&  event
export 'presentation/bloc/app_bloc_providers.dart';
export 'presentation/bloc/observers/my_navigator_observer.dart';
export 'presentation/bloc/exaple/learn_bloc.dart';
export 'presentation/bloc/auth/auth_bloc.dart';
export 'presentation/bloc/welcome/welcome_bloc.dart';


////  app widegts
export 'presentation/widgets/animation_list_vertical_widget.dart';

export 'presentation/widgets/apploading/apploading_2.dart';

export 'presentation/widgets/buttons/btn_widget.dart';
export 'presentation/widgets/buttons/elv_btn.dart';
export 'presentation/widgets/buttons/mat_btn.dart';
export 'presentation/widgets/buttons/elv_tx_icon_btn.dart';
export 'presentation/widgets/buttons/icon_btn.dart';
export 'presentation/widgets/buttons/outline_tx_icon_btn.dart';

export 'presentation/widgets/list_tile/bootm_sheet_list_tile.dart';
export 'presentation/widgets/radio_list_tile_wiget.dart';
export 'presentation/widgets/smooth_indicator.dart';
export 'presentation/widgets/switch_widget.dart';
export 'presentation/widgets/app_text/text_widget.dart';
export 'presentation/widgets/app_text/text_styles.dart';
export 'presentation/widgets/app_text/txt_btn.dart';
export 'presentation/widgets/handling_view_widgets/costum_bage_state_widget.dart';
