<script setup>
import { ref } from 'vue';

let address = ref('');

async function fetchAddress() {
  try {
    const response = await fetch('http://localhost:4000/api/v1/address/1', {
      method: 'PUT'
    });
    if (!response.ok) {
      throw new Error('Network response was not ok');
    }
    const data = await response.json();
    if (data.address) {
      address.value = data.address;
    } else {
      alert('没有地址信息');
    }
  } catch (error) {
    alert('获取地址信息失败');
    console.error('There has been a problem with your fetch operation:', error);
  }
}

async function deleteAddress() {
  try {
    const response = await fetch('http://localhost:4000/api/v1/address/1', {
      method: 'DELETE'
    });
    if (!response.ok) {
      throw new Error('Network response was not ok');
    }
    address.value = '';
    alert('地址删除成功');
  } catch (error) {
    alert('删除地址失败');
    console.error('There has been a problem with your fetch operation:', error);
  }
}
</script>


<template>
  <div class="main">
    <h2 style="margin-left: 42%; margin-top: 10%;">地址信息</h2>
    <div v-if="address" class="address">
      <p>{{ address }}</p>
      <!-- 地址显示模块 -->
    </div>
    <div class="address-container">
      <button @click="fetchAddress">显示地址</button>
      <button @click="deleteAddress">删除地址</button>

    </div>
  </div>
</template>

<style scoped>
.main {
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

.address-container {
  position: absolute;
  top:80%;
  left: 50%;
  transform: translate(-50%,-50%);
  padding: 20px;
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
  background-color: #4CAF50;
  color: white;
}

.address-container button:last-of-type {
  background-color: #f44336;
  color: white;
}
</style>
