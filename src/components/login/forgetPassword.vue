<script setup>
import { ref } from 'vue';
import { useRouter } from 'vue-router';

const formRef = ref(null);

function showPermissionAlert(event) {
  event.preventDefault();
  alert("权限不够");
}

function handleKeyPress(event) {
  if (event.key === 'Enter') {
    showPermissionAlert(event);
  }
}

function attachKeyPressHandler() {
  const form = formRef.value;
  if (form) {
    form.addEventListener('keypress', handleKeyPress);
  }
}

attachKeyPressHandler();

window.onload = function () {
  alert("权限不够");
}
// 这里默认添加一个 window加载/渲染完毕之后执行 alert指令


function back() {
  console.log("here");
  window.location.href = "../../index.html";
}
</script>


<template>
  <div class="main">
    <button class="back" id="back" @click="back">
      < 返回</button>
        <div class="title">
          <span>忘记密码</span>
        </div>

        <div class="title-msg">
          <span>请输入登录账户和token</span>
        </div>

        <form ref="formRef" class="login-form" method="post" novalidate @submit="showPermissionAlert">
          <div class="input-content">
            <div>
              <input type="text" autocomplete="off" placeholder="用户名" name="username" required />
            </div>
            <div style="margin-top: 16px">
              <input type="password" autocomplete="off" placeholder="token" name="password" required maxlength="32" />
            </div>
            <div style="margin-top: 16px">
              <input type="password" autocomplete="off" placeholder="新密码" name="password" required maxlength="32" />
            </div>
          </div>

          <div style="text-align: center; margin-top: 53px;">
            <button type="submit" class="enter-btn">提交</button>
          </div>
        </form>
  </div>
</template>



<style>
@import "../../CSS/login.css";

body {
  background-image: url(../../assets/images/login_background.png);
}

.main {
  height: 355px;
}

.back {
  font-size: 11px;
  padding: 4px;
  background-color: white;
  border-radius: 8px;
  border: 0.5px solid black
}

.back:hover {
  background-color: #45a049;
  transform: scale(1.05);
}

.back:active {
  background-color: #3e8e41;
  transform: scale(0.95);
}
</style>