<script setup>
import { inject, onMounted, ref, watch } from 'vue';

// 这边通过API调取数据获得所有商品数据：然后通过下边获得对应的商品
console.log("-------------------- here begin to solve seckill.vue --------------------");
var json = JSON.parse(localStorage.getItem("json")); //依旧是将json数据块转为json格式
const token = json && json.data ? json.data.token : null;
console.log(token);
const seckillnum = ref();
// 前端只实现是否展示，具体编号由这边窗口打开实现算了
const allseckillproduct = ref([]);
const showseckillinfo = ref('');

// 打开界面的时候调用10次函数实现添加redis商品
onMounted(function () {
  console.log("here in onMouted");

  let imageUrl = '../../../public/image/floor/10.jpg';  // 使用相对路径
  let image = new Image();
  image.src = imageUrl;
  // 使用文件格式

  fetch(imageUrl)  // 使用相对路径
    .then(response => response.blob())
    .then(blob => {
      let file = new File([blob], '10.jpg', { type: 'image/jpg' });

      let formData = new FormData();
      formData.append('file', file);
      formData.append('Name', '秒杀3C配件');
      formData.append('CategoryID', '10');
      formData.append('Title', '秒杀3C配件');
      formData.append('Info', '秒杀3C配件');
      formData.append('Price', '500');
      formData.append('SecKillPrice', '250');
      formData.append('Num', '200000');

      // 下面是执行默认创建1个
      fetch("http://localhost:4000/api/v1/secKill/add", {
        method: 'POST',
        headers: {
          'Authorization': 'Bearer ' + token,
        },
        body: formData
      })
        .then(response => {
          if (!response.ok) {
            throw new Error('Network response was not ok');
          }
          return response.json();
        })
        .then(data => {
          console.log(data);
          console.log("创建秒杀商品成功");
        })
        .then(() => {
          // 下面是执行默认查询所有商品
          fetch("http://localhost:4000/api/v1/secKill", {
            method: 'GET',
            headers: {
              'Content-Type': 'application/json',
              'Authorization': 'Bearer ' + token,
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
              allseckillproduct.value = data.data.item[data.data.total - 1];
              // 使用最后一项的id的内容值
              // 这里data可以处理开始和结束的id信息
              // 就是默认使用查询到的最后一个id的值
              showseckillinfo.value = allseckillproduct.value;
              console.log(showseckillinfo.value);
              seckillnum.value = showseckillinfo.value.id;
              console.log(seckillnum.value);
              // 一直使用最后一项商品
            });
        })
    });
  // 真创建成功和使用成功了
})


// 必须实现先后顺序：所以下列弃置
// function fetchData() {
//   fetch("http://localhost:4000/api/v1/secKill", {
//     method: 'GET',
//     headers: {
//       'Content-Type': 'application/json',
//       'Authorization': 'Bearer ' + token,
//     },
//   })
//     .then(response => {
//       if (!response.ok) {
//         alert("获取秒杀商品失败，请检查你的登录状态/服务器/网络状态")
//         throw new Error('Network response was not ok');
//       }
//       return response.json();
//     })
//     .then(data => {
//       console.log(data);
//       allseckillproduct.value = data.data.item[data.data.total - 1];
//       // 使用最后一项的id的内容值
//       // 这里data可以处理开始和结束的id信息
//       showseckillinfo.value = allseckillproduct.value;
//       console.log(showseckillinfo.value);
//       seckillnum.value = showseckillinfo.value.id;
//       console.log(seckillnum.value);
//       // 一直使用最后一项商品
//     });
// }

// onMounted(fetchData);
// 钩子函数

// watch(seckillnum, fetchData);
// 监控钩子  发生变化就再调用一次钩子函数
// 这边向秒杀商品传入一个秒杀商品数组就好
// 这个watch主要是处理从主页传来的随机seckillnum，但是该法案已经弃置改为使用这边的last id值
let items = [];
const judge2 = ref(true);
function toseckill() {
  console.log("here in toseckill");

  fetch('http://localhost:4000/api/v1/address', {
    method: 'GET',
    headers: {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ' + token,
    },
  })
    .then(response => {
      if (!response.ok) {
        throw new Error('Network response was not ok');
      }
      return response.json();
    })
    .then(data => {
      console.log(data);
      items = data.data.item || [];
      if (items.length == 0) {
        alert("抢购失败：请前往'我的地址'界面编辑地址");
      }
      else {
        const addressid = ref(items[0].id);
        console.log(addressid.value);
        fetch("http://localhost:4000/api/v1/secKill/withRedis", {
          method: "POST",
          headers: {
            'Content-Type': 'application/json',
            'Authorization': 'Bearer ' + token,
          },
          body: JSON.stringify({
            SecKillProductID: seckillnum.value,
            BossID: showseckillinfo.value.bossID,
            AddressID: addressid.value,
            Num: 1,
            Money: 0
          })
        }).then(response => {
          if (!response.ok) {
            throw new Error('Network response was not ok');
          }
          console.log(response);
          return response.json();
        }).then(() => {
          console.log(data);
          judge2.value = false;
          alert("恭喜你，抢购成功！");
        })
      }
    })
}
</script>

<template>
  <div class="seckill" id="seckill" v-show="judge2">
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
      <p style="text-align: left;"><strong>价格:</strong> 0.01 </p>
    </div>
    <button class="ttbutton" @click="toseckill()">秒杀抢购</button>
  </div>
</template>

<style scoped>
.seckill {
  position: absolute;
  left: 50%;
  transform: translate(-50%);
  z-index: 100;
  width: 500px;
  height: 265px;
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

.t {
  position: absolute;
  left: 20%;
  top: 3%;
}

.ttbutton {
  right: 2%;
  top: 15%;
  position: absolute;
  width: 28px;
  height: 200px;
  background-color: white;
  border-radius: 15px;
}

.ttbutto:hover {
  background-color: pink;
  transform: scale(1.05);
}

.ttbutton:active {
  transform: scale(0.95);
}
</style>
