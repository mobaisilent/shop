<script setup>
import { onMounted, ref, onUnmounted } from 'vue';
// import addbutton from "../../components/shop/addbutton.vue";
//导入动态展示“添加到购物车”的按键  我还是放弃了该组件：：什么时候我的每个组件下面都一个按钮了？？？
import search from './search.vue';
import { provide } from 'vue';
import { nextTick } from 'vue';
import { stringifyQuery } from 'vue-router';
import "../../JS/index/toup";
import seckill from '../seckill/seckill.vue';

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
  else {
    window.localStorage.setItem("tocartinfo", JSON.stringify(cartinfo.value));
    // 打包为JSON数据类型就行了：否则老是无法正常使用该全局变量
  }
}



console.log(localStorage.getItem("json")); //依旧是json数据块
var json = JSON.parse(localStorage.getItem("json")); //依旧是将json数据块转为json格式
const token = json && json.data ? json.data.token : null;
// 需要 先检测token是否存在：不然就报错


// 下面这段是为search服务  
console.log("here is token for search");
// console.log(token); // 依旧是我最常用的打印token数据  
const ifsearch = ref(false);
const searchwhat = ref('');
function searchbutton() {
  // console.log(searchwhat.value);
  ifsearch.value = true; // 显示窗口
  // 先创建一个全局共享变量到search中：search中获得该变量后显示该页面信息
  window.localStorage.setItem("searchwhat", searchwhat.value);
  // 创建好了变量之后重定向到显示页面吧：使用动态组件的显示似乎不太方便
  fetch("http://localhost:4000/api/v1/product/search", {
    method: 'POST',
    headers: {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ' + token,
      // 这里注意Bearer后面有一个空格：否则错误
      // ok 接收到响应数据：只是尚未处理罢了
    },
    body: JSON.stringify({
    })
  })
    .then(response => {
      if (!response.ok) {
        alert("请检查你的登录状态/服务器/网络状态")
        throw new Error('Network response was not ok');
      }
      return response.json();
    })
    .then(data => {
      console.log(data);
      // ok查询成功：传入一个空的body的JSON就行了
      var json = JSON.stringify(data);
      // console.log(json);
      // 这里再迟调到到需要主动将传出去的数据JSON化，不然就是object，调试数据浪费时间
      window.localStorage.setItem("allproduct", json);
    });
  // 我勒个豆：这边局部格式不方便传递就传递整个json就好了：省的将json拆开之后内容就不是json格式了：传递object不方便使用
}
provide("ifsearch", ifsearch);
provide("searchwhat", searchwhat);
// provide("item", item);
// 这里标注一下：响应式变量的传递时不需要使用value的：只是再某些二是直接修改值的时候需要使用.value：
// 使用插值表达式的就不需要使用.value




// 下面开始实现添加购物车功能了，主要是定位系统（id） ：重点是商品id不是从1开始而是从3开始的
// ok使用onmouseenter实现了动态的id切换（进入某个框架的时候切换）
const curid = ref(0); //处理哪个id
const cartcnt = ref(0); //处理显示的购物车数量
const cartinfo = ref([]); //处理向购物车传递的信息
const tocartinfo = JSON.parse(window.localStorage.getItem("tocartinfo"));
if (tocartinfo) {
  var temp = 0;
  console.log(tocartinfo);
  console.log(tocartinfo.length);
  for (var i = 0; i < tocartinfo.length; i++) {
    temp += tocartinfo[i].cnt;
  }
  console.log(temp);
  cartcnt.value = temp;  // ok成功了
  cartinfo.value = tocartinfo;
  console.log(cartinfo.value);
}
// 使用响应式变量失败就使用全局变量吧：：纠正，还是响应式变量：要用分号
// provide("id", id);
// 将id向（添加购物车）按钮提供id值：：注：provide失败
// this.$nextTick(() => {
//   document.getElementById("add-to-cart-button").addEventListener('click', () => {
//     console.log(id.value);
//   });
// });
// const cartbutton = document.getElementById('tocart');
// 想要为这个button添加事件但是依旧失效
// cartbutton.addEventListener("click", function () {
//   alert("helloworld");
// });

// 下面这里开始生效咯
// function test() {
//   console.log("here");
// }
// ok终于实现了为button添加点击按钮：原来button的实现全靠css文件：与addbutton.vue压根没啥关系：所以添加事件失效
// 免责声明：addbutton由gpt4o生成：难免有些bug本人咱不可控

function addtocart() {
  // 修改失败的原因是因为 id='1' 默认是字符1需要转为数字 let numId = parseInt(id); 
  console.log("here in function to show the ref id");
  // console.log(typeof (curid.value));  number类型就更方便了
  console.log(curid.value);
  // ok抓取id实现
  // 修改 就不用具体的id实现了，用下标实现吧
  console.log(cartinfo);
  let found = false;
  for (let i = 0; i < cartinfo.value.length; i++) {
    if (cartinfo.value[i].key === curid.value) {
      found = true;
      break;
    }
  }
  if (!found) {
    cartcnt.value++;
    cartinfo.value.push({ key: curid.value, cnt: 1 });
  }
  console.log(cartinfo.value);
  // 加入和修改值成功：将打印信息展开看看就知道了：然后向购物车传入该响应式变量
}
provide("cartinfo", cartinfo);
// 向购物车传入购物信息



// 下面是关于秒杀部分的内容:写一个定时函数
const seckillnum = ref(Math.floor(Math.random() * 10));  // 秒杀商品的id号  // 使用随机初始化数据
const ifseckill = ref(true)  // 控制是否出现秒杀商品
let timerId;

onMounted(() => {
  timerId = setInterval(function toshowseckill() {
    ifseckill.value = !ifseckill.value;
    // 调试的时候常驻显示  //注意第198行！！！等下写完记得改回去
    // 每20s显示1次，然后关闭20s，每次显示的时候使用随机函数获取从0到9的自然数（也就是下标）
    seckillnum.value = Math.floor(Math.random() * 10);
    console.log(ifseckill.value);
    console.log(seckillnum.value);

  }, 5000);
});
provide("seckillnum", seckillnum);

onUnmounted(() => {
  clearInterval(timerId);
})

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
            购物车({{ cartcnt }})
            <!-- 显示总数量吧 -->
          </a>
        </li>
        <li class="nav-item">
          <a class="link" href="../../../html/user/address.html" @click="judgelogin">我的地址</a>
        </li>
      </ul>
    </div>
  </div>
  <!--nav-->
  <div id="boddy">
    <!--header-->
    <div class="header">
      <div class="w">
        <a class="logo" href="./index.html">SHOP</a>
        <search v-show="ifsearch" />
        <div class="search-con">
          <input class="search-input" id="search-input" placeholder="请输入商品名称" v-model="searchwhat"
            @keyup.enter="searchbutton" />
          <button class="btn search-btn" id="search-btn" @click="searchbutton">搜索</button>
        </div>

      </div>
    </div>
    <!--header-->
    <!--index-->
    <div class="w">
      <seckill v-show="ifseckill" />
      <!-- 实现了动态显示，处理该组件的信息就行了，主要是需要和购物车那边同步一下 -->
      <!-- 反正购物车的结算和订单的总结算都是用第一件商品结算的所以应该还算好写· -->
      <div class="banner-con">
        <!--<div class=" loading"></div>-->
        <ul>
          <a href="">
            <div class="box">
            </div>
          </a>
        </ul>
      </div>
    </div>
    <div class="w imganime">
      <div class="floor-wrap">
        <h1 class="floor-title">F1 家用电器</h1>
        <ul class="floor-list">
          <li class="floor-item" id="1">
            <a>
              <span class="floor-text">双开门冰箱</span>
              <img class="floor-img" src="../../../public/image/floor/1.jpg" alt="双开门冰箱" />
            </a>
            <button class="add-to-cart-button" id="tocart" @click="curid = 0; addtocart();">添加至购物车</button>
            <!-- md终于成功了：：原来是要用分号 -->
          </li>
          <li class="floor-item" id="2">
            <a>
              <span class="floor-text">电视</span>
              <img class="floor-img" src="../../../public/image/floor/2.jpg" alt="电视" />
            </a>
            <button class="add-to-cart-button" id="tocart" @click="curid = 1; addtocart();">添加至购物车</button>
          </li>
          <li class="floor-item" id="3">
            <a>
              <span class="floor-text">洗衣机</span>
              <img class="floor-img" src="../../../public/image/floor/3.jpg" alt="洗衣机" />
            </a>
            <button class="add-to-cart-button" id="tocart" @click="curid = 2; addtocart();">添加至购物车</button>
          </li>
          <li class="floor-item" id="4">
            <a>
              <span class="floor-text">空调</span>
              <img class="floor-img" src="../../../public/image/floor/4.jpg" alt="空调" />
            </a>
            <button class="add-to-cart-button" id="tocart" @click="curid = 3; addtocart();">添加至购物车</button>
          </li>
          <li class="floor-item" id="5">
            <a>
              <span class="floor-text">热水器</span>
              <img class="floor-img" src="../../../public/image/floor/5.jpg" alt="热水器" />
            </a>
            <button class="add-to-cart-button" id="tocart" @click="curid = 4; addtocart();">添加至购物车</button>
          </li>
        </ul>
      </div>
      <div class="floor-wrap">
        <h1 class="floor-title">F2 数码3C</h1>
        <ul class="floor-list">
          <li class="floor-item" id="6">
            <a>
              <span class="floor-text">笔记本电脑</span>
              <img class="floor-img" src="../../../public/image/floor/6.jpg" alt="笔记本电脑" />
            </a>
            <button class="add-to-cart-button" id="tocart" @click="curid = 5; addtocart();">添加至购物车</button>
          </li>
          <li class="floor-item" id="7">
            <a>
              <span class="floor-text">手机</span>
              <img class="floor-img" src="../../../public/image/floor/7.jpg" alt="手机" />
            </a>
            <button class="add-to-cart-button" id="tocart" @click="curid = 6; addtocart();">添加至购物车</button>
          </li>
          <li class="floor-item" id="8">
            <a>
              <span class="floor-text">平板电脑</span>
              <img class="floor-img" src="../../../public/image/floor/8.jpg" alt="平板电脑" />
            </a>
            <button class="add-to-cart-button" id="tocart" @click="curid = 7; addtocart();">添加至购物车</button>
          </li>
          <li class="floor-item" id="9">
            <a>
              <span class="floor-text">数码相机</span>
              <img class="floor-img" src="../../../public/image/floor/9.jpg" alt="数码相机" />
            </a>
            <button class="add-to-cart-button" id="tocart" @click="curid = 8; addtocart();">添加至购物车</button>
          </li>
          <li class="floor-item" id="10">
            <a>
              <span class="floor-text">3C配件</span>
              <img class="floor-img" src="../../../public/image/floor/10.jpg" alt="3C配件" />
            </a>
            <button class="add-to-cart-button" id="tocart" @click="curid = 9; addtocart();">添加至购物车</button>
          </li>
        </ul>
      </div>

      <div class="bigimg"></div><!--遮罩层-->

      <div class="anime1" id="animatedElement">
        <p>其他功能正在完善中，敬请期待...</p>
      </div>

    </div>
  </div>

  <!--index-->
  <!--footer-->
  <div class=" footer">
    <div class="w">
      <div class="links">
        <a class="link" href="https://www.taobao.com/" target="_blank">淘宝</a> |
        <a class="link" href="https://www.pinduoduo.com/" target="_blank">拼多多</a> |
        <a class="link" href="https://www.jd.com/" target="_blank">京东</a> |
        <a class="link" href="https://www.zhihu.com" target="_blank">知乎</a> |
        <a class="link" href="https://www.baidu.com" target="_blank">百度</a> |
      </div>
      <p class="copyright">
        Copyright © 2024 mobai All Right Reserved
      </p>
    </div>
  </div>
  <!--footer-->


  <!-- other function -->
  <div class="toup" id="toup">
    <span class="iconfont icon-zhutise" id="changecolor"></span>
    <span class="iconfont icon-zhiding" id="totop"></span>
  </div>
</template>

<style>
@import "../../CSS/index/index_multi.css";
@import "../../CSS/index/index_anime.css";
@import "../../CSS/index/img_enlarge.css";
@import "../../CSS/index/toup.css";
@import "../../CSS/index/box.css";

.add-to-cart-button:active {
  left: 25%;
  transform: scale(0.95);
}

/* 也不知道为什么会出现25%的偏移需要子级手动矫正 */
/* 创建点击动效成功 */
/* 那么就是说明在父级这里获取id是可行的 */
/* 能active想必是点击生效了：但是如何判断呢：为何就是不生效：裂开 */
</style>
<!--  创建index组件  -->
<!-- 测试环境先保留id的打印 -->