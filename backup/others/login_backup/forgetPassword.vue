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
</script>


<template>
  <div class="main">
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
body {
  background: #ffffff;
  background-image: url(../../assets/images/login_background.png);
  background-repeat: no-repeat;
  background-size: cover;
}

* {
  padding: 0;
  margin: 0;
}

.main {
  margin: 0 auto;
  padding-left: 25px;
  padding-right: 25px;
  padding-top: 15px;
  width: 350px;
  height: 340px;
  background: #FFFFFF;
  /*以下css用于让登录表单垂直居中在界面,可删除*/
  position: absolute;
  top: 50%;
  left: 50%;
  transform: translate(-50%, -50%);

  /* 直接用transform实现居中会更合理 */
  /* 添加 边框线 */
  border: 2px solid black;
  border-radius: 20px;
}

.title {
  width: 100%;
  height: 30px;
  line-height: 40px;
}

.title span {
  font-size: 18px;
  color: #353f42;
}

.title-msg {
  width: 100%;
  height: 64px;
  line-height: 64px;
}

.title:hover {
  cursor: default;
}

.title-msg:hover {
  cursor: default;
}

.title-msg span {
  font-size: 12px;
  color: #707472;
}

.input-content {
  width: 100%;
  height: 120px;
}

.input-content input {
  width: 330px;
  height: 40px;
  border: 1px solid #dad9d6;
  background: #ffffff;
  padding-left: 10px;
  padding-right: 10px;
}

.enter-btn {
  width: 350px;
  height: 40px;
  color: #fff;
  background: #5fd3e3;
  line-height: 40px;
  text-align: center;
  border: 0px;
}

.enter-btn:hover {
  cursor: pointer;
  background: #1db5c9;
}
</style>