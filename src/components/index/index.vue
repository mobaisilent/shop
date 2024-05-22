<script setup>
import { ref } from 'vue';
// 位置要正确：否则报错
// var json = JSON.parse(localStorage.getItem("json"));
// console.log(json.data.userInfo.userName);
// 当json为空对象的时候加载错误所以报错：：所以vue无法渲染,var那句是可以的，后面那句不行
// const to_login = document.getElementById("to_login");
// to_login.addEventListener("click", () => {
// window.location.href = "../../../../index.html";
// });

// 保存是否正常登录，默认true表示未登录：显示登录选项和注册选项
const statu = ref(true);
var jsonStr = localStorage.getItem("json");
console.log(jsonStr);
if (jsonStr) {
  // 对象是否存在处理逻辑
  var json = JSON.parse(jsonStr);
  console.log(json);
  console.log(json.data.userInfo.userName);
  // 存在就打印信息给我看，将statu改为false：表示不显示登录和注册选项：显示我的信息选项
  statu.value = false;
} else {
  console.log("json not found in localStorage");
  // 否则打印报错信息
}
function to_login() {
  window.location.href = "../../../../index.html";
}

function register() {
  window.location.href = "../../../html/login/add.html";
}

function userinfo() {
  window.location.href = "../../../html/user/userinfo.html";
}

const showLong = ref('登录');
// 仔细想想 v-if 就能实现局部刷新

console.log(statu.value);

function judgelogin() {
  console.log("here judge loging");
  // 临时检测judge使用：是否需要弹窗，或者正常跳转
  if (statu.value == true) {
    alert("请先登录");
    // 刷新当前页面
    // window.location.reload();
    // 刷新当前页面失效
    window.location.href = "../../";
  }
}
</script>
<!-- 直接复制模块竟然出错了 -->

<template>
  <!--nav-->
  <div class="nav">
    <div class="w">
      <div class="user-info">
        <span class="user not-login">
          <span class="link js-login" id="to_login" v-show="statu" @click="to_login">登录</span>
          <span class="link js-register" id="register" v-show="statu" @click="register">注册</span>
          <span class="link js-register" id="showname" v-show="!statu && jsonStr" @click="userinfo">我的信息</span>
          <span class="link js-register" id="showname" v-show="!statu && jsonStr" @click="to_login">重新登录</span>
        </span>
        <span class="user login">
          <span class="link-text">
            欢迎，
            <span class="username"></span>
          </span>
          <span class="link js-logout">退出</span>
        </span>
      </div>
      <ul class="nav-list">
        <li class="nav-item">
          <a class="link" href="./cart.html" @click="judgelogin">
            <i class="fa fa-shopping-cart"></i>
            购物车(<span class=" cart-count">0</span>)
          </a>
        </li>
        <li class="nav-item">
          <a class="link" href="../../../html/order/order.html" @click="judgelogin()">我的订单</a>
        </li>
        <li class="nav-item">
          <a class="link" href="../../../html/user/address.html" @click="judgelogin()">我的地址</a>
        </li>
      </ul>
    </div>
  </div>
  <!--nav-->
  <!--header-->
  <div class="header">
    <div class="w">
      <a class="logo" href="./index.html">SHOP</a>
      <div class="search-con">
        <input class="search-input" id="search-input" placeholder="请输入商品名称" />
        <button class="btn search-btn" id="search-btn">搜索</button>
      </div>
    </div>
  </div>
  <!--header-->
  <!--index-->
  <div class="w">
    <div class="banner-con" style="margin-left: 135px;">
      <!--<div class="loading"></div>-->
      <ul>
        <li><a href="" title=""><img class="banner-img" src="../../../../public/logo/logo.png" alt=""></a> </li>
      </ul>
    </div>
  </div>
  <div class="w">
    <div class="floor-wrap">
      <h1 class="floor-title">F1 家用电器</h1>
      <ul class="floor-list">
        <li class="floor-item">
          <a href="./list.html?categoryId=100006">
            <span class="floor-text">双开门冰箱</span>
            <img class="floor-img" src="../../../public/image/floor/floor1-1.jpg" alt="双开门冰箱" />
          </a>
        </li>
        <li class="floor-item">
          <a href="./list.html?categoryId=100007">
            <span class="floor-text">电视</span>
            <img class="floor-img" src="../../../public/image/floor/floor1-2.jpg" alt="电视" />
          </a>
        </li>
        <li class="floor-item">
          <a href="./list.html?categoryId=100008">
            <span class="floor-text">洗衣机</span>
            <img class="floor-img" src="../../../public/image/floor/floor1-3.jpg" alt="洗衣机" />
          </a>
        </li>
        <li class="floor-item">
          <a href="./list.html?categoryId=100009">
            <span class="floor-text">空调</span>
            <img class="floor-img" src="../../../public/image/floor/floor1-4.jpg" alt="空调" />
          </a>
        </li>
        <li class="floor-item">
          <a href="./list.html?categoryId=100010">
            <span class="floor-text">热水器</span>
            <img class="floor-img" src="../../../public/image/floor/floor1-5.jpg" alt="热水器" />
          </a>
        </li>
      </ul>
    </div>
    <div class="floor-wrap">
      <h1 class="floor-title">F2 数码3C</h1>
      <ul class="floor-list">
        <li class="floor-item">
          <a href="./list.html?categoryId=100011">
            <span class="floor-text">笔记本电脑</span>
            <img class="floor-img" src="../../../public/image/floor/floor2-1.jpg" alt="笔记本电脑" />
          </a>
        </li>
        <li class="floor-item">
          <a href="./list.html?categoryId=100012">
            <span class="floor-text">手机</span>
            <img class="floor-img" src="../../../public/image/floor/floor2-2.jpg" alt="手机" />
          </a>
        </li>
        <li class="floor-item">
          <a href="./list.html?categoryId=100013">
            <span class="floor-text">平板电脑</span>
            <img class="floor-img" src="../../../public/image/floor/floor2-3.jpg" alt="平板电脑" />
          </a>
        </li>
        <li class="floor-item">
          <a href="./list.html?categoryId=100014">
            <span class="floor-text">数码相机</span>
            <img class="floor-img" src="../../../public/image/floor/floor2-4.jpg" alt="数码相机" />
          </a>
        </li>
        <li class="floor-item">
          <a href="./list.html?categoryId=100015">
            <span class="floor-text">3C配件</span>
            <img class="floor-img" src="../../../public/image/floor/floor2-5.jpg" alt="3C配件" />
          </a>
        </li>
      </ul>
    </div>
    <div class="floor-wrap">
      <h1 class="floor-title">F3 服装箱包</h1>
      <ul class="floor-list">
        <li class="floor-item">
          <a href="./list.html?categoryId=100016">
            <span class="floor-text">女装</span>
            <img class="floor-img" src="../../../public/image/floor/floor3-1.jpg" alt="女装" />
          </a>
        </li>
        <li class="floor-item">
          <a href="./list.html?categoryId=100017">
            <span class="floor-text">帽子专区</span>
            <img class="floor-img" src="../../../public/image/floor/floor3-2.jpg" alt="帽子专区" />
          </a>
        </li>
        <li class="floor-item">
          <a href="./list.html?categoryId=100018">
            <span class="floor-text">旅行箱</span>
            <img class="floor-img" src="../../../public/image/floor/floor3-3.jpg" alt="旅行箱" />
          </a>
        </li>
        <li class="floor-item">
          <a href="./list.html?categoryId=100019">
            <span class="floor-text">手提包</span>
            <img class="floor-img" src="../../../public/image/floor/floor3-4.jpg" alt="手提包" />
          </a>
        </li>
        <li class="floor-item">
          <a href="./list.html?categoryId=100020">
            <span class="floor-text">保暖内衣</span>
            <img class="floor-img" src="../../../public/image/floor/floor3-5.jpg" alt="保暖内衣" />
          </a>
        </li>
      </ul>
    </div>
    <div class="floor-wrap">
      <h1 class="floor-title">F4 食品生鲜</h1>
      <ul class="floor-list">
        <li class="floor-item">
          <a href="./list.html?categoryId=100021">
            <span class="floor-text">最爱零食</span>
            <img class="floor-img" src="../../../public/image/floor/floor4-1.jpg" alt="最爱零食" />
          </a>
        </li>
        <li class="floor-item">
          <a href="./list.html?categoryId=100022">
            <span class="floor-text">生鲜</span>
            <img class="floor-img" src="../../../public/image/floor/floor4-2.jpg" alt="生鲜" />
          </a>
        </li>
        <li class="floor-item">
          <a href="./list.html?categoryId=100023">
            <span class="floor-text">半成品菜</span>
            <img class="floor-img" src="../../../public/image/floor/floor4-3.jpg" alt="半成品菜" />
          </a>
        </li>
        <li class="floor-item">
          <a href="./list.html?categoryId=100024">
            <span class="floor-text">速冻专区</span>
            <img class="floor-img" src="../../../public/image/floor/floor4-4.jpg" alt="速冻专区" />
          </a>
        </li>
        <li class="floor-item">
          <a href="./list.html?categoryId=100025">
            <span class="floor-text">进口牛奶</span>
            <img class="floor-img" src="../../../public/image/floor/floor4-5.jpg" alt="进口牛奶" />
          </a>
        </li>
      </ul>
    </div>
    <div class="floor-wrap">
      <h1 class="floor-title">F5 酒水饮料</h1>
      <ul class="floor-list">
        <li class="floor-item">
          <a href="./list.html?categoryId=100026">
            <span class="floor-text">白酒</span>
            <img class="floor-img" src="../../../public/image/floor/floor5-1.jpg" alt="白酒" />
          </a>
        </li>
        <li class="floor-item">
          <a href="./list.html?categoryId=100027">
            <span class="floor-text">红酒</span>
            <img class="floor-img" src="../../../public/image/floor/floor5-2.jpg" alt="红酒" />
          </a>
        </li>
        <li class="floor-item">
          <a href="./list.html?categoryId=100028">
            <span class="floor-text">饮料</span>
            <img class="floor-img" src="../../../public/image/floor/floor5-3.jpg" alt="饮料" />
          </a>
        </li>
        <li class="floor-item">
          <a href="./list.html?categoryId=100029">
            <span class="floor-text">调制鸡尾酒</span>
            <img class="floor-img" src="../../../public/image/floor/floor5-4.jpg" alt="调制鸡尾酒" />
          </a>
        </li>
        <li class="floor-item">
          <a href="./list.html?categoryId=100030">
            <span class="floor-text">进口洋酒</span>
            <img class="floor-img" src="../../../public/image/floor/floor5-5.jpg" alt="进口洋酒" />
          </a>
        </li>
      </ul>
    </div>
  </div>

  <!--index-->
  <!--footer-->
  <div class="footer">
    <div class="w">
      <div class="links">
        <a class="link" href="http://www.imooc.com" target="_blank">慕课网</a> |
        <a class="link" href="https://www.baidu.com" target="_blank">百度</a> |
        <a class="link" href="https://www.taobao.com" target="_blank">淘宝</a> |
        <a class="link" href="https://www.zhihu.com" target="_blank">知乎</a>
      </div>
      <p class="copyright">
        Copyright © 2024 mobai All Right Reserved
      </p>
    </div>
  </div>
  <!--footer-->
</template>

<style>
@import "../../CSS/index/index_multi.css";

.banner-con .banner-img {
  width: 100%;
  height: 370px;
}
</style>
/* 创建index组件 */