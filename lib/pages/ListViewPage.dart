import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';

/**
 * Copyright (C), 2015-2021, suntront
 * FileName: ListViewPage
 * Author: Jeek
 * Date: 2021/4/12
 * Description:
 */

class ListViewPage extends StatefulWidget {
  @override
  ListViewPageState createState() {
    return ListViewPageState();
  }
}

class ListViewPageState extends State<ListViewPage> {
  // 总数
  int _count = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ListView",style: TextStyle(color: Colors.black),),
        backgroundColor: Colors.white,
        centerTitle: true,
      ),
      body: EasyRefresh.custom(
        emptyWidget: _count == 0
            ? Container(
          height: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Expanded(
                child: SizedBox(),
                flex: 2,
              ),
              SizedBox(
                width: 100.0,
                height: 100.0,
                child: Image.asset('assets/images/nodata.png'),
              ),
              Text(
                "暂无数据",
                style: TextStyle(fontSize: 16.0, color: Colors.grey[400]),
              ),
              Expanded(
                child: SizedBox(),
                flex: 3,
              ),
            ],
          ),
        )
            : null,
        slivers: <Widget>[
          SliverList(
            delegate: SliverChildBuilderDelegate(
                  (context, index) {
                return SampleListItem(index:index);
              },
              childCount: _count,
            ),
          ),
        ],
        onRefresh: () async {
          await Future.delayed(Duration(seconds: 2), () {
            if (mounted) {
              setState(() {
                _count = 20;
              });
            }
          });
        },
        onLoad: () async {
          await Future.delayed(Duration(seconds: 2), () {
            if (mounted) {
              setState(() {
                _count += 20;
              });
            }
          });
        },
      ),
    );
  }
}

//列表Item
class SampleListItem extends StatelessWidget {
  /// 方向
  final Axis direction;

  /// 宽度
  final double width;
  int index = 0;

   SampleListItem({
    Key? key,
    this.direction = Axis.vertical,
    this.width = double.infinity,
    this.index = 0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return direction == Axis.vertical
        ? Card(
      child: Container(
        child: Row(
          children: <Widget>[
            Container(
              height: 100.0,
              child: AspectRatio(
                aspectRatio: 1.0,
                child: Container(
                  color: Colors.grey[200],
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                  padding: EdgeInsets.all(
                    10.0,
                  ),
                  color: Colors.white,
                  child: Column(
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Container(
                                width: 120.0,
                                height: 15.0,
                                color: Colors.grey[200],
                              ),
                              Text("$index"),
                            ],
                          ),
                          Expanded(
                            flex: 1,
                            child: SizedBox(),
                          ),
                          Icon(
                            Icons.star,
                            color: Colors.grey[200],
                          )
                        ],
                      ),
                      SizedBox(
                        height: 8.0,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            height: 10.0,
                            color: Colors.grey[200],
                          ),
                          SizedBox(
                            height: 4.0,
                          ),
                          Container(
                            height: 10.0,
                            color: Colors.grey[200],
                          ),
                          SizedBox(
                            height: 4.0,
                          ),
                          Container(
                            height: 10.0,
                            width: 150.0,
                            color: Colors.grey[200],
                          ),
                        ],
                      ),
                    ],
                  )),
            ),
          ],
        ),
      ),
    )
        : Card(
      child: Container(
        alignment: Alignment.center,
        child: Column(
          children: <Widget>[
            Container(
              height: 100.0,
              width: width,
              color: Colors.grey[200],
            ),
            Container(
              width: width,
              padding: EdgeInsets.all(10.0),
              child: Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            width: 80.0,
                            height: 15.0,
                            color: Colors.grey[200],
                          ),
                          Container(
                            width: 60.0,
                            height: 10.0,
                            margin: EdgeInsets.only(top: 8.0),
                            color: Colors.grey[200],
                          ),
                        ],
                      ),
                      Expanded(
                        flex: 1,
                        child: SizedBox(),
                      ),
                      Icon(
                        Icons.star,
                        color: Colors.grey[200],
                      )
                    ],
                  ),
                  SizedBox(
                    height: 8.0,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        height: 10.0,
                        color: Colors.grey[200],
                      ),
                      SizedBox(
                        height: 4.0,
                      ),
                      Container(
                        height: 10.0,
                        color: Colors.grey[200],
                      ),
                      SizedBox(
                        height: 4.0,
                      ),
                      Container(
                        height: 10.0,
                        width: 100.0,
                        color: Colors.grey[200],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}