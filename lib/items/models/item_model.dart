class ItemModel {
  String? companyNo;
  String? stockCode;
  String? itemOCode;
  String? qty;
  String? itemNo;
  String? name;
  String? categoryId;
  String? itemK;
  String? barcode;
  String? minPrice;
  String? itemL;
  String? isSuspended;
  String? fD;
  String? itemHasSerial;
  String? itemPicsPath;
  String? taxPerc;
  String? isApiPic;
  String? lsPrice;

  ItemModel({
    this.companyNo,
    this.stockCode,
    this.itemOCode,
    this.qty,
    this.itemNo,
    this.name,
    this.categoryId,
    this.itemK,
    this.barcode,
    this.minPrice,
    this.itemL,
    this.isSuspended,
    this.fD,
    this.itemHasSerial,
    this.itemPicsPath,
    this.taxPerc,
    this.isApiPic,
    this.lsPrice,
  });

  factory ItemModel.fromJson(Map<String, dynamic> json) {
    return ItemModel(
      companyNo: json['COMAPNYNO'],
      stockCode: json['STOCK_CODE'],
      itemOCode: json['ItemOCode'],
      qty: json['QTY'],
      itemNo: json['ITEMNO'],
      name: json['NAME'],
      categoryId: json['CATEOGRYID'],
      itemK: json['ItemK'],
      barcode: json['BARCODE'],
      minPrice: json['MINPRICE'],
      itemL: json['ITEML'],
      isSuspended: json['ISSUSPENDED'],
      fD: json['F_D'],
      itemHasSerial: json['ITEMHASSERIAL'],
      itemPicsPath: json['ITEMPICSPATH'],
      taxPerc: json['TAXPERC'],
      isApiPic: json['ISAPIPIC'],
      lsPrice: json['LSPRICE'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'COMAPNYNO': companyNo,
      'STOCK_CODE': stockCode,
      'ItemOCode': itemOCode,
      'QTY': qty,
      'ITEMNO': itemNo,
      'NAME': name,
      'CATEOGRYID': categoryId,
      'ItemK': itemK,
      'BARCODE': barcode,
      'MINPRICE': minPrice,
      'ITEML': itemL,
      'ISSUSPENDED': isSuspended,
      'F_D': fD,
      'ITEMHASSERIAL': itemHasSerial,
      'ITEMPICSPATH': itemPicsPath,
      'TAXPERC': taxPerc,
      'ISAPIPIC': isApiPic,
      'LSPRICE': lsPrice,
    };
  }
}
