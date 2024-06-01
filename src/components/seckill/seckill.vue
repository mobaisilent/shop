<script setup>
import { inject, onMounted, ref, watch } from 'vue';

// 这边通过API调取数据获得所有商品数据：然后通过下边获得对应的商品
console.log("-------------------- here begin to solve seckill.vue --------------------");
var json = JSON.parse(localStorage.getItem("json")); //依旧是将json数据块转为json格式
const token = json && json.data ? json.data.token : null;
console.log(token);
const seckillnum = inject("seckillnum");  // 记得使用value
const allseckillproduct = ref([]);
const showseckillinfo = ref('');

function fetchData() {
  fetch("http://localhost:4000/api/v1/secKill", {
    method: 'GET',
    headers: {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ' + token,
      // 这里注意Bearer后面有一个空格：否则错误
      // ok 接收到响应数据：只是尚未处理罢了
    },
  })
    .then(response => {
      if (!response.ok) {
        alert("获取秒杀商品失败，请检查你的登录状态/服务器/网络状态")
        throw new Error('Network response was not ok');
      }
      return response.json();
    })
    .then(data => {
      console.log(data);
      allseckillproduct.value = data.data.item;
      console.log(allseckillproduct.value[seckillnum.value]);
      // 直接按照下标处理就好
      showseckillinfo.value = allseckillproduct.value[seckillnum.value];
      console.log(showseckillinfo.value);
    });
}

onMounted(fetchData);
// 钩子函数

watch(seckillnum, fetchData);
// 监控钩子  发生变化就再调用一次钩子函数
// 这边向秒杀商品传入一个秒杀商品数组就好
</script>

<template>
  <div class="seckill" id="seckill">
    <div class="left">
      <!-- 左边放图片 -->
      <strong class="t">图片:</strong>
      <p style="text-align: left;"><img :src="showseckillinfo.imgPath" alt="secimg" class="product-image" /></p>
    </div>
    <div class="right">
      <!-- 右边放入秒杀商品详情 -->
      <h2>商品详情</h2>
      <p style="text-align: left;"><strong>ID:</strong> {{ showseckillinfo.id }}</p>
      <p style="text-align: left;"><strong>名称:</strong> {{ showseckillinfo.name }}</p>
      <p style="text-align: left;"><strong>分类ID:</strong> {{ showseckillinfo.categoryID }}</p>
      <p style="text-align: left;"><strong>bossID:</strong> {{ showseckillinfo.bossID }}</p>
      <p style="text-align: left;"><strong>bossName:</strong> {{ showseckillinfo.bossName }}</p>
      <p style="text-align: left;"><strong>标题:</strong> {{ showseckillinfo.title }}</p>
      <p style="text-align: left;"><strong>描述:</strong> {{ showseckillinfo.info }}</p>
      <p style="text-align: left;"><strong>价格:</strong> {{ showseckillinfo.price / 2 }}</p>
    </div>
  </div>
</template>

<style scoped>
.seckill {
  position: absolute;
  left: 50%;
  transform: translate(-50%);
  z-index: 100;
  width: 500px;
  height: 288px;
  text-align: center;
  background-color: white;
  margin-right: 100px;
  display: flex;
  justify-content: center;
  overflow: hidden;
}

.left,
.right {
  width: 50%;
  height: 100%;
  text-align: center;
}

.left {
  /* background-color: white; */
  /* 分区块调试用 */
  text-align: center;
  padding-left: 20px;
  padding-top: 50px;
  ;
  overflow: hidden;
}

img {
  width: 200px;
  height: 200px;
  /* 限定尺寸使得图片实现自适应缩放 */
}

.right {
  /* background-color: skyblue; */
  /* 分区块调试用 */
}

.t {
  position: absolute;
  left: 20%;
  top: 3%;
}
</style>
