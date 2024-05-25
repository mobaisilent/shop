<script setup>
import { reactive, computed, ref } from 'vue';

const selectedAddress = reactive({
  name: '张三',
  phone: '13800000000',
  address: '北京市朝阳区某街道某小区'
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

function addAddress() {
  // 跳转到添加地址页面或弹出添加地址表单
  alert('添加地址功能尚未实现');
}

function editAddress() {
  // 跳转到编辑地址页面或弹出编辑地址表单
  alert('编辑地址功能尚未实现');
}

function submitOrder() {
  // 提交订单逻辑
  alert('订单已提交');
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