

import 'package:flutter/material.dart';
import 'package:front/core/common_widget/custom_text.dart';
import 'package:front/core/constants/app_constants.dart';
import 'package:front/core/constants/colors.dart';
import 'package:front/core/constants/screen_utils.dart';
import 'package:front/core/services/injection_container.dart';
import 'package:front/core/services/token_manager.dart';
import 'package:front/features/auth/ViewModel/auth_provider.dart';
import 'package:front/features/fantasy/Model/player.dart';
import 'package:front/features/fantasy/Model/show_team.dart';
import 'package:front/features/fantasy/View/show_fantasy_screen.dart';

import 'package:front/features/fantasy/View/widgets/team_section.dart';
import 'package:front/features/fantasy/ViewModel/player_provider.dart';
import 'package:front/features/fantasy/ViewModel/show_team_provider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

part "fantasy_screen_main.dart";