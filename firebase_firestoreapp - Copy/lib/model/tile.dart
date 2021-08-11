class Tile {
  String uid;
  String iName;
  String itemCount;

  Tile({this.uid, this.iName, this.itemCount});
  Tile.fromMap(Map<String, dynamic> data) {
    uid = data['uid'];
    iName = data['Tile Name'];
    itemCount = data['Total Quantity'];
  }
  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'Tile Name': iName,
      'Total Quantity': itemCount,
    };
  }
}
