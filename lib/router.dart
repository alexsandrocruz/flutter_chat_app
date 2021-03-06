import 'package:chat_app_client/blocs/userslist/userslist_bloc.dart';
import 'package:chat_app_client/pages/conversation_page.dart';
import 'package:chat_app_client/pages/decision_page.dart';
import 'package:chat_app_client/pages/login_page.dart';
import 'package:chat_app_client/pages/register_page.dart';
import 'package:chat_app_client/pages/users_list_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'blocs/bloc.dart';

class RouteConstants {
  static const DecisionPage = '/decisionPage';
  static const LoginPage = '/loginPage';
  static const RegisterPage = '/RegisterPage';
  static const UsersListPage = '/usersListPage';
  static const ChatPage = '/chatPage';
}

Route<dynamic> onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case RouteConstants.DecisionPage:
      return _buildRoute(settings, new DecisionPage());
      break;
    case RouteConstants.LoginPage:
      return _buildRoute(settings, new LoginPage());
      break;
    case RouteConstants.RegisterPage:
      return _buildRoute(settings, new RegisterPage());
      break;
    case RouteConstants.UsersListPage:
      return MaterialPageRoute(
        settings: settings,
        builder: (BuildContext context) {
          return BlocProvider.value(
            value: BlocProvider.of<UsersListBloc>(context),
            child: BlocProvider.value(
              value: BlocProvider.of<SocketioBloc>(context),
              child: UsersListPage(),
            ),
          );
        },
      );
      break;
    case RouteConstants.ChatPage:
      return _buildRoute(settings, new ConversationPage());
      break;
    default:
      return _buildRoute(settings, new LoginPage());
  }
}

MaterialPageRoute _buildRoute(RouteSettings settings, Widget builder) {
  return new MaterialPageRoute(
    settings: settings,
    builder: (BuildContext context) => builder,
  );
}
