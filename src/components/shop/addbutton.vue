<script setup>
import { inject, ref } from 'vue';

const floors = ref([

]);

function showButton(floorIndex, itemIndex) {
  floors.value[floorIndex].items[itemIndex].showButton = true;
}

function hideButton(floorIndex, itemIndex) {
  floors.value[floorIndex].items[itemIndex].showButton = false;
}
// 是否展示组件的逻辑

// const id = inject("id");
// function here() {
//   console.log("在子组件中传入的id为" + id.value);
// }
// 使用注入不生效：毕竟不是原生组件：只是通过逻辑实现的（在原生父组件上添加效果）

function ifclick() {
  console.log("you click the button");
}
// 尝试但是依旧不生效
</script>

<template>
  <div class="floor-wrap" v-for="(floor, floorIndex) in floors" :key="floorIndex">
    <ul class="floor-list">
      <li class="floor-item" v-for="(item, itemIndex) in floor.items" :key="itemIndex"
        @mouseover="showButton(floorIndex, itemIndex)" @mouseleave="hideButton(floorIndex, itemIndex)">
        <img class="floor-img" :src="item.imgSrc" :alt="item.text" />
        <button class="add-to-cart-button" v-show="item.showButton" id="add-to-cart-button"
          @click="ifclick">添加至购物车</button>
        <!--按钮依旧不生效 -->
        <!-- 尝试创建全局变量储存是否点击的信息试试看 -->
      </li>
    </ul>
  </div>
</template>

<style scoped>
@import "../../CSS/index/add_button.css";
</style>

<!-- 免责声明：本页面由gpt4o原生生成：难免有些bug本人目前难以控制 -->
<!-- 该组件无法实现那么就不是用该组件：直接通过index.vue里面的mouseenter就行按钮的加载 -->
