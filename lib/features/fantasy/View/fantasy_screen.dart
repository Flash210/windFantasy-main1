
import 'package:flutter/material.dart';
import 'package:front/core/common_widget/my_costum_sizedbox.dart';
import 'package:front/core/constants/app_constants.dart';
import 'package:front/core/constants/colors.dart';
import 'package:front/core/constants/screen_utils.dart';
import 'package:front/core/services/injection_container.dart';
import 'package:front/core/services/token_manager.dart';
import 'package:front/features/authentification/Model/user_model.dart';
import 'package:front/features/authentification/ViewModel/auth_provider.dart';
import 'package:front/features/fantasy/Model/player.dart';
import 'package:front/features/fantasy/Model/show_team.dart';
import 'package:front/features/fantasy/View/test.dart';
import 'package:front/features/fantasy/View/test2.dart';
import 'package:front/features/fantasy/View/widgets/app_bar_widget.dart';

import 'package:front/features/fantasy/View/widgets/team_section.dart';
import 'package:front/features/fantasy/ViewModel/player_provider.dart';
import 'package:front/features/fantasy/ViewModel/show_team_provider.dart';
import 'package:front/features/fantasy/functions/bottom_sheet_features.dart';
import 'package:front/features/fantasy/functions/edit_team_functions.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

part "fantasy_screen_main.dart";