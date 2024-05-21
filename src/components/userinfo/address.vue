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
  try {
    const response = await fetch('http://localhost:4000/api/v1/address/1', {
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
    if (data.address) {
      address.value = data.address;
    } else {
      alert('没有地址信息');
    }
  } catch (error) {
    alert('获取地址信息失败');
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

function changeaddress() {
  console.log("here");

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
    <div class="address-container">
      <button @click="fetchAddress,  judge = true">显示地址</button>
      <button @click="deleteAddress">删除地址</button>
    </div>
    <div id="info">请谨慎展示/删除地址 </div>
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
</style>
