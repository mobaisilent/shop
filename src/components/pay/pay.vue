<script setup>
import { ref } from 'vue';

const paymethod = window.localStorage.getItem("paymethod");
console.log(paymethod);
const method = ref('');
const url1 = "https://images.mobaisama.top/i/2024/05/25/230422.jpg";
const url2 = "https://images.mobaisama.top/i/2024/05/25/230554.jpg";
if (paymethod == 'alipay') {
  method.value = url1;
} else {
  method.value = url2;
}

function tocart() {
  window.location.href = "../../html/order/order.html"
}
</script>

<template>
  <div class="main">
    <button class="back" @click="tocart">
      < 返回</button>
        <img :src="method" alt="">
        <!-- 呃，在标签里面使用就不用两个大括号了 -->
        <p>请扫码🥰</p>
  </div>
</template>


<style>
body {
  padding: 0;
  margin: 0;
  /* box-sizing: border-box; */
}

.main {
  position: absolute;
  width: 400px;
  height: 450px;
  /* background-color: pink; */
  left: 50%;
  top: 50%;
  transform: translate(-50%, -50%);
  text-align: center;
  border: 1px solid black;
  padding: 8px;
}

.main .back {
  display: block;
  /* position: absolute */
  background-color: white;
  border: 1px solid black;
  border-radius: 8px;
  font-size: 12px;
  margin-left: 3px;
  margin-top: 2px;
  margin-bottom: 2px;

}

.main img {
  width: 400px;
  height: 400px;
  /* background-color: pink; */
  /* 测试使用 */
}

.main p {
  position: absolute;
  width: 100%;
  /* height: 100px; */
  display: block;
  /* background-color: aqua; */
  top: 90.5%;
}

.back:hover {
  transform: scale(1.05);
}

.back:active {
  transform: scale(0.95);
}
</style>