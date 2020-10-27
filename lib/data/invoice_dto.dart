class TEInvoicingListInfoDTO{
   String _orderId;
   String _stationName;
   String _startTime;
   double _invoiceableAmount;
   bool _isShowHintView = false;
   bool _isSelecdeItem = false;

   bool get isSelecdeItem => _isSelecdeItem;

   bool get isShowHintView => _isShowHintView;

   String get orderId => _orderId;

   String get stationName => _stationName;

   String get startTime => _startTime;

   double get invoiceableAmount => _invoiceableAmount;

   set isSelecdeItem(bool value) {
    _isSelecdeItem = value;
  }

  set isShowHintView(bool value) {
    _isShowHintView = value;
  }

  set invoiceableAmount(double value) {
    _invoiceableAmount = value;
  }

  set startTime(String value) {
    _startTime = value;
  }

  set stationName(String value) {
    _stationName = value;
  }

  set orderId(String value) {
    _orderId = value;
  }
}
