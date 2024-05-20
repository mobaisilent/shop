<script setup>
import { ref } from 'vue';

console.log(localStorage.getItem("json"));
var json = JSON.parse(localStorage.getItem("json"));
const userName = json.data.userInfo.userName;
const nickName = json.data.userInfo.nickName;
const avatar = json.data.userInfo.avatar;
const money = json.data.userInfo.money;
const token = json.data.userInfo.token;

const show_money_button = ref(true);

function getmoney() {
  fetch('http://localhost:4000/api/v1/money/', {
    method: 'POST',
    headers: {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ' + token
    },
    body: JSON.stringify({
      Key: 1234567887654321,
    }),
    mode: 'no-cors'
    // 直接设置no cors 无同源跨域问题
  })
    .then(response => {
      console.log("Here");
      if (!response.ok) {
        throw new Error('Network response was not ok');
      }
      return response.json();
    })
    .then(data => {
      console.log(data);
      money = data.data;
    });
}


</script>

<template>
  <div class="main">
    <div class="origin_info">
      <h2>基本信息</h2>
      <div id="avatar" class="avatar"><img :src="avatar" alt="头像信息">
        <!-- 使用vue绑定的方式来显示avatar -->
      </div>
      <p>用户名</p>
      <p>{{ userName }}</p>
      <p>昵称</p>
      <p>{{ nickName }}</p>
      <p>余额</p>
      <button @click="show_money_button = !show_money_button, getmoney()" v-show="show_money_button">点击显示</button>
      <p v-show="!show_money_button">{{ money }}</p>
    </div>
    <div class="new" id="new">
      
    </div>
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
  top: 50%;
  left: 50%;
  transform: translate(-50%, -50%);
  width: 500px;
  height: 600px;
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
  width: 50px;
  height: 50px;
  background-color: pink;
  left: 45%;

}

.new {
  width: 500px;
  height: 300px;
  background-color: pink;
}
</style>