import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CardBannerPageViewWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _CardBannerPageViewState();
}

class _CardBannerPageViewState extends State<CardBannerPageViewWidget> {
  List<BannerItem> _bannerItemChildren = List<BannerItem>();
  PageController _controller;

  @override
  void initState() {
    _initBannerData();
    _controller = PageController();
    super.initState();
  }

  void _initBannerData() {
    _bannerItemChildren.clear();
    for (int i = 0; i < 3; i++) {
      BannerItem bannerItem = BannerItem();
      bannerItem._isSelectedCurrent = (i == 0);
      bannerItem._progress = (i % 2 == 0) ? 70 : 10;
      _bannerItemChildren.add(bannerItem);
    }
  }

  void _onRefreshBanner(int currentPageIndex) {
    setState(() {
      if (_bannerItemChildren != null && _bannerItemChildren.length > 0) {
        for (int i = 0; i < _bannerItemChildren.length; i++) {
          _bannerItemChildren[i].isSelectedCurrent = (currentPageIndex == i);
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "我的电卡",
          style: _getTextStyle(16.0),
        ),
        actions: [
          IconButton(
              icon: Image.asset('images/call_service.png'),
              onPressed: () {
                print("点击了拨打客服");
              })
        ],
      ),
      body: Column(
        children: [
          _buildPageViewWidget(_bannerItemChildren),
          _buildPageViewIndicator(_bannerItemChildren),
        ],
      ),
    );
  }

  Widget _buildPageViewWidget(List<BannerItem> itemWidgetList) {
    return Container(
        height: 175,
        child: PageView.builder(
            itemCount: itemWidgetList.length,
            controller: _controller,
            physics: BouncingScrollPhysics(),
            itemBuilder: (context, index) {
              return _buildCardWidget(itemWidgetList[index]);
            },
            onPageChanged: (int currentPageIndex) {
              _onRefreshBanner(currentPageIndex);
            }));
  }

  Widget _buildCardWidget(BannerItem bannerItem) {
    return Card(
      elevation: 5,
      margin: EdgeInsets.fromLTRB(12, 10, 12, 10),
      color: Color(0xff262a30),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(4))),
      child: Container(
        padding: const EdgeInsets.fromLTRB(20, 20, 115, 20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("我的电卡", style: _getTextStyle(18.0)),
            SizedBox(height: 4),
            Text("一卡在手，充电无忧", style: _getTextStyle(12.0)),
            SizedBox(height: 9),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Text("已用 330 度", style: _getTextStyle(14.0)),
              Text("余额 1230 度", style: _getTextStyle(14.0))
            ]),
            SizedBox(height: 10),
            _buildProgressBar(bannerItem._progress, 100, 201),
            SizedBox(height: 10),
            Text("有效期截至2019年8月21日 12:00",
                style: TextStyle(fontSize: 12, color: Color(0x99ffffff))),
          ],
        ),
      ),
    );
  }

  Widget _buildProgressBar(
      int progress, int maxProgress, double progressBarWidth) {
    return Stack(
      children: [
        Container(
            height: 7,
            width: progressBarWidth,
            decoration: BoxDecoration(
                color: Color(0x4cffffff),
                borderRadius: BorderRadius.all(Radius.circular(4)))),
        Container(
            height: 7,
            width: (progress / maxProgress) * progressBarWidth,
            decoration: BoxDecoration(
                color: Color(0xff2187e7),
                borderRadius: BorderRadius.all(Radius.circular(4))))
      ],
    );
  }

  Widget _buildPageViewIndicator(List<BannerItem> _bannerItemChildren) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment:  CrossAxisAlignment.center,
      children: List<Widget>.generate(_bannerItemChildren.length, (int index) {
        return _buildPageViewControllerItem(
            _bannerItemChildren[index]._isSelectedCurrent);
      }),
    );
  }

  Widget _buildPageViewControllerItem(bool isSelected) {
    return Container(
      child: isSelected
          ? Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 17,
                  height: 3,
                  margin: EdgeInsets.only(left: 5),
                  decoration: BoxDecoration(
                      color: Color(0xffffffff),
                      borderRadius: BorderRadius.all(Radius.circular(4))),
                )
              ],
            )
          : Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 10,
                  height: 3,
                  margin: EdgeInsets.only(left: 5),
                  decoration: BoxDecoration(
                      color: Color(0x80ffffff),
                      borderRadius: BorderRadius.all(Radius.circular(4))),
                  child: Row(),
                )
              ],
            ),
    );
  }

  TextStyle _getTextStyle(double fontSize) {
    return new TextStyle(fontSize: fontSize, color: Color(0xffffffff));
  }
}

class BannerItem {
  bool _isSelectedCurrent;
  int _progress;

  bool get isSelectedCurrent => _isSelectedCurrent;

  set isSelectedCurrent(bool value) {
    _isSelectedCurrent = value;
  }

  int get progress => _progress;

  set progress(int value) {
    _progress = value;
  }
}
