part of connectivity;

/// A [BluetoothDatum] anonymizer function. Anonymizes the name and discovery name of the bluetooth device.
/// Bluetooth devices' names may contain participants' real name because people use
/// their names to name their computers.
Datum blueetoth_name_anoymizer(Datum datum) {
  assert(datum is BluetoothDatum);
  BluetoothDatum bt = datum as BluetoothDatum;
  return bt
    ..bluetoothDeviceName = sha1.convert(utf8.encode(bt.bluetoothDeviceName)).toString()
    ..advertisementName = sha1.convert(utf8.encode(bt.advertisementName)).toString();
}

/// A [WifiDatum] anonymizer function. Anonymizes the wifi name (SSID) of the wifi network.
/// Wifi network names may contain participants' or house holds' real name because people use
/// their names to name their wifi.
Datum wifi_name_anoymizer(Datum datum) {
  assert(datum is WifiDatum);
  WifiDatum wd = datum as WifiDatum;
  return wd..ssid = sha1.convert(utf8.encode(wd.ssid)).toString();
}
