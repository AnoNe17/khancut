class SoalSrq {
  String soal;
  int nilai_1, nilai_2;

  SoalSrq(this.soal, this.nilai_1, this.nilai_2);

  @override
  String toString() {
    return '{ ${this.soal}, ${this.nilai_1}, ${this.nilai_2}}';
  }

}
