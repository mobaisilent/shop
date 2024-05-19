<script setup>
import { onMounted, ref, reactive, nextTick, toRefs, computed, provide } from 'vue';
// 导入复合组件
const checkmessage = ref("输入的密码不一致");
const passwords = reactive({ p1: '', p2: '' });
const check = document.getElementById("check");
const showCheckMessage = ref(false);
const checkPasswords = () => {
  if (passwords.p1 !== passwords.p2 && passwords.p2.length > 0) {
    showCheckMessage.value = true;
  } else {
    showCheckMessage.value = false;
  }
};

const checkname = ref("请输入用户名");
const showcname = ref(false);
const name = ref('');
const checkcname = () => {
  if (name.value.length === 0 && passwords.p1.length !== 0) {
    showcname.value = true;
  } else {
    showcname.value = false;
  }
};


</script>

<template>
  <div class="main">
    <div class="title">
      <span>用户注册</span>
    </div>

    <div class="title-msg">
      <span>请输入新建账户和密码</span>
    </div>
    <!-- 注册之后跳转到登录界面 所以这个index还算是合理 -->
    <form class="login-form" action="/html/index/index.html" method="post" novalidate>
      <div class="input-content">
        <div>
          <input type="text" autocomplete="off" placeholder="用户名" name="username" required v-model="name" />
        </div>
        <div id="cnamed" class="cnamed">
          <p id="cname" class="cname" v-if="showcname">{{ checkname }}</p>
        </div>
        <div style="margin-top: 16px">
          <input type="password" id="p1" autocomplete="off" placeholder="密码" name="password" required maxlength="32"
            v-model="passwords.p1" @input="checkcname" />
        </div>
        <div style="margin-top: 25px">
          <input type="password" id="p2" autocomplete="off" placeholder="确认密码" name="password" required maxlength="32"
            v-model="passwords.p2" @input="checkPasswords" />
        </div>
        <div id="check" class="check">
          <p id="checkmassage" class="checkmassage" v-if="showCheckMessage">{{ checkmessage }}</p>
        </div>
      </div>
      <div style="text-align: center; margin-top: 80px;">
        <button type="submit" class="enter-btn">创建用户</button>
      </div>
    </form>
  </div>
  <!-- 这里表单的格式就采用登录页面的格式就行 -->
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
  height: 350px;
  background: #FFFFFF;
  /*以下css用于让登录表单垂直居中在界面,可删除*/
  position: absolute;
  top: 50%;
  left: 50%;
  margin-top: -175px;
  margin-left: -175px;
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


.foor {
  width: 100%;
  height: auto;
  color: #9b9c98;
  font-size: 12px;
  margin-top: 20px;
}


.foor div:hover {
  cursor: pointer;
  color: #484847;
  font-weight: 600;
}

.left {
  float: left;
}

.right {
  float: right;
}

.checkmassage {
  color: red;
  font-size: 12px;
}

.cnamed {
  height: 10px;
}


.cname {
  color: red;
  font-size: 12px;
  position: relative;
}
</style>
<!-- ok 注册框架创建成功：就差调用API进行交互了 -->