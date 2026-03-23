sealed class OjManagementEvent {
  const OjManagementEvent();
}

class OjManagementStarted extends OjManagementEvent {
  const OjManagementStarted();
}

class OjManagementRefreshRequested extends OjManagementEvent {
  const OjManagementRefreshRequested();
}
