// User roles
app.constant('USER_ROLES', {
    all: ['ROLES_ADMIN', 'ROLES_LEADER', 'ROLES_WORKER'],
    admin: 'ROLES_ADMIN',
    worker: 'ROLES_WORKER',
    leader: 'ROLES_LEADER'
});

// Authentication events
app.constant('AUTH_EVENTS', {
    loginSuccess: 'auth-login-success',
    badRequest: 'auth-bad-request',
    logoutSuccess: 'auth-logout-success',
    sessionCreated: 'auth-session-created',
    sessionTimeout: 'auth-session-timeout',
    notAuthenticated: 'auth-not-authenticated',
    notAuthorized: 'auth-not-authorized',
    refreshNeeded: 'app-refresh-needed'
});

app.constant('PROGRESS_BAR_EVENTS', {
    stop: "progress_bar_stop",
    start: "progress_bar_start",
    once: "progress_bar_once",
    stop_once: "progress_bar_stop_once"
});

