<script setup>
import { ref } from 'vue';

const address = ref('');
const judge = ref(false);
const json = localStorage.getItem('json');
const token = JSON.parse(json)?.data?.token;
const len = ref('0');
const cnt = ref(0);
let items = []; // 初始化 items 为一个空数组 这里不是使用ref否则会报错
const dynamicurl = ref("http://localhost:4000/api/v1/address/");
const startid = ref('');
console.log(token);

// 获取token和打印token
// 这边是使用/检测登录信息

async function fetchAddress() {
  console.log("Here");
  judge.value = true;
  // console.log(judge.value); yes为true调试成功
  // 用于显示address和显示下一页
  try {
    const response = await fetch('http://localhost:4000/api/v1/address', {
      method: 'GET',
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ' + token,
      },
    });
    if (!response.ok) {
      throw new Error('Network response was not ok');
    }
    console.log(response);
    const data = await response.json();
    console.log(data);
    len.value = data.data.total;
    // 数据长度和len是保持一致的
    console.log(len.value);
    // console.log(data.data.total);
    if (data.data.total == 0) {
      alert('没有地址信息');
    } else {
      // 这里实现显示地址：通过响应式变量实现
      items = data.data.item || []; // 确保 items 是一个数组
      console.log(items);
      console.log("here check items[0].address");
      if (items.length > 0) {
        console.log(items[0].address);
        // 第一个地址显示成功
        address.value = items[cnt.value]?.address || '无地址';
        // 这里也记得使用value，不然就一直报错

        // 下面是获得id号和修改url
        console.log("here show start id");
        startid.value = items[0].id;
        console.log(startid.value);
        // 得到初始id 45
        dynamicurl.value += startid.value;
        console.log(dynamicurl.value);
      }
    }
  } catch (error) {
    alert('响应失败，请检查服务器/你的网络状态');
    console.error('There has been a problem with your fetch operation:', error);
  }
};

async function deleteAddress() {
  console.log(dynamicurl.value);
  // 记得使用value
  try {
    const response = await fetch(dynamicurl.value, {
      method: 'DELETE',
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ' + token,
      },
    });
    if (!response.ok) {
      throw new Error('Network response was not ok');
    }
    console.log(response);
    const data = await response.json();
    // 用了async异步请求这里也要异步请求  
    console.log(data);
    if (data.code == 200) {
      alert('地址删除成功');
      dynamicurl.value = "http://localhost:4000/api/v1/address/";
      startid.value++;
      dynamicurl.value += startid.value;
      console.log("here new url");
      console.log(dynamicurl.value);
    }
    else {
      alert('地址已全部删除/删除地址失败');
    }
  } catch (error) {
    alert('地址已全部删除/删除地址失败');
    console.error('There has been a problem with your fetch operation:', error);
  }
}

// 写一个响应式tag实现创建地址：就不是用新的页面/组件了
const creatbutton = ref(true);
function changeaddress2() {
  creatbutton.value = false;
}
// 响应式显示创建成功

const newaddress = ref(''); // 先创建一个空的响应式变量
// 向响应式变量中添加数据用于测试：多利用这些测试方法
function addresform(event) {
  // 处理表单事件的响应
  event.preventDefault();
  const formData = new FormData();
  formData.append('Address', newaddress.value);
  // 使用响应式变量的时候记得使用value,使用value之后就成功咯
  fetch("http://localhost:4000/api/v1/address", {
    method: 'POST',
    headers: {
      'Authorization': 'Bearer ' + token,
    },
    body: formData,
  })
    .then((response) => {
      if (!response.ok) {
        console.log(response);
        throw new Error('Network response was not ok');
      }
      return response.json();
    }).then(data => {
      console.log(data);
      // 打印响应数据用于调试查看
      alert("创建地址" + '\n' + "`"
        + newaddress.value + "`" + '\n'
        + "成功");
    });
  creatbutton.value = true;
  newaddress.value = "";
  // 重置newaddress
}

function nosubmit(event) {
  // 直接阻止表单提交，修改变量即可
  event.preventDefault();
  creatbutton.value = true;
}

function changeaddress() {
  console.log("Here show next address");
  // 该函数用于显示下一个地址
  if (cnt.value >= len.value - 1) {
    alert("已经是最后一个地址了");
  }
  else {
    cnt.value++;
    address.value = items[cnt.value]?.address || '无地址';
  }
}

function backfunc() {
  window.location.href = "../index/index.html";
}
</script>



<template>
  <div class="main">
    <button id="back" @click="backfunc">返回</button>
    <h2 style="margin-top: 10%;">地址信息</h2>
    <div class="address">
      <p style="font-size: 23px;">address</p>
      <p v-show="judge" id="addressposition">{{ address }}</p>
      <!-- <hr style="margin-top:100px; position: absolute;;"> -->
      <button id="nextpage" @click="changeaddress" v-show="judge">下一页</button>
      <!-- 地址显示模块 -->
    </div>
    <div class="address-container" v-show="creatbutton">
      <button @click="changeaddress2">创建地址</button>
      <button @click="fetchAddress">显示地址</button>
      <button @click="deleteAddress">删除地址</button>
    </div>
    <div class="create" v-show="!creatbutton">
      <form action="" @submit="addresform">
        新地址<input type="text" v-model="newaddress">
        <br> <button style="margin-top: 10px;">确认创建</button>
        <button style="margin-top: 10px;" @click="nosubmit">取消创建</button>
      </form>
    </div>
    <div id="info" v-show="creatbutton">
      <p>务必先显示地址再删除地址</p>
      <p>请谨慎删除地址，遇见显示问题请刷新页面</p>
    </div>
  </div>
</template>

<style scoped>
body {
  font-family: YouYuan;
  /* 我永远喜欢YouYuan字体 */
  padding: 0;
  margin: 0;
  box-sizing: border-box;
  font-family: YouYuan;
}

.main {
  text-align: center;
  margin-top: 20px;
  position: absolute;
  width: 600px;
  height: 600px;
  /* background-color: pink; */
  top: 45%;
  left: 50%;
  transform: translate(-50%, -50%);
  border: greenyellow 4px solid;
  border-radius: 40px;
}

.address {
  margin-top: 20px;
  margin-left: 100px;
  width: 400px;
  height: 180px;
  background-color: #ffffff;
  text-align: center;
}

.address-container {
  position: absolute;
  top: 70%;
  left: 50%;
  transform: translate(-50%, -50%);
  padding: 10px;
  border: 4px solid #ccc;
  border-radius: 8px;
  width: 300px;
  margin: 0 auto;
  text-align: center;
}

.address-container p {
  font-size: 16px;
  color: #333;
}

.address-container button {
  display: block;
  width: 100%;
  padding: 10px;
  margin: 10px 0;
  font-size: 16px;
  border: none;
  border-radius: 4px;
  cursor: pointer;
}

.address-container button:first-of-type {
  background-color: pink;
  color: black;
  border-radius: 24px;
}

/* 对于不是 首尾的使用 nth实现 */
.address-container button:nth-of-type(2) {
  background-color: #64ee66;
  color: black;
  border-radius: 24px;
}

.address-container button:last-of-type {
  background-color: #f44336;
  color: white;
  border-radius: 24px;
}


#info {
  position: absolute;
  display: block;
  top: 86%;
  left: 24.3%;
}

#addressposition {
  display: block;
  width: 100%;
  height: 40px;
}

.create {
  width: 220px;
  height: 100px;
  margin-top: 10%;
  margin-left: 32%;
  padding-top: 20px;
  background-color: #ffffff;
}

.create input {
  margin-top: 8px;
  border: 2px solid black;
  width: 90%;
  height: 20px;
}

#back {
  position: absolute;
  left: 4%;
  top: 2%;
  border: none;
  cursor: pointer;
  background-color: aquamarine;
  font-size: 18px;
  border-radius: 10px;
  padding: 5px;
  padding-right: 10px;
  padding-left: 10px;
  text-align: center;
}

#back:hover {
  background-color: #45a049;
  transform: scale(1.05);
}

#back:active {
  background-color: #3e8e41;
  transform: scale(0.95);
}
</style>

<!-- 收录下列报错信息：

chunk-U6BEPC57.js?v=7ab0c401:1729 Uncaught TypeError: Cannot read properties of undefined (reading 'address')

问题出在尝试读取 items 数组中的 address 属性时，因为 items 可能是 undefined 或者 items[cnt.value] 可能是 undefined。具体来说，有以下几点需要注意：

items 变量未初始化：在 fetchAddress 函数中，你声明了 items 但没有在全局范围内初始化它。只有在成功获取数据并赋值后 items 才会被初始化。

数据获取失败或为空：如果数据获取失败，或者获取的数据中 items 为空（例如 data.data.item 为空），那么在访问 items[cnt.value].address 时会出现错误。

索引超出范围：在 changeaddress 函数中，如果 cnt.value 超过 items 数组的长度，访问 items[cnt.value].address 也会导致错误。


改进点：
初始化 items：将 items 初始化为空数组，避免未定义错误。

安全访问：使用可选链操作符 (?.) 确保安全访问对象属性。

范围检查：在 changeaddress 函数中，添加检查以确保 cnt.value 不会超出 items 数组的长度。

JSON 解析安全：使用可选链操作符 (?.) 确保解析 localStorage 时不会出错。

-->