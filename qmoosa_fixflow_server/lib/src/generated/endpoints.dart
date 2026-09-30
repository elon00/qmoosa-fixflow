/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: implementation_imports
// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: public_member_api_docs
// ignore_for_file: type_literal_in_constant_pattern
// ignore_for_file: use_super_parameters
// ignore_for_file: invalid_use_of_internal_member

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:qmoosa_fixflow_server/src/generated/issue.dart' as _ic0dwcfm;
import 'package:serverpod/serverpod.dart' as _is;
import 'package:serverpod_auth_core_server/serverpod_auth_core_server.dart'
    as _iacs;
import 'package:serverpod_auth_idp_server/serverpod_auth_idp_server.dart'
    as _iais;
import '../auth/email_idp_endpoint.dart' as _iuc1hd5t;
import '../auth/jwt_refresh_endpoint.dart' as _inwq3ztq;
import '../endpoints/activity_stream_endpoint.dart' as _icng23u3;
import '../endpoints/dashboard_endpoint.dart' as _ibmx856o;
import '../endpoints/issue_endpoint.dart' as _isyn1z06;
import '../endpoints/sandbox_endpoint.dart' as _ie7tqwnd;
import '../greetings/greeting_endpoint.dart' as _il624ik7;

class Endpoints extends _is.EndpointDispatch {
  @override
  void initializeEndpoints(_is.Server server) {
    var endpoints = <String, _is.Endpoint>{
      'emailIdp': _iuc1hd5t.EmailIdpEndpoint()
        ..initialize(
          server,
          'emailIdp',
          null,
        ),
      'jwtRefresh': _inwq3ztq.JwtRefreshEndpoint()
        ..initialize(
          server,
          'jwtRefresh',
          null,
        ),
      'activityStream': _icng23u3.ActivityStreamEndpoint()
        ..initialize(
          server,
          'activityStream',
          null,
        ),
      'dashboard': _ibmx856o.DashboardEndpoint()
        ..initialize(
          server,
          'dashboard',
          null,
        ),
      'issue': _isyn1z06.IssueEndpoint()
        ..initialize(
          server,
          'issue',
          null,
        ),
      'sandbox': _ie7tqwnd.SandboxEndpoint()
        ..initialize(
          server,
          'sandbox',
          null,
        ),
      'greeting': _il624ik7.GreetingEndpoint()
        ..initialize(
          server,
          'greeting',
          null,
        ),
    };
    connectors['emailIdp'] = _is.EndpointConnector(
      name: 'emailIdp',
      endpoint: endpoints['emailIdp']!,
      methodConnectors: {
        'login': _is.MethodConnector(
          name: 'login',
          params: {
            'email': _is.ParameterDescription(
              name: 'email',
              type: _is.getType<String>(),
              nullable: false,
            ),
            'password': _is.ParameterDescription(
              name: 'password',
              type: _is.getType<String>(),
              nullable: false,
            ),
          },
          call:
              (
                _is.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['emailIdp'] as _iuc1hd5t.EmailIdpEndpoint).login(
                    session,
                    email: params['email'],
                    password: params['password'],
                  ),
        ),
        'startRegistration': _is.MethodConnector(
          name: 'startRegistration',
          params: {
            'email': _is.ParameterDescription(
              name: 'email',
              type: _is.getType<String>(),
              nullable: false,
            ),
          },
          call:
              (
                _is.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['emailIdp'] as _iuc1hd5t.EmailIdpEndpoint)
                  .startRegistration(
                    session,
                    email: params['email'],
                  ),
        ),
        'verifyRegistrationCode': _is.MethodConnector(
          name: 'verifyRegistrationCode',
          params: {
            'accountRequestId': _is.ParameterDescription(
              name: 'accountRequestId',
              type: _is.getType<_is.UuidValue>(),
              nullable: false,
            ),
            'verificationCode': _is.ParameterDescription(
              name: 'verificationCode',
              type: _is.getType<String>(),
              nullable: false,
            ),
          },
          call:
              (
                _is.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['emailIdp'] as _iuc1hd5t.EmailIdpEndpoint)
                  .verifyRegistrationCode(
                    session,
                    accountRequestId: params['accountRequestId'],
                    verificationCode: params['verificationCode'],
                  ),
        ),
        'finishRegistration': _is.MethodConnector(
          name: 'finishRegistration',
          params: {
            'registrationToken': _is.ParameterDescription(
              name: 'registrationToken',
              type: _is.getType<String>(),
              nullable: false,
            ),
            'password': _is.ParameterDescription(
              name: 'password',
              type: _is.getType<String>(),
              nullable: false,
            ),
          },
          call:
              (
                _is.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['emailIdp'] as _iuc1hd5t.EmailIdpEndpoint)
                  .finishRegistration(
                    session,
                    registrationToken: params['registrationToken'],
                    password: params['password'],
                  ),
        ),
        'startPasswordReset': _is.MethodConnector(
          name: 'startPasswordReset',
          params: {
            'email': _is.ParameterDescription(
              name: 'email',
              type: _is.getType<String>(),
              nullable: false,
            ),
          },
          call:
              (
                _is.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['emailIdp'] as _iuc1hd5t.EmailIdpEndpoint)
                  .startPasswordReset(
                    session,
                    email: params['email'],
                  ),
        ),
        'verifyPasswordResetCode': _is.MethodConnector(
          name: 'verifyPasswordResetCode',
          params: {
            'passwordResetRequestId': _is.ParameterDescription(
              name: 'passwordResetRequestId',
              type: _is.getType<_is.UuidValue>(),
              nullable: false,
            ),
            'verificationCode': _is.ParameterDescription(
              name: 'verificationCode',
              type: _is.getType<String>(),
              nullable: false,
            ),
          },
          call:
              (
                _is.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['emailIdp'] as _iuc1hd5t.EmailIdpEndpoint)
                  .verifyPasswordResetCode(
                    session,
                    passwordResetRequestId: params['passwordResetRequestId'],
                    verificationCode: params['verificationCode'],
                  ),
        ),
        'finishPasswordReset': _is.MethodConnector(
          name: 'finishPasswordReset',
          params: {
            'finishPasswordResetToken': _is.ParameterDescription(
              name: 'finishPasswordResetToken',
              type: _is.getType<String>(),
              nullable: false,
            ),
            'newPassword': _is.ParameterDescription(
              name: 'newPassword',
              type: _is.getType<String>(),
              nullable: false,
            ),
          },
          call:
              (
                _is.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['emailIdp'] as _iuc1hd5t.EmailIdpEndpoint)
                  .finishPasswordReset(
                    session,
                    finishPasswordResetToken:
                        params['finishPasswordResetToken'],
                    newPassword: params['newPassword'],
                  ),
        ),
        'hasAccount': _is.MethodConnector(
          name: 'hasAccount',
          params: {},
          call:
              (
                _is.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['emailIdp'] as _iuc1hd5t.EmailIdpEndpoint)
                  .hasAccount(session),
        ),
      },
    );
    connectors['jwtRefresh'] = _is.EndpointConnector(
      name: 'jwtRefresh',
      endpoint: endpoints['jwtRefresh']!,
      methodConnectors: {
        'refreshAccessToken': _is.MethodConnector(
          name: 'refreshAccessToken',
          params: {
            'refreshToken': _is.ParameterDescription(
              name: 'refreshToken',
              type: _is.getType<String?>(),
              nullable: true,
            ),
          },
          call:
              (
                _is.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['jwtRefresh'] as _inwq3ztq.JwtRefreshEndpoint)
                      .refreshAccessToken(
                        session,
                        refreshToken: params['refreshToken'],
                      ),
        ),
      },
    );
    connectors['activityStream'] = _is.EndpointConnector(
      name: 'activityStream',
      endpoint: endpoints['activityStream']!,
      methodConnectors: {
        'watchWorkspace': _is.MethodStreamConnector(
          name: 'watchWorkspace',
          params: {
            'workspaceId': _is.ParameterDescription(
              name: 'workspaceId',
              type: _is.getType<int>(),
              nullable: false,
            ),
          },
          streamParams: {},
          returnType: _is.MethodStreamReturnType.streamType,
          call:
              (
                _is.Session session,
                Map<String, dynamic> params,
                Map<String, Stream> streamParams,
              ) =>
                  (endpoints['activityStream']
                          as _icng23u3.ActivityStreamEndpoint)
                      .watchWorkspace(
                        session,
                        params['workspaceId'],
                      ),
        ),
      },
    );
    connectors['dashboard'] = _is.EndpointConnector(
      name: 'dashboard',
      endpoint: endpoints['dashboard']!,
      methodConnectors: {
        'getMetrics': _is.MethodConnector(
          name: 'getMetrics',
          params: {
            'workspaceId': _is.ParameterDescription(
              name: 'workspaceId',
              type: _is.getType<int>(),
              nullable: false,
            ),
          },
          call:
              (
                _is.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['dashboard'] as _ibmx856o.DashboardEndpoint)
                  .getMetrics(
                    session,
                    params['workspaceId'],
                  ),
        ),
      },
    );
    connectors['issue'] = _is.EndpointConnector(
      name: 'issue',
      endpoint: endpoints['issue']!,
      methodConnectors: {
        'createIssue': _is.MethodConnector(
          name: 'createIssue',
          params: {
            'issue': _is.ParameterDescription(
              name: 'issue',
              type: _is.getType<_ic0dwcfm.Issue>(),
              nullable: false,
            ),
          },
          call:
              (
                _is.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['issue'] as _isyn1z06.IssueEndpoint).createIssue(
                    session,
                    params['issue'],
                  ),
        ),
        'getIssue': _is.MethodConnector(
          name: 'getIssue',
          params: {
            'id': _is.ParameterDescription(
              name: 'id',
              type: _is.getType<int>(),
              nullable: false,
            ),
          },
          call:
              (
                _is.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['issue'] as _isyn1z06.IssueEndpoint).getIssue(
                    session,
                    params['id'],
                  ),
        ),
        'listIssues': _is.MethodConnector(
          name: 'listIssues',
          params: {
            'workspaceId': _is.ParameterDescription(
              name: 'workspaceId',
              type: _is.getType<int?>(),
              nullable: true,
            ),
            'status': _is.ParameterDescription(
              name: 'status',
              type: _is.getType<String?>(),
              nullable: true,
            ),
          },
          call:
              (
                _is.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['issue'] as _isyn1z06.IssueEndpoint).listIssues(
                    session,
                    workspaceId: params['workspaceId'],
                    status: params['status'],
                  ),
        ),
        'claimIssue': _is.MethodConnector(
          name: 'claimIssue',
          params: {
            'issueId': _is.ParameterDescription(
              name: 'issueId',
              type: _is.getType<int>(),
              nullable: false,
            ),
            'technicianId': _is.ParameterDescription(
              name: 'technicianId',
              type: _is.getType<int>(),
              nullable: false,
            ),
            'technicianName': _is.ParameterDescription(
              name: 'technicianName',
              type: _is.getType<String>(),
              nullable: false,
            ),
          },
          call:
              (
                _is.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['issue'] as _isyn1z06.IssueEndpoint).claimIssue(
                    session,
                    params['issueId'],
                    params['technicianId'],
                    params['technicianName'],
                  ),
        ),
        'startWork': _is.MethodConnector(
          name: 'startWork',
          params: {
            'issueId': _is.ParameterDescription(
              name: 'issueId',
              type: _is.getType<int>(),
              nullable: false,
            ),
            'technicianId': _is.ParameterDescription(
              name: 'technicianId',
              type: _is.getType<int>(),
              nullable: false,
            ),
          },
          call:
              (
                _is.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['issue'] as _isyn1z06.IssueEndpoint).startWork(
                    session,
                    params['issueId'],
                    params['technicianId'],
                  ),
        ),
        'completeWork': _is.MethodConnector(
          name: 'completeWork',
          params: {
            'issueId': _is.ParameterDescription(
              name: 'issueId',
              type: _is.getType<int>(),
              nullable: false,
            ),
            'technicianId': _is.ParameterDescription(
              name: 'technicianId',
              type: _is.getType<int>(),
              nullable: false,
            ),
            'resolutionNote': _is.ParameterDescription(
              name: 'resolutionNote',
              type: _is.getType<String>(),
              nullable: false,
            ),
            'afterPhotoUrl': _is.ParameterDescription(
              name: 'afterPhotoUrl',
              type: _is.getType<String?>(),
              nullable: true,
            ),
          },
          call:
              (
                _is.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['issue'] as _isyn1z06.IssueEndpoint).completeWork(
                    session,
                    params['issueId'],
                    params['technicianId'],
                    params['resolutionNote'],
                    params['afterPhotoUrl'],
                  ),
        ),
        'verifyResolution': _is.MethodConnector(
          name: 'verifyResolution',
          params: {
            'issueId': _is.ParameterDescription(
              name: 'issueId',
              type: _is.getType<int>(),
              nullable: false,
            ),
            'reporterId': _is.ParameterDescription(
              name: 'reporterId',
              type: _is.getType<int>(),
              nullable: false,
            ),
          },
          call:
              (
                _is.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['issue'] as _isyn1z06.IssueEndpoint)
                  .verifyResolution(
                    session,
                    params['issueId'],
                    params['reporterId'],
                  ),
        ),
        'reopenIssue': _is.MethodConnector(
          name: 'reopenIssue',
          params: {
            'issueId': _is.ParameterDescription(
              name: 'issueId',
              type: _is.getType<int>(),
              nullable: false,
            ),
            'reporterId': _is.ParameterDescription(
              name: 'reporterId',
              type: _is.getType<int>(),
              nullable: false,
            ),
            'reason': _is.ParameterDescription(
              name: 'reason',
              type: _is.getType<String>(),
              nullable: false,
            ),
          },
          call:
              (
                _is.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['issue'] as _isyn1z06.IssueEndpoint).reopenIssue(
                    session,
                    params['issueId'],
                    params['reporterId'],
                    params['reason'],
                  ),
        ),
        'getIssueEvents': _is.MethodConnector(
          name: 'getIssueEvents',
          params: {
            'issueId': _is.ParameterDescription(
              name: 'issueId',
              type: _is.getType<int>(),
              nullable: false,
            ),
          },
          call:
              (
                _is.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['issue'] as _isyn1z06.IssueEndpoint)
                  .getIssueEvents(
                    session,
                    params['issueId'],
                  ),
        ),
      },
    );
    connectors['sandbox'] = _is.EndpointConnector(
      name: 'sandbox',
      endpoint: endpoints['sandbox']!,
      methodConnectors: {
        'runScenario': _is.MethodConnector(
          name: 'runScenario',
          params: {
            'scenario': _is.ParameterDescription(
              name: 'scenario',
              type: _is.getType<String>(),
              nullable: false,
            ),
          },
          call:
              (
                _is.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['sandbox'] as _ie7tqwnd.SandboxEndpoint)
                  .runScenario(
                    session,
                    params['scenario'],
                  ),
        ),
        'seedDemoData': _is.MethodConnector(
          name: 'seedDemoData',
          params: {},
          call:
              (
                _is.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['sandbox'] as _ie7tqwnd.SandboxEndpoint)
                  .seedDemoData(session),
        ),
      },
    );
    connectors['greeting'] = _is.EndpointConnector(
      name: 'greeting',
      endpoint: endpoints['greeting']!,
      methodConnectors: {
        'hello': _is.MethodConnector(
          name: 'hello',
          params: {
            'name': _is.ParameterDescription(
              name: 'name',
              type: _is.getType<String>(),
              nullable: false,
            ),
          },
          call:
              (
                _is.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['greeting'] as _il624ik7.GreetingEndpoint).hello(
                    session,
                    params['name'],
                  ),
        ),
      },
    );
    modules['serverpod_auth_idp'] = _iais.Endpoints()
      ..initializeEndpoints(server);
    modules['serverpod_auth_core'] = _iacs.Endpoints()
      ..initializeEndpoints(server);
  }
}
