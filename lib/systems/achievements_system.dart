class AchievementsSystem {

  bool firstTakeoff = false;

  bool firstLanding = false;

  void unlockTakeoff() {
    firstTakeoff = true;
  }

  void unlockLanding() {
    firstLanding = true;
  }
}