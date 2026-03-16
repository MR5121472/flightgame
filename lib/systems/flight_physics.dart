class FlightPhysics {

  double speed = 0;

  double altitude = 0;

  void thrust() {

    speed += 10;
  }

  void brake() {

    speed -= 10;

    if (speed < 0) speed = 0;
  }

  void updateAltitude() {

    altitude += speed * 0.01;
  }
}