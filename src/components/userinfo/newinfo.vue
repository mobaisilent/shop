<script setup>
import { ref } from 'vue';
var json = JSON.parse(localStorage.getItem("json"));
const token = json.data.token;
console.log(token);
// 获取全局变量

const button1 = ref(false);
const button2 = ref(false);
// 检测逻辑
const newUserName = ref('');
const newNickName = ref('');
const newpassword = ref('');
const newavatar = ref('');
// 创建响应式变量用于绑定:绑定成功：显示成功
// 用来同步绑定显示内容

// 下面是创建表单提交函数：：先是默认阻止提交
function handleSubmit(event) {
  alert("用户名和密码暂不可修改：谢谢配合！\n如果有问题欢迎致电：12345678900");

  fetch('http://localhost:4000/api/v1/money/', {
    method: 'POST',
    headers: {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
      'Authorization': 'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MywidXNlck5hbWUiOiJjIiwiaXNzIjoibWFsbCIsInN1YiI6InVzZXIgdG9rZW4iLCJleHAiOjE3MTYzNjczOTgsImlhdCI6MTcxNjI4MDk5OH0.Sdv_h_M--X2sCcyMix1Kw5LznmyBuOsni77dM5AVf4c',
      'Cache-Control': 'no-cache'
    },
    body: JSON.stringify({
      NickName: newNickName.value,
      Key: 1234567887654321,
    }),
  })
    .then(response => {
      if (!response.ok) {
        console.log("here error");
        console.log(response);
        throw new Error('Network response was not ok');
      }
      return response.json();
    })
    .then(data => {
      console.log("here");
      console.log(data);
    })
    .catch(error => {
      console.log(error);
      alert(error);
      alert("修改失败，请检查你的服务器状态和你的网络");
    });
}


// 用逻辑进行nickname的绑定就行：判断逻辑：是用之前页面传递的nickname还是修改之后的信息
</script>

<template>
  <hr>
  <div id="new" class="new">
    <h2>修改用户信息（重新登录显示新信息）</h2>
    <form action="" class="form" @submit="handleSubmit">
      <label for="">新用户名：</label><input v-model="newUserName" type=" text" name="newUserName" placeholder="新的用户名">
      <br>
      <br>
      <label for="">新的昵称：</label><input v-model="newNickName" type="text" name="newNickName" placeholder="新的昵称">
      <br>
      <br>
      <label for="">新的密码：</label><input v-model="newpassword" type="password" name="newpassword" placeholder="新的密码">
      <br>
      <br>
      <button id="button" class="button">提交信息</button>
    </form>
    <br>
    <label for="" style="font-size: 18px;">上传头像</label>
    <br><input v-model="newavatar" type="text" name="newavatar" placeholder="填入图床地址"><a
      href="https://images.mobaisama.top" target="_blank">mobai's images</a>
    <button>上传 </button>


  </div>

</template>


<style>
body {
  font-family: 'YouYuan', sans-serif;

}

.new {
  margin-top: 20px;
  width: 500px;
  height: 300px;
  /* background-color: pink; */
}

#button {
  width: 150px;
  height: 33px;
  border: 2px skyblue solid;
  background-color: #ffffff;
  border-radius: 10px;
  font-size: 18px;
}
</style>
<!-- 这个vue就是一个组件：用组件实现下面修改用户信息的部分，防止代码凌乱 -->