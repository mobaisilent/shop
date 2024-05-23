<script setup>
import { ref } from 'vue';

let address = ref('');
const judge = ref(false);

const address1 = ref('example_address1');
const address2 = ref('example_address2');
address = address1;
const json = localStorage.getItem('json');
const token = JSON.parse(json).data.token;
console.log(token);
// 获取token和打印token

async function fetchAddress() {
  console.log("Here");
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
    console.log(data.data.total);
    if (data.data.total == 0) {
      alert('没有地址信息');
    } else {
      // 这里实现显示地址：：通过响应式变量实现

    }
  } catch (error) {
    alert('响应失败，请检查服务器/你的网络状态');
    console.error('There has been a problem with your fetch operation:', error);
  }
};


async function deleteAddress() {
  try {
    const response = await fetch('http://localhost:4000/api/v1/address/1', {
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
    address.value = '';
    alert('地址删除成功');
  } catch (error) {
    alert('删除地址失败');
    console.error('There has been a problem with your fetch operation:', error);
  }
}

// 写一个响应式tag实现创建地址：就不是用新的页面/组件了
const creatbutton = ref(true);
function changeaddress() {
  creatbutton.value = false;
}
// 响应式显示创建成功

const newaddress = ref('');// 先创建一个空的响应式变量
// 向响应式变量中添加数据用于测试：多利用这些测试方法
function addresform() {
  // 处理表单事件的响应
  event.preventDefault();
  fetch("http://localhost:4000/api/v1/address", {
    method: 'POST',
    headers: {
      'Authorization': 'Bearer ' + token,
    },
    body: JSON.stringify({
      Address: newaddress,
    }),
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
}
</script>


<template>
  <div class="main">
    <h2 style="margin-top: 10%;">地址信息</h2>
    <div class="address">
      <p style="font-size: 23px;">address</p>
      <p v-show="judge" id="addressposition">{{ address }}</p>
      <!-- <hr style="margin-top:100px; position: absolute;;"> -->
      <button id="nextpage" @click="changeaddress" v-show="judge">下一页</button>
      <!-- 地址显示模块 -->
    </div>
    <div class="address-container" v-show="creatbutton">
      <button @click="changeaddress">创建地址</button>
      <button @click="fetchAddress">显示地址</button>
      <button @click="deleteAddress">删除地址</button>
    </div>
    <div class="create" v-show="!creatbutton">
      <form action="" @submit="addresform">
        新地址<input type="text" v-model="newaddress">
        <br> <button style="margin-top: 10px;">确认创建</button>
      </form>
    </div>
    <div id="info">请谨慎删除地址 </div>
  </div>
</template>

<style scoped>
body {
  padding: 0;
  margin: 0;
  box-sizing: border-box;
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
  left: 40%;
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
</style>
