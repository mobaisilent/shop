<script setup>
import { onMounted, ref } from 'vue';
import newinfo from "./newinfo.vue";
console.log(localStorage.getItem("json"));
var json = JSON.parse(localStorage.getItem("json"));
const userName = ref(json.data.userInfo.userName);
const nickName = ref(json.data.userInfo.nickName);
const avatar = ref(json.data.userInfo.avatar);
const money = json.data.userInfo.money;
const token = json.data.token;
console.log("here is token");
console.log(token);
var num;
// 打印token信息用于调试
const show_money_button = ref("true");

onMounted(async => {
  fetch('http://localhost:4000/api/v1/user/login', {
    method: 'POST',
    headers: {
      'Content-Type': 'application/json'
    },
    body: JSON.stringify({
      userName: userName.value,
      password: publicpassword
      // password就登录页面那边创建的全局变量吧
    })
  })
    .then(response => {
      if (!response.ok) {
        throw new Error('Network response was not ok');
      }
      return response.json();
    })
    .then(data => {
      console.log(data);
      userName.value = data.data.userInfo.userName;
      nickName.value = data.data.userInfo.nickName;
      avatar.value = data.data.userInfo.avatar;
      console.log("here avatar.value  " + avatar.value);
    })
});
// 这里和刷新按钮的实现是一致的：：初始值由全局变量实现稍微有点点显示上的小问题：但是问题不大


function getmoney() {
  console.log("Here prepare to fetch");
  fetch('http://localhost:4000/api/v1/money', {
    method: 'POST',
    headers: {
      'User-Agent': 'PostmanRuntime-ApipostRuntime/1.1.0',
      'Cache-Control': 'no-cache',
      'Accept': '*/*',
      'Accept-Encoding': 'gzip, deflate, br',
      'Connection': 'keep-alive',
      'Authorization': 'Bearer ' + token,
      'Content-Type': 'multipart/form-data; boundary=--------------------------325823930463777833009108',
    },
    body: JSON.stringify({
      Key: '1234567887654321',
    }),
    // mode: 'no-cors'
    // 直接设置no cors 无同源跨域问题
    // 这样修改可以正常运行但是看不见任何信息
  })
    .then(response => {
      console.log("Here");
      if (!response.ok) {
        console.log(response);
        throw new Error('Network response was not ok');
      }
      return response.json();
    })
    .then(data => {
      console.log(data.data);
      console.log(money);
      num = data.data;
      console.log(num);
      document.getElementById("shownum").innerText = num;
    });
}
// const nickName_from_son = ref('');
// const handleNickNameUpdate = (newName) => {
//   nickName_from_son.value = newName;
// };

// 添加返回按钮
function backtoindex() {
  window.location.href = '../index/index.html';
}

const publicpassword = window.localStorage.getItem("password");
console.log(publicpassword);

function tonew() {
  // 这里就是重新调用登录接口返回基本信息
  fetch('http://localhost:4000/api/v1/user/login', {
    method: 'POST',
    headers: {
      'Content-Type': 'application/json'
    },
    body: JSON.stringify({
      userName: userName.value,
      password: publicpassword
      // password就登录页面那边创建的全局变量吧
    })
  })
    .then(response => {
      if (!response.ok) {
        throw new Error('Network response was not ok');
      }
      return response.json();
    })
    .then(data => {
      console.log(data);
      userName.value = data.data.userInfo.userName;
      nickName.value = data.data.userInfo.nickName;
      avatar.value = data.data.userInfo.avatar;
      console.log("here avatar.value  " + avatar.value);
      show_money_button.value = true;
    })
}
</script>

<template>
  <div class="main">
    <button id="back" @click="backtoindex">
      < 返回</button>

        <button id="tonew" @click="tonew">
          刷新</button>
        <div class="origin_info">
          <h2>基本信息</h2>
          <div id="avatar" class="avatar">
            <img :src="avatar" alt="头像信息" id="showavatar">
            <!-- 使用vue绑定的方式来显示avatar -->
          </div>
          <p style="font-weight: bold;">用户名</p>
          <p style="font-weight: bold;">{{ userName }}</p>
          <p style="font-weight: bold;">昵称</p>
          <p style="font-weight: bold;">{{ nickName }}</p>
          <!-- <p v-else="nickName_from_son.length != 0">{{ nickName_from_son }}</p> -->
          <p style="font-weight: bold;">余额</p>
          <button @click="show_money_button = !show_money_button, getmoney()" v-show="show_money_button">点击显示</button>
          <p style="font-weight: bold;" v-show="!show_money_button" id="shownum"></p>
          <p style="top: 49%; left: 41.5%; position: absolute; font-size: 12px;">刷新显示新信息 </p>
        </div>
        <newinfo />
        <!-- 使用外置组件完成信息修改  -->
  </div>

</template>

<style>
body {
  margin: 0;
  padding: 0;
  box-sizing: border-box;
  background-image: url(../../../src/assets/images/login_background.png);
  background-repeat: no-repeat;
  background-size: cover;
}

.main {
  position: absolute;
  top: 47%;
  left: 50%;
  transform: translate(-50%, -50%);
  width: 500px;
  height: 610px;
  /* background-color: pink; */
  /* display: flex; */
  text-align: center;
  border: 4px solid pink;
  border-radius: 30px;
  line-height: 16px;
  background-color: #ffffff;
}

.origin_info {
  width: 100%;
  height: 50%;
  /* background-color: aqua */
}

.avatar {
  position: relative;
  /* 父相子绝:否则出错 */
  display: block;
  width: 50px;
  height: 50px;
  /* background-color: pink; */
  left: 45%;
  /* overflow: hidden; */
  margin-bottom: 10px;
}

img {
  width: 100%;
  height: 100%;
  object-fit: cover;
  /* 可选：确保图片按比例填充容器 */
}

#back {
  position: absolute;
  left: 3%;
  top: 2%;
  z-index: 1000;
  border: 1px solid black;
  cursor: pointer;
  border: none;
  font-size: 16px;
  padding: 8px 15px;
  border-radius: 15px;
}

#back:hover {
  background-color: #45a049;
  transform: scale(1.05);
}

#back:active {
  background-color: #3e8e41;
  transform: scale(0.95);
}

#tonew {
  position: absolute;
  left: 85%;
  top: 2%;
  z-index: 1000;
  border: 1px solid black;
  cursor: pointer;
  border: none;
  font-size: 16px;
  padding: 8px 15px;
  border-radius: 15px;
}

#tonew:hover {
  background-color: #45a049;
  transform: scale(1.05);
}

#tonew:active {
  background-color: #3e8e41;
  transform: scale(0.95);
}
</style>