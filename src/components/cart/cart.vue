<script setup>
import { reactive, computed } from 'vue';

const cart = reactive([
  { id: 1, name: '商品1', price: 100, quantity: 1, image: 'https://via.placeholder.com/100' },
  { id: 2, name: '商品2', price: 200, quantity: 1, image: 'https://via.placeholder.com/100' }
]);

const totalPrice = computed(() => {
  return cart.reduce((total, item) => total + item.price * item.quantity, 0);
});

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

function removeItem(item) {
  const index = cart.findIndex(i => i.id === item.id);
  if (index !== -1) {
    cart.splice(index, 1);
    animateItem(item, 'fadeOut');
  }
}

function checkout() {
  alert('结算功能尚未实现');
}

function animateItem(item, animationType = 'bounce') {
  const itemElement = document.querySelector(`.cart-item[data-id='${item.id}']`);
  if (itemElement) {
    itemElement.classList.add(animationType);
    setTimeout(() => {
      itemElement.classList.remove(animationType);
    }, 1000);
  }
}
</script>

<template>
  <div class="shopping-cart">
    <h1>购物车</h1>
    <ul>
      <li v-for="item in cart" :key="item.id" :data-id="item.id" class="cart-item">
        <img :src="item.image" alt="item.name" class="item-image" />
        <div class="item-details">
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
.shopping-cart {
  max-width: 600px;
  margin: 0 auto;
  padding: 20px;
  background: #fff;
  border-radius: 10px;
  box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}

.cart-item {
  display: flex;
  align-items: center;
  margin-bottom: 20px;
  padding: 10px;
  border-bottom: 1px solid #eee;
  transition: all 0.3s ease;
}

.item-image {
  width: 100px;
  height: 100px;
  object-fit: cover;
  margin-right: 20px;
}

.item-details {
  flex: 1;
}

.quantity button {
  width: 30px;
  height: 30px;
  border: none;
  background: #007bff;
  color: #fff;
  font-size: 16px;
  cursor: pointer;
  margin: 0 5px;
}

.quantity span {
  font-size: 16px;
  margin: 0 10px;
}

.remove-button {
  margin-top: 5px;
  margin-left: 5px;
  background: red;
  color: white;
  border: none;
  padding: 4px;
  cursor: pointer;
}

.total {
  font-size: 20px;
  text-align: right;
  margin-top: 20px;
}

.checkout-button {
  display: block;
  width: 100%;
  padding: 10px;
  background: green;
  color: white;
  border: none;
  cursor: pointer;
  font-size: 18px;
  margin-top: 20px;
}

/* Animations */
@keyframes bounce {

  0%,
  20%,
  50%,
  80%,
  100% {
    transform: translateY(0);
  }

  40% {
    transform: translateY(-30px);
  }

  60% {
    transform: translateY(-15px);
  }
}

@keyframes fadeOut {
  0% {
    opacity: 1;
  }

  100% {
    opacity: 0;
    transform: scale(0.95);
  }
}

.bounce {
  animation: bounce 1s;
}

.fadeOut {
  animation: fadeOut 1s forwards;
}
</style>
