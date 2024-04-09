import 'package:flutter/material.dart';
import 'package:front/core/services/token_manager.dart';
import 'package:front/features/authentification/ViewModel/auth_provider.dart';
import 'package:front/features/authentification/api/api.dart';
import 'package:front/features/authentification/repository/auth_api_impl.dart';
import 'package:front/features/authentification/repository/auth_repository.dart';
import 'package:front/features/authentification/utils/deep_link.dart';
import 'package:front/features/fantasy/ViewModel/player_provider.dart';
import 'package:front/features/fantasy/ViewModel/show_team_provider.dart';
import 'package:front/features/fantasy/ViewModel/team_edit_provider.dart';
import 'package:front/features/filter/ViewModel/filter_provider.dart';
import 'package:front/features/fixtures/ViewModel/fixture_provider.dart';
import 'package:front/features/home%20screen/ViewModel/home_provider.dart';
import 'package:front/features/langauge/provider.dart';
import 'package:front/features/ranking/ViewModel/ranking_provider.dart';
import 'package:get_it/get_it.dart';

part 'injection_container_main.dart';