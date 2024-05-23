<script setup>
import { ref } from 'vue';
import { toRefs } from 'vue';
var json = JSON.parse(localStorage.getItem("json"));
const token = json.data.token;
console.log("here is new");
console.log(token);
// 获取全局变量

// 用来修改显示的是之前登录获取的nickname还是之后修改获得的username
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
  event.preventDefault();
  console.log(newNickName.value);
  console.log(typeof (newNickName));

  console.log(button1.value);
  // click交互式改变button1

  // 创建一个新的FormData实例
  var formData = new FormData();
  // 添加键值对
  if (newNickName.value.length == 0) {
    alert("必须输入新的昵称");
  }
  else {
    formData.append('NickName', newNickName.value);
    // 注意看apipost那里的请求相应的格式

    fetch('http://localhost:4000/api/v1/user', {
      method: 'PUT',
      headers: {
        'Accept': '*/*',
        'Cache-Control': 'no-cache',
        'Connection': 'keep-alive',
        'Authorization': 'Bearer ' + token,
      },
      body: formData, // 使用formData作为请求体
    })
      .then(response => {
        if (!response.ok) {
          console.log(response);
          throw new Error('Network response was not ok');
        }
        return response.json();
      })
      .then(data => {
        console.log(data);

      })
      .catch(error => {
        console.log(error);
        alert("修改失败，请检查你的服务器状态和你的网络");
      });
  }


}


// 用逻辑进行nickname的绑定就行：判断逻辑：是用之前页面传递的nickname还是修改之后的信息
</script>

<template>
  <hr>
  <div id="new" class="new">
    <h2>修改用户信息（重新登录显示新信息）</h2>
    <form action="" class="form" @submit="handleSubmit">
      <label>新用户名：</label><input v-model="newUserName" type=" text" name="newUserName" placeholder="新的用户名">
      <br>
      <br>
      <label>新的昵称：</label><input v-model="newNickName" type="text" name="newNickName" placeholder="新的昵称">
      <br>
      <br>
      <label>新的密码：</label><input v-model="newpassword" type="password" name="newpassword" placeholder="新的密码">
      <br>
      <br>
      <button id="button" class="button" @click="button1 = !button">提交信息</button>
    </form>
    <br>
    <label style="font-size: 18px;">上传头像</label>
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