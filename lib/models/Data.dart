class Data {
  final int id;
  final String sumber;
  final String tgl_terima;
  final double soilhumid;
  final double airhumid;
  final double temp;
  final double lightint;
  final String tanaman_status;

  Data({
    this.id = 0,
    this.sumber = '',
    this.tgl_terima = '',
    this.soilhumid = 0,
    this.airhumid = 0,
    this.temp = 0,
    this.lightint = 0,
    this.tanaman_status = ''
  });
}
