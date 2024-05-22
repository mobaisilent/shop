<script setup>
import { ref } from 'vue';

const floors = ref([
  // 你的数据
]);

function showButton(floorIndex, itemIndex) {
  floors.value[floorIndex].items[itemIndex].showButton = true;
}

function hideButton(floorIndex, itemIndex) {
  floors.value[floorIndex].items[itemIndex].showButton = false;
}
</script>

<template>
  <div class="floor-wrap" v-for="(floor, floorIndex) in floors" :key="floorIndex">
    <h1 class="floor-title">{{ floor.title }}</h1>
    <ul class="floor-list">
      <li class="floor-item" v-for="(item, itemIndex) in floor.items" :key="itemIndex"
        @mouseover="showButton(floorIndex, itemIndex)" @mouseleave="hideButton(floorIndex, itemIndex)">
        <a :href="item.href">
          <span class="floor-text">{{ item.text }}</span>
          <img class="floor-img" :src="item.imgSrc" :alt="item.text" />
          <button class="add-to-cart-button" v-show="item.showButton">添加至购物车</button>
        </a>
      </li>
    </ul>
  </div>
</template>

<style scoped>
.add-to-cart-button {
  display: none;
  margin-top: 10px;
  padding: 5px 10px;
  background-color: #ff4500;
  color: white;
  border: none;
  cursor: pointer;
}

.floor-item:hover .add-to-cart-button {
  display: block;
  
}
</style>
