import 'package:flutter/material.dart';
import 'package:front/core/services/token_manager.dart';
import 'package:front/features/auth/Controller/auth_provider.dart';
import 'package:front/features/auth/api/api.dart';
import 'package:front/features/auth/repository/auth_api_impl.dart';
import 'package:front/features/auth/repository/auth_repository.dart';
import 'package:front/features/auth/repository/authentification_repository.dart';
import 'package:front/features/auth/service/user_service.dart';
import 'package:front/features/auth/utils/deep_link.dart';

import 'package:front/features/fantasy/Controller/player_provider.dart';
import 'package:front/features/fantasy/Controller/show_team_provider.dart';
import 'package:front/features/fantasy/Controller/team_edit_provider.dart';
import 'package:front/features/fantasy/repository/player_repository.dart';
import 'package:front/features/fantasy/repository/team_repository.dart';
import 'package:front/features/fantasy/services/player_service.dart';
import 'package:front/features/fantasy/services/team_service.dart';
import 'package:front/features/filter/Controller/filter_provider.dart';
import 'package:front/features/fixtures/Controller/fixture_provider.dart';
import 'package:front/features/langauge/provider.dart';
import 'package:front/features/ranking/Controller/ranking_provider.dart';
import 'package:get_it/get_it.dart';

part 'injection_container_main.dart';