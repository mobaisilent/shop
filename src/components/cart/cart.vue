<script setup>
import { reactive, computed } from 'vue';

const cart = reactive([
  { id: 1, name: '商品1', price: 100, quantity: 1, image: 'https://via.placeholder.com/100' },
  { id: 2, name: '商品2', price: 200, quantity: 1, image: 'https://via.placeholder.com/100' }
]);
// 创建属性数组响应式示例

const totalPrice = computed(() => {
  return cart.reduce((total, item) => total + item.price * item.quantity, 0);
});
// 创建计算属性

function increaseQuantity(item) {
  item.quantity++;
  animateItem(item);
}

function decreaseQuantity(item) {
  if (item.quantity > 1) {
    item.quantity--;
    animateItem(item);
  }
}
// 调用动画

function removeItem(item) {
  const index = cart.findIndex(i => i.id === item.id);
  if (index !== -1) {
    cart.splice(index, 1);
    animateItem(item, 'fadeOut');
  }
}
// 调用动画将组件移除


function checkout() {
  // 创建全局浏览器变量
  // window.localStorage.setItem("total_price", totalPrice.value);

  // var info = window.localStorage.getItem("total_price");
  // console.log(info);
  // 成功实现向结算页面传递总价格（动态）
  window.location.href = "../../../html/order/order.html";
}
// 转移到其他组件处理

function animateItem(item, animationType = 'bounce') {
  const itemElement = document.querySelector(`.cart-item[data-id='${item.id}']`);
  if (itemElement) {
    itemElement.classList.add(animationType);
    setTimeout(() => {
      itemElement.classList.remove(animationType);
    }, 1000);
  }
}

function backToIndex() {
  window.location.href = "../../html/index/index.html";
}
</script>

<template>
  <div class="shopping-cart">
    <button class="back" id="back" @click="backToIndex">
      < 返回 </button>
        <h1>购物车</h1>
        <ul>
          <li v-for="item in cart" :key="item.id" :data-id="item.id" class="cart-item">
            <img :src="item.image" alt="item.name" class="item-image" />
            <div class="item-details" style="margin-left: 2px">
              <h2>{{ item.name }}</h2>
              <p>{{ item.price }} 元</p>
              <div class="quantity">
                <button @click="decreaseQuantity(item)" :disabled="item.quantity <= 1">-</button>
                <span>{{ item.quantity }}</span>
                <button @click="increaseQuantity(item)">+</button>
              </div>
              <button class="remove-button" @click="removeItem(item)">删除</button>
            </div>
          </li>
        </ul>
        <div class="total">
          总计: {{ totalPrice }} 元
        </div>
        <button class="checkout-button" @click="checkout">结算</button>
  </div>
</template>

<style scoped>
@import url(../../CSS/cart/cart.css);
</style>
