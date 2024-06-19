<script setup>
import { reactive, computed, inject, onMounted } from 'vue';
import { ref } from 'vue';

const showidcnt = ref(0);
const cart = reactive([]);
// 创建属性数组响应式示例

// // 先接收从父级传递过来的cartinfo
// const cartinfo = inject("cartinfo");
// console.log(cartinfo);
// 上面方法失效：因为采取了跨页面的形式：所以准确来说不是父子级之间的关系：故采取全局变量
const cartinfo = JSON.parse(window.localStorage.getItem("tocartinfo"));
console.log(cartinfo);
console.log(cartinfo.length);
// console.log(cartinfo[0]);
// 单独打印第0项是可以打印出来的  
// 使用接口查询一次所有信息
var json = JSON.parse(localStorage.getItem("json"));
const token = json && json.data ? json.data.token : null;
console.log(token);
const allinfo = ref();
onMounted(async () => {
  console.log("here data init");
  const response = await fetch("http://localhost:4000/api/v1/product/search", {
    method: 'POST',
    headers: {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ' + token,
    },
    body: JSON.stringify({})
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
      allinfo.value = data.data.item;
      console.log(allinfo.value);
      console.log(allinfo.value.length);
      // 测试成功
    });

  //增加商品信息
  console.log(cartinfo);
  for (var i = 0; i < cartinfo.length; i++) {
    for (var j = 0; j < allinfo.value.length; j++) {
      if (cartinfo[i].key == j) {
        showidcnt.value++;
        cart.push({
          id: showidcnt.value,
          name: allinfo.value[j].name,
          price: allinfo.value[j].price,
          quantity: cartinfo[i].cnt,
          image: allinfo.value[j].imgPath
        })
      }
    }
  }

  //后面再添加一段段对秒杀商品的for循环

  // 使用js循环前端计算商品数量对应的价格

  if (cartinfo.length == 0) {
    alert("请添加商品");
  }
});
// ok获取所有信息成功

const totalprice = computed(() => {
  return cart.reduce((total, item) => total + item.price * item.quantity, 0);
});
// 创建计算属性

function increaseQuantity(item) {
  item.quantity++;
  // // console.log(item.name); // 用name检索一下：实现同时修改cartinfo的值
  // for (var j = 0; j < allinfo.value.length; j++) {
  //   if (allinfo.value[j].name == item.name) {
  //     // console.log("here test"); // 测试成功
  //     // console.log(j);
  //     for (var i = 0; i < cartinfo.length; i++) {
  //       if (cartinfo[i].key == j) {
  //         cartinfo[i].cnt++;
  //         break;
  //         // 这边信息修改成功：但是没有同步
  //       }
  //     }
  //   }  
  // }
  // 本想双边同时计数但是工作量太大了：所以主页传入的数量就是1就行：这边实现计数
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
  // console.log(item.name );  // 双边实现删除也很麻烦：那就返回和结算的时候自动清除购物车tocartinfo就行
  const index = cart.findIndex(i => i.id === item.id);
  if (index !== -1) {
    cart.splice(index, 1);
    animateItem(item, 'fadeOut');
  }
}
// 调用动画将组件移除


function checkout() {
  if (cartinfo.length == 0) {
    alert("请添加商品再进行结算");
    window.location.href = "../../html/index/index.html";
  }
  else {
    window.localStorage.setItem("totalprice", totalprice.value);
    window.location.href = "../../../html/order/order.html";
  }
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

function clearcart() {
  if (cartinfo.length == 0) {
    alert("请添加商品之后再清空购物车");
  }
  else {
    let isConfirmed = confirm("将清空购物车，请确认你的操作？");
    if (isConfirmed) {
      window.localStorage.removeItem("tocartinfo");
    }
  }
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
          总计: {{ totalprice }} 元
        </div>
        <button class="checkout-button" @click="checkout">结算</button>
        <button class="checkout-button" @click="clearcart"
          style="background-color: greenyellow;margin-top: 30px;">清空购物车</button>
        <!-- alt+shift上下键实现快速添加一行（同） -->
        <p>(注：此页面增减 商品数量只影响结算，若要移除商品请清空购物车)</p>
  </div>
</template>

<style scoped>
@import url(../../CSS/cart/cart.css);
</style>
