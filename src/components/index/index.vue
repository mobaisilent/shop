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
  // 除了重定向之外还需要将对应的localstoryg给清理掉
  localStorage.clear();
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

function judgelogin(event) {
  console.log("here judge loging ");
  if (statu.value == true) {
    event.preventDefault();  // 阻止a标签的默认行为
    alert("请先登录");
    // 然后弹出警告框
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
          <span class="link js-register" id="showname" v-show="!statu && jsonStr" @click="to_login">退出登录</span>
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
          <a class="link" href="../../../html/order/order.html" @click="judgelogin">我的订单</a>
        </li>
        <li class="nav-item">
          <a class="link" href="../../../html/user/address.html" @click="judgelogin">我的地址</a>
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
            <img class="floor-img" src="../../../public/image/floor/1.jpg" alt="双开门冰箱" />
          </a>
        </li>
        <li class="floor-item">
          <a href="./list.html?categoryId=100007">
            <span class="floor-text">电视</span>
            <img class="floor-img" src="../../../public/image/floor/2.jpg" alt="电视" />
          </a>
        </li>
        <li class="floor-item">
          <a href="./list.html?categoryId=100008">
            <span class="floor-text">洗衣机</span>
            <img class="floor-img" src="../../../public/image/floor/3.jpg" alt="洗衣机" />
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
    <div class="anime1" id="animatedElement">
      <p>其他功能正在完善中，敬请期待...</p>
    </div>

  </div>

  <!--index-->
  <!--footer-->
  <div class=" footer">
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

.amine1 {
  width: 100px;
  height: 30px;
  display: block;
  position: absolute;
  left: 50%;
  background-color: pink;
  text-align: center;
  /* 这里可以添加之前我喜欢的从左到右动画效果 */
}

.anime1 p {
  /* background-color: aqua; */
  margin-left: 38%;
  animation: span_move linear infinite 7s;
  font-family: YouYuan;
}

@keyframes span_move {
  0% {
    transform: translate(100%);
  }

  33% {
    transform: translate(0%);
  }

  /* 在0%的位置暂停2秒 */
  66% {
    transform: translate(0%);
  }

  100% {
    transform: translate(-100%);
  }
}
</style>
/* 创建index组件 */