import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app/data/invoice_dto.dart';

void main() {
  runApp(InvoiceStatelessWidget());
}

class InvoiceStatelessWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _InvoiceState();
  }
}

class _InvoiceState extends State<InvoiceStatelessWidget> {
  final _invoiceList = <TEInvoicingListInfoDTO>[];
  int _orderCount = 0;
  String _orderTotalPrice = "0.0元";
  bool _isAllSelected = false;

  @override
  void initState() {
    _initInvoiceData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "开发票",
          style: TextStyle(
            color: Color(0xffffffff),
            fontSize: 16.0,
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.apps,
              color: Color(0xffffffff),
            ),
            onPressed: () => {print("右侧button点击......")},
          )
        ],
      ),
      body: Container(
        color: Color(0xFF262B33),
        child: _buildStackView(),
      ),
    );
  }

  Widget _buildStackView() {
    return Stack(
      children: [
        Positioned(
            top: 0, bottom: 114, left: 0, right: 0, child: _buildListView()),
        Positioned(bottom: 0, left: 0, right: 0, child: _buildBottomView())
      ],
    );
  }

  Widget _buildListView() {
    return ListView.builder(
        itemCount: _invoiceList.length,
        padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
        itemBuilder: (context, index) {
          if (_invoiceList.length > 0) {
            return _buildCardItem(_invoiceList[index]);
          }
          return null;
        });
  }

  Widget _buildBottomView() {
    return Container(
        child: Column(
      children: [
        Divider(height: 1, thickness: 1, color: Color(0x19ffffff)),
        SizedBox(height: 4),
        Row(
          children: [
            SizedBox(width: 16),
            Text(
              "$_orderCount个订单，共$_orderTotalPrice元",
              style: TextStyle(color: Color(0xFFFFFFFF), fontSize: 12),
            )
          ],
        ),
        SizedBox(height: 4),
        Divider(height: 1, thickness: 1, color: Color(0x19ffffff)),
        Container(
          padding: EdgeInsets.fromLTRB(15, 17, 15, 24),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () {
                  _setStateSelectedAllItem();
                },
                child: Row(
                  children: [
                    Container(
                      width: 24,
                      height: 24,
                      child: Image.asset(_isAllSelected?'images/radio_button_2.webp':'images/radio_button.webp'),
                    ),
                    SizedBox(width: 9),
                    Text("全选",
                        style:
                            TextStyle(color: Color(0xFFFFFFFF), fontSize: 14))
                  ],
                ),
              ),
              Container(
                width: 156,
                height: 46,
                decoration: BoxDecoration(
                    color: Color(0xff228aee),
                    borderRadius: BorderRadius.all(Radius.circular(5))),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("下一步",
                        style:
                            TextStyle(color: Color(0xFFFFFFFF), fontSize: 12))
                  ],
                ),
              ),
            ],
          ),
        )
      ],
    ));
  }

  Widget _buildHintContainer() {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.access_time_outlined),
          SizedBox(width: 5),
          Text(
            "电卡支付不支持开发票",
            style: TextStyle(fontSize: 12, color: Color(0x99ffffff)),
          )
        ],
      ),
      margin: EdgeInsets.fromLTRB(0, 10.0, 0, 0),
    );
  }

  Widget _buildCardItem(TEInvoicingListInfoDTO invoicingListInfoDTO) {
    return invoicingListInfoDTO.isShowHintView
        ? _buildHintContainer()
        : GestureDetector(
            onTap: () {
              _setStateItemDTO(invoicingListInfoDTO);
            },
            child: Card(
                elevation: 5,
                margin: EdgeInsets.fromLTRB(12, 12, 12, 0),
                color: Color(0xff2c323c),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(4))),
                child: _buildItemContainer(invoicingListInfoDTO)));
  }

  Widget _buildItemContainer(TEInvoicingListInfoDTO invoicingListInfoDTO) {
    return Container(
      padding: const EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    width: 24,
                    height: 24,
                    child: Image.asset(invoicingListInfoDTO.isSelecdeItem
                        ? 'images/radio_button_2.webp'
                        : 'images/radio_button.webp'),
                  ),
                  SizedBox(width: 12),
                  Row(
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      children: [
                        Text(
                          invoicingListInfoDTO.invoiceableAmount.toString(),
                          style: TextStyle(
                            color: Color(0xffffffff),
                            fontSize: 28,
                          ),
                        ),
                        Text("元",
                            style: TextStyle(
                                color: Color(0xffffffff), fontSize: 14)),
                      ]),
                ],
              ),
              Text(
                invoicingListInfoDTO.startTime,
                style: TextStyle(color: Color(0x9999ffffff), fontSize: 14),
              ),
            ],
          ),
          SizedBox(height: 8),
          Container(
            padding: const EdgeInsets.fromLTRB(36, 0, 0, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  invoicingListInfoDTO.stationName,
                  style: TextStyle(color: Color(0x99ffffff), fontSize: 14),
                ),
                SizedBox(height: 9),
                Text(
                  "订单号：" + invoicingListInfoDTO.orderId,
                  style: TextStyle(color: Color(0x99ffffff), fontSize: 14),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  void _initInvoiceData() {
    setState(() {
      _invoiceList.clear();
      for (int i = 0; i < 21; i++) {
        TEInvoicingListInfoDTO _invoiceDTO = TEInvoicingListInfoDTO();
        if (i == 0) {
          _invoiceDTO.isShowHintView = true;
        } else {
          _invoiceDTO.invoiceableAmount = 29.7;
          _invoiceDTO.orderId = "1234567890" + "---" + i.toString();
          _invoiceDTO.startTime = "2019年1月1日 12:00";
          _invoiceDTO.stationName = "上海站南广场充电站";
        }
        _invoiceList.add(_invoiceDTO);
      }
    });
  }

  void _setStateItemDTO(TEInvoicingListInfoDTO teInvoicingListInfoDTO) {
    setState(() {
      for (int i = 0; i < _invoiceList.length; i++) {
        if (_invoiceList[i] == teInvoicingListInfoDTO) {
          _invoiceList[i].isSelecdeItem =
              _invoiceList[i].isSelecdeItem ? false : true;
        }
      }
    });
  }

  void _setStateSelectedAllItem() {
    setState(() {
      _isAllSelected = !_isAllSelected;
      for (int i = 0; i < _invoiceList.length; i++) {
        _invoiceList[i].isSelecdeItem = _isAllSelected
            ? _invoiceList[i].isSelecdeItem = true
            : _invoiceList[i].isSelecdeItem = false;
      }
    });
  }
}
