<script setup>
import { reactive, computed, ref, onMounted } from 'vue';

const selectedAddress = reactive({
  name: '用户ID : ',
  address: '收货地址 : '
});

const json = localStorage.getItem('json');
const token = JSON.parse(json)?.data?.token;
console.log(token);
let items = [];
const addressid = ref();

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
    console.log(data);
    items = data.data.item || [];
    if (items.length > 0) {
      console.log(items[0]);
      selectedAddress.name += items[0].userID;
      selectedAddress.address += items[0].address;
      addressid.value = items[0].id;  // 没啥问题剂的使用value
      // console.log(typeof (addressid.value));  // number
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



const allproduct = ref([]);
async function submitOrder() {
  // 提交订单逻辑:目的是希望实现直接通过余额进行修改（但是算了：即使带很多不必要的参数我也懒得说什么了：影响心情）
  // 通过这里单独调用api获取地址信息（地址id）
  // 同时看看总信息是否需要单独调用或者使用全局变量？
  // const allproduct = (window.localStorage.getItem("allproduct"));
  // 使用不了：重新调用吧

  fetch("http://localhost:4000/api/v1/product/search", {
    method: 'POST',
    headers: {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ' + token,
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
      console.log("here test all information for all product");
      allproduct.value = data.data.item;
      console.log(allproduct.value[0]);
      console.log(allproduct.value[0].bossID);
      console.log(allproduct.value.length);
      // 所有尚品数据获取成功：：保存到allproduct上（响应式变量记得使用.value）：：具体每项数据将单项数据展开查看就行
    });


  // 下面是获取地址信息：呃
  // 额，好像上面就获取过了信息（第一个）那么直接使用就好
  if (items.length == 0) {
    alert("无地址信息：请前往编辑地址");
  }
  else {
    // 下面执行循环添加订单的逻辑
    console.log(addressid.value);










    alert('订单已提交，点击确认前往付款页面');
  }












  // 先调试：不跳转
  // window.location.href = '../../html/pay/pay.html';
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