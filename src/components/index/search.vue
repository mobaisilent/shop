<script setup>
import { ref } from 'vue';
import { inject } from 'vue'

const ifsearch = inject('ifsearch');
const searchwhat = inject('searchwhat');
const allproduct = JSON.parse(window.localStorage.getItem("allproduct"));
// ok 这边成功接收到了所有商品的信息
// console.log(typeof (searchwhat));
// console.log(searchwhat);
// 信息调试
const showinfo = ref('');
const clickbutton = ref(false);
const closeWindow = () => {
  ifsearch.value = false;
  clickbutton.value = false;
};
// 实现关闭
// 通过父级向子级传递信息，不用子级向外级传递信息了：：稍微更加复杂了
// 父级是index.vue 需要传递的信息只有
// searchbutton和内容两个 ：传递搜索内容就可以实现显示需要的信息了

// 在这里调用一下api 然后对应筛选内容即可：显示想要显示的信息
// 键盘应该推进去的，不然都影响打字了
// 下面调用商品查询API接口：实现筛选想要的信息
// 准确来说应该是点击搜索的瞬间调用API实现向下传递JSON数据


function ifbutton() {
  // console.log(allproduct.data.total);
  // console.log(typeof (allproduct));
  // console.log(allproduct.data.item[1].name);
  // 还是这种原生格式使用起来比较方便：现在就是信息检索
  // 放在外面反而打印不出来：那么就关闭的时候打印一次就行
  if (searchwhat.value.length == 0) {
    alert("请输入搜索内容");
    ifsearch.value = false;
    clickbutton.value = false;
  }
  else {
    clickbutton.value = !clickbutton.value;
    var i;
    for (i = 0; i < allproduct.data.item.length; i++) {
      if (searchwhat.value == allproduct.data.item[i].name) {
        console.log("here");
        console.log("here i=" + i);
        break;
      }
    }
    showinfo.value = allproduct.data.item[i];
    console.log(showinfo.value);
  }
}
</script>

<template>
  <div v-if="ifsearch" class="search">
    <button @click="ifbutton" class="newbutton">点击展开/关闭</button>
    <div v-show="clickbutton">
      <div class="showinfo" v-if="showinfo">
        <h2>商品详情</h2>
        <p><strong>ID:</strong> {{ showinfo.id }}</p>
        <p><strong>名称:</strong> {{ showinfo.name }}</p>
        <p><strong>分类ID:</strong> {{ showinfo.categoryID }}</p>
        <p><strong>标题:</strong> {{ showinfo.title }}</p>
        <p><strong>描述:</strong> {{ showinfo.info }}</p>
        <p><strong>图片:</strong> <img :src="showinfo.imgPath" alt="Product Image" class="product-image" /></p>
        <p><strong>价格:</strong> {{ showinfo.price }}</p>
        <p><strong>折扣价:</strong> {{ showinfo.discountPrice }}</p>
        <p><strong>是否打折:</strong> {{ showinfo.onSale ? '是' : '否' }}</p>
        <p><strong>库存数量:</strong> {{ showinfo.num }}</p>
      </div>
      <button class="close" @click="closeWindow">X</button>
    </div>
  </div>
</template>

<style scoped>
@import url(../../CSS/search/search.css);
</style>
<!-- 创建为悬浮窗的格式就实现了覆盖下面的图片 -->