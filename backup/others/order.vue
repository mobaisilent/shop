<script setup>
import { reactive, computed, ref, onMounted } from 'vue';
import mysql from 'mysql';

const selectedAddress = reactive({
  name: '用户ID : ',
  address: '收货地址 : '
});

const json = localStorage.getItem('json');
const token = JSON.parse(json)?.data?.token;
const len = ref('0');
let items = [];


onMounted(async () => {
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
    const data = await response.json();
    items = data.data.item || [];
    if (items.length > 0) {
      console.log(items[0]);
      selectedAddress.name += items[0].userID;
      selectedAddress.address += items[0].address;
    }
    else {
      selectedAddress.name += "无信息";
      selectedAddress.address += "无地址";
    }
  } catch (error) {
    alert('地址响应失败，请检查服务器/你的网络状态');
    console.error('There has been a problem with your fetch operation:', error);
  };
});



const paymentMethods = reactive([
  { id: 'wechat', name: '微信支付' },
  { id: 'alipay', name: '支付宝' },
]);

const selectedPaymentMethod = ref('wechat');
const orderNote = ref('');
const shippingFee = ref(0);

const totalPrice = window.localStorage.getItem("totalprice");

const totalPayable = computed(() => {
  return totalPrice;
});

function editAddress() {
  // 跳转到编辑地址页面或弹出编辑地址表单
  // 先设置一个全局变量方便编辑地址页面的跳转
  window.localStorage.setItem("backwhere", true);
  window.location.href = "../user/address.html"
}


function submitOrder() {
  // 提交订单逻辑
  window.localStorage.setItem("paymethod", selectedPaymentMethod.value);
  alert('订单已提交，点击确认前往付款页面');
  // // 1 引入
  // const mysql = mysql('mysql');
  // // 2 创建链接配置
  // const conn = mysql.createConnection({
  //   host: '172.31.250.4',   // 主机名 （服务器地址）
  //   user: 'asus',    //用户名
  //   password: '123456',    // 密码
  //   database: 'mall_demo',  // 写上自己要连接的数据库名字
  // })
  // // 3 建立链接
  // conn.connect()
  // console.log(conn);
  // // 4 生成sql语句 增删改查操作
  // let sql = 'UPDATE user SET money = 5000 WHERE id = 3'
  // //5  执行sql语句
  // conn.query(sql, (err, result) => {
  //   if (err) {
  //     console.log(err);
  //     return
  //   }
  //   // 6 处理结果
  //   console.log(result)
  // })
  window.location.href = '../../html/pay/pay.html';
}

function backToCart() {
  window.location.href = "../../html/index/cart.html";
}

</script>

<template>
  <div class="order-container">
    <button class="back" @click="backToCart">
      < 返回 </button>
        <h1>订单结算</h1>
        <div class="order-main">
          <!-- 收货地址 -->
          <section class="shipping-address">
            <h2>收货地址</h2>
            <p>注：(默认使用第一个地址,若要修改请前往编辑地址 )</p>
            <div v-if="selectedAddress">
              <p>{{ selectedAddress.name }} {{ selectedAddress.phone }}</p>
              <p>{{ selectedAddress.address }}</p>
              <button @click="editAddress">编辑地址</button>
            </div>
            <div v-else>
              <p>请添加收货地址</p>
              <button @click="addAddress">添加地址</button>
            </div>
          </section>

          <!-- 支付方式 -->
          <section class="payment-method">
            <h2>支付方式</h2>
            <div v-for="method in paymentMethods" :key="method.id">
              <input type="radio" :id="method.id" v-model="selectedPaymentMethod" :value="method.id" />
              <label :for="method.id">{{ method.name }}</label>
            </div>
          </section>

          <!-- 订单备注 -->
          <section class="order-note">
            <h2>订单备注</h2>
            <textarea v-model="orderNote" placeholder="留下你的备注信息" class="putnote"></textarea>
          </section>

          <!-- 价格详情 -->
          <section class="price-details">
            <h2>价格详情</h2>
            <p>商品总价: ¥{{ totalPrice }}</p>
            <p>运费: ¥{{ shippingFee }}</p>
            <p>应付总额: ¥{{ totalPayable }}</p>
          </section>

          <!-- 提交订单按钮 -->
          <button class="submit-order" @click="submitOrder">提交订单</button>
        </div>
  </div>
</template>

<style scoped>
@import url(../../CSS/order/order.css);
/* 这里备注一下 导入css文件需要使用@符号 */
</style>
<!-- 使用导入的方式将代码简化实现更方便的询问ai了 -->