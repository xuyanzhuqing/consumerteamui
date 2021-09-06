import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:matcher/matcher.dart';

class Product extends StatefulWidget {
  Product({Key? key}) : super(key: key);

  @override
  _ProductState createState() => _ProductState();
}

class _ProductState extends State<Product> {
  List<Navsitem> navsList = [];
  //在这里标签页面使用的是TabView所以需要创建一个控制器
  @override
  void initState() {
    this.initData();
    super.initState();
    //初始化
  }

  void initData() {
    List<Navsitem> Nlist = [];
    List<String> TextArr = [
      "火锅",
      "川菜",
      "麻辣烫",
      "水煮鱼",
      "冒菜",
      "火锅",
      "川菜",
      "麻辣烫",
      "水煮鱼",
      "冒菜"
    ];
    for (var i = 0; i < 10; i++) {
      Nlist.add(Navsitem(
        title: TextArr[i],
        goUrl: "3423423",
        isSelected: false,
        icon: IconData(0xe61b, fontFamily: 'Albb'),
        imgUrl:
            "https://gimg2.baidu.com/image_search/src=http%3A%2F%2F5b0988e595225.cdn.sohucs.com%2Fimages%2F20170830%2F76585c94bae14b91b4071b69b5ad9d89.jpeg",
      ));
    }
    setState(() {
      navsList = Nlist;
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: navsList.length,
        child: Container(
            child: NestedScrollView(
                //配置可折叠的头布局
                headerSliverBuilder:
                    (BuildContext context, bool innerBoxIsScrolled) {
                  return [
                    buildSliverAppBar(),
                  ];
                },
                //页面的主体内容
                body: TabBarView(
                  children: navsList.map((f) {
                    return Container(
                      child: ListView.builder(
                        shrinkWrap: true, //使用子控件的总长度来设置ListView的长度（这里的长度为高度）
                        scrollDirection: Axis.vertical,
                        itemCount: navsList.length,
                        itemBuilder: (BuildContext ctxt, int index) {
                          return renderView(context, index);
                        },
                      ),
                    );
                  }).toList(),
                ))));

    // return DefaultTabController(
    //     length: navsList.length,
    //     child: NestedScrollView(
    //       headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
    //         return <Widget>[
    //           SliverAppBar(
    //               backgroundColor: Theme.of(context).colorScheme.primaryVariant,
    //               expandedHeight: 100.0,
    //               automaticallyImplyLeading: false, // 隐藏返回图标
    //               pinned: true,
    //               flexibleSpace: Container(
    //                   child: Column(
    //                 children: [
    //                   renderSearchInput(),
    //                   Container(
    //                     margin: EdgeInsets.only(top: 10),
    //                     child: Row(
    //                       mainAxisSize: MainAxisSize.max,
    //                       children: <Widget>[
    //                         Expanded(
    //                           child: TabBar(
    //                             isScrollable: true, //多个按钮可以滑动
    //                             tabs: navsList.map((v) {
    //                               return Container(
    //                                 height: 50,
    //                                 child: Column(
    //                                   children: [
    //                                     Container(
    //                                         width: 35,
    //                                         child: Image.network(v.imgUrl)),
    //                                     Text(v.title)
    //                                   ],
    //                                 ),
    //                               );
    //                             }).toList(),
    //                           ),
    //                         )
    //                       ],
    //                     ),
    //                   )
    //                 ],
    //               ))),
    //         ];
    //       },
    //       body: TabBarView(
    //         children: navsList.map((f) {
    //           return Container(
    //             child: ListView.builder(
    //               shrinkWrap: true, //使用子控件的总长度来设置ListView的长度（这里的长度为高度）
    //               scrollDirection: Axis.vertical,
    //               itemCount: navsList.length,
    //               itemBuilder: (BuildContext ctxt, int index) {
    //                 return renderView(context, index);
    //               },
    //             ),
    //           );
    //         }).toList(),
    //       ),
    //     ));
  }

  Widget buildSliverAppBar() {
    return SliverAppBar(
        title: buildHeader(),
        //标题居中
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.primaryVariant,
        automaticallyImplyLeading: false, // 隐藏返回图标
        //当此值为true时 SliverAppBar 会固定在页面顶部
        //当此值为fase时 SliverAppBar 会随着滑动向上滑动
        pinned: true,
        //当值为true时 SliverAppBar设置的title会随着上滑动隐藏
        //然后配置的bottom会显示在原AppBar的位置
        //当值为false时 SliverAppBar设置的title会不会隐藏
        //然后配置的bottom会显示在原AppBar设置的title下面
        floating: false,
        //当snap配置为true时，向下滑动页面，SliverAppBar（以及其中配置的flexibleSpace内容）会立即显示出来，
        //反之当snap配置为false时，向下滑动时，只有当ListView的数据滑动到顶部时，SliverAppBar才会下拉显示出来。
        snap: false,
        elevation: 0.0,
        //展开的高度
        expandedHeight: 100,
        //AppBar下的内容区域
        // flexibleSpace: Container(   //滑动遮盖的部分
        // )
        bottom: PreferredSize(
            preferredSize: Size(MediaQuery.of(context).size.width, 44),
            child: Container(
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  Expanded(
                    child: TabBar(
                      isScrollable: true, //多个按钮可以滑动
                      tabs: navsList.map((v) {
                        return Container(
                          height: 50,
                          child: Column(
                            children: [
                              Icon(
                                v.icon,
                                size: 25,
                                color: Colors.white,
                              ),
                              // Container(
                              //     width: 35, child: Image.network(v.imgUrl)),
                              Text(v.title)
                            ],
                          ),
                        );
                      }).toList(),
                    ),
                  )
                ],
              ),
            )));
  }

  Widget buildHeader() {
    //透明组件
    return Container(
      width: double.infinity,
      height: 30,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.white),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.search_rounded,
            size: 18,
          ),
          SizedBox(
            width: 4,
          ),
          Text(
            "搜索",
            style: TextStyle(
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }

  Widget renderView(context, index) {
    return new InkWell(
        onTap: () {
          setState(() {
            Navigator.of(context).pushNamed('DetailProduct');
          });
        },
        child: Container(
          padding: EdgeInsets.all(10),
          child: Row(
            children: [
              Container(
                width: 100,
                child: Image.network(navsList[index].imgUrl),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              Expanded(
                child: Stack(
                  children: <Widget>[
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.only(left: 5),
                          child: Text(navsList[index].title,
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.black,
                              )),
                        ),
                        Container(
                            padding: EdgeInsets.only(left: 5),
                            child: Text("测试数据测试数据测试数据测试数据测试数据数据测试数据测试数据",
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.black,
                                ))),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                width: 50,
                child: Column(
                  children: [
                    Icon(
                      Icons.message,
                      size: 35,
                      color: Colors.brown,
                    ),
                    Text("添加")
                  ],
                ),
              )
            ],
          ),
        ));
  }

  Widget renderSearchInput() {
    return new ConstrainedBox(
      constraints: BoxConstraints(
        maxHeight: 34,
      ),
      child: TextField(
        autofocus: false,
        keyboardType: TextInputType.text,
        textInputAction: TextInputAction.search,
        onChanged: (str) {},
        decoration: InputDecoration(
          // contentPadding: EdgeInsets.fromLTRB(0, 0, 0, 0),
          // focusedBorder: new OutlineInputBorder(  //有焦点时
          //   borderSide: BorderSide(color: Colors.red),
          //   borderRadius: BorderRadius.all(Radius.circular(999)),
          // ),
          border: OutlineInputBorder(
            ///设置边框四个角的弧度
            borderRadius: BorderRadius.all(Radius.circular(999)),

            ///用来配置边框的样式
            borderSide: BorderSide(color: Colors.red),
          ),
          hintText: "请输入",
          hintStyle: TextStyle(color: Colors.grey, fontSize: 14, height: 1),
          prefixIcon: Icon(Icons.search, size: 16),
          suffixIcon:
              IconButton(icon: Icon(Icons.close, size: 16), onPressed: () {}),
        ),
      ),
    );
  }
}

class Navsitem {
  Navsitem({
    required this.title,
    required this.imgUrl,
    required this.isSelected,
    required this.icon,
    this.goUrl,
  });
  // 按钮名称
  String title;
  // 按钮图片
  String imgUrl;
  //是否选种
  bool isSelected;
  //是否选种
  dynamic icon;
  //跳转路由
  String? goUrl;
}
