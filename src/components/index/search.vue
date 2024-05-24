<script setup>
import { ref } from 'vue';
import { inject } from 'vue'

const ifsearch = inject('ifsearch');
const searchwhat = inject('searchwhat');
// console.log(typeof (searchwhat));
// console.log(searchwhat);
// 信息调试
const closeWindow = () => {
  // console.log(searchwhat.value);
  // 放在外面反而打印不出来：那么就关闭的时候打印一次就行
  ifsearch.value = false;
};
// 实现关闭
// 通过父级向子级传递信息，不用子级向外级传递信息了：：稍微更加复杂了
// 父级是index.vue 需要传递的信息只有
// searchbutton和内容两个 ：传递搜索内容就可以实现显示需要的信息了

// 在这里调用一下api 然后对应筛选内容即可：显示想要显示的信息
// 键盘应该推进去的，不然都影响打字了
// 下面调用商品查询API接口：实现筛选想要的信息
// 准确来说应该是点击搜索的瞬间调用API实现向下传递JSON数据
</script>

<template>
  <div v-if="ifsearch" class="search">
    <div class="showinfo">
      {{ searchwhat }}
    </div>
    <button class="close" @click="closeWindow">关闭</button>
  </div>
</template>

<style scoped>
.search {
  position: fixed;
  top: 20%;
  left: 50%;
  transform: translateX(-50%);
  width: 500px;
  height: 200px;
  background-color: white;
  z-index: 1000;
  padding: 20px;
  box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
  border-radius: 8px;
}

button {
  position: absolute;
  top: 10px;
  right: 10px;
  background: none;
  border: none;
  font-size: 16px;
  cursor: pointer;
}

.close {
  border: 2px solid black;
  padding: 0 4px;
  border-radius: 8px;
}

.showinfo {
  margin-top: 15px;
  height: 100%;
  ;
  /* background-color: pink; */
  /* 用于查看定位信息 */
}
</style>
<!-- 创建为悬浮窗的格式就实现了覆盖下面的图片 -->