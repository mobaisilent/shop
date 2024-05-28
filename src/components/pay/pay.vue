<script setup>
import { ref } from 'vue';


const json = localStorage.getItem('json');
const token = JSON.parse(json)?.data?.token;
console.log(token);  // 一直使用的应用token的方式
const paymethod = window.localStorage.getItem("paymethod");
const method = ref('');
const url1 = "../../../public/image/paymethods/alipay.jpg";
const url2 = "../../../public/image/paymethods/wechat.png";
// 鉴于图床无法上传付款吗：故本地部署本地url
if (paymethod == 'alipay') {
  method.value = url1;
} else {
  method.value = url2;
}
// console.log("here method=" + method.value);
function tocart() {
  window.location.href = "../../html/order/order.html"
}

function payed() {
  const tt = ref();
  console.log("here solve the payed fetch");
  window.localStorage.removeItem("tocartinfo");
  fetch("http://localhost:4000/api/v1/order", {
    method: 'GET',
    headers: {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ' + token,
    },
  }).then(response => {
    if (!response.ok) {
      console.log(response);
    }
    return response.json();
  }).then(data => {
    console.log(data);
    console.log(data.data.item[0].id);
    console.log(data.data.total);
    console.log("here begin to sovle for");
    let promises = [];
    for (var i = 0; i < data.data.total; i++) {
      // 里面需要调用fetch // 下面这句显示总共有多少订单待结算
      console.log(data.data.item[i].id);
      fetch("http://localhost:4000/api/v1/pay", {
        method: "POST",
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer ' + token,
        },
        body: JSON.stringify({
          OrderID: data.data.item[i].id,
          OrderNum: 1,
          UserKey: "1234567887654321",
          BossKey: "1234567887654321",
        }),
      }).then(response => {
        console.log("here");
        if (!response.ok) {
          throw new Error('Network response was not ok');
        }
        return response.json();
      }).then(data => {
        tt.value = data.code;
        console.log(data);
        console.log(tt.value);
      })
    }
  })
}

</script>

<template>
  <div class="main">
    <button class="back" @click="tocart">
      < 返回</button>
        <img :src="method" alt="">
        <!-- 呃，在标签里面使用就不用两个大括号了 -->
        <p>请扫码🥰</p>
        <br>
        <br>
        <button class="payed" id="payed" @click="payed" style="">已付款</button>
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
  height: 481px;
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
  width: 300px;
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
  top: 84.3%;
}

.back:hover {
  transform: scale(1.05);
}

.back:active {
  transform: scale(0.95);
}

.payed {
  color: black;
  margin-top: 9px;
  width: 90%;
  height: 25px;
  background-color: white;
  border: 0;
  background-color: aqua;
  border-radius: 10px;
  cursor: pointer;
}

.payed:hover {
  transform: scale(1.05);
}

.payed:active {
  transform: scale(0.95);
}
</style>