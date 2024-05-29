<script setup>

</script>

<template>
  <!-- <div class="seckill" id="seckill">
    <div class="left">left</div>
    <!-- 左边放秒杀商品图片 -->
  <!-- <div class="right">right</div> -->
  <!-- 右边放入秒杀商品详情 -->
  <!-- </div> -->
</template>

<style scoped>
.seckill {
  position: absolute;
  left: 50%;
  transform: translate(-50%);
  z-index: 100;
  width: 500px;
  height: 300px;
  text-align: center;
  background-color: pink;
  margin-right: 100px;
  display: flex;
  justify-content: center;
}

.left {
  width: 100%;
  height: 100%;
  text-align: center;
  background-color: white;
  /* 分区块调试用 */
}

.right {
  width: 100%;
  height: 100%;
  text-align: center;
  background-color: skyblue;
  /* 分区块调试用 */
}
</style>