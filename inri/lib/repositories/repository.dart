class Repository {
  static Repository? _instance;

  static Repository getInstance() => _instance = _instance != null ? _instance! : Repository();

  static void init() => Repository.getInstance();

  // late AlarmRepository alarmRepository;
  // late AuthRepository authRepository;
  // late DriverRepository driverRepository;
  // late FuelRepository fuelRepository;
  // late MenuRepository menuRepository;
  // late ReferencePointRepository referencePointRepository;
  // late ReportRepository reportRepository;
  // late UserRepository userRepository;
  // late VehicleRepository vehicleRepository;

  Repository() {
    // alarmRepository = AlarmRepository();
    // authRepository = AuthRepository();
    // driverRepository = DriverRepository();
    // fuelRepository = FuelRepository();
    // menuRepository = MenuRepository();
    // referencePointRepository = ReferencePointRepository();
    // reportRepository = ReportRepository();
    // userRepository = UserRepository();
    // vehicleRepository = VehicleRepository();
  }
}