<script setup>
import { ref } from "vue";
// 为忘记密码和添加用户两个span添加点击信息
// windows.onload可以实现确保页面加载完毕之后执行后续代码段
window.onload = function () {
  const element1 = document.getElementById("addUser");
  if (element1) {
    element1.addEventListener('click', () => {
      window.location.href = "../../html/login/add.html";
    });
  } else {
    console.error("Element not found");
  };
  const element2 = document.getElementById("forgetPassword");
  if (element2) {
    element2.addEventListener('click', () => {
      window.location.href = "../../html/login/forget.html";
    });
  } else {
    console.error("Element not found");
  }
  // ok 两个都跳转成功
};
// 上面是 忘记密码和注册用户的跳转



// 下面是输入的逻辑判断和对应的信息提示 用@submit进行绑定
const usernameRef = ref('');
const passwordRef = ref('');  // 创建响应式变量
function handleSubmit(event) {
  event.preventDefault();
  if (!usernameRef.value) {
    alert("请输入用户名");
  } else if (!passwordRef.value) {
    alert("请输入密码");
  } else {
    fetch('http://localhost:4000/api/v1/user/login', {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json'
      },
      body: JSON.stringify({
        userName: usernameRef.value,
        password: passwordRef.value
      })
    })
      .then(response => {
        if (!response.ok) {
          throw new Error('Network response was not ok');
        }
        return response.json();
      })
      .then(data => {
        console.log(data);
        let statu = data.code;
        let msg = data.msg;
        if (statu == 500 && msg == "密码错误") {
          alert("密码错误，请检查你的输入信息");
        }
        else if (statu == 200 && msg == "登录成功") {
          alert("登录成功,点击确定跳转");

        }
        else if(statu==500&&msg=="用户名不存在"){
          alert("用户名不存在，请检查你的输入信息");
        }
      })
      .catch(error => {
        console.error('There has been a problem with your fetch operation:', error);
        alert("登录失败，服务器状态和你的网络");
        // 这边表示data未找到信息
      });
  }
}


// 和上面类似就是为 form添加一个事件，不过上面的跳转时为下面 忘记密码 和 注册用户 添加点击事件



// 下面还差利用 api  进行交互了
</script>

<template>
  <div class="main">
    <div class="title">
      <span>密码登录</span>
    </div>

    <div class="title-msg">
      <span>请输入登录账户和密码</span>
    </div>

    <form class="login-form" action="/html/index/index.html" method="post" novalidate @submit="handleSubmit">
      <!--输入框-->
      <div class="input-content">
        <!--autoFocus-->
        <div>
          <input type="text" v-model="usernameRef" autocomplete="off" placeholder="用户名" name="username" required />
        </div>
        <div style="margin-top: 16px">
          <input type="password" v-model="passwordRef" autocomplete="off" placeholder="登录密码" name="password" required
            maxlength="32" />
        </div>
      </div>

      <!--登入按钮-->
      <div style="text-align: center">
        <button type="submit" class="enter-btn">登录</button>
      </div>

      <div class="foor">
        <div class="left" id="forgetPassword"><span>忘记密码 ?</span></div>

        <div class="right" id="addUser"><span>注册账户</span></div>
      </div>
      <!-- 添加注册用户信息  -->
    </form>
  </div>
</template>

<!-- 创建表单输入框实现提交数据，创建登录页面 -->
<!-- 已index为跳板（原始路径）启动vue项目 其他模块通过跳转实现吧 -->

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
  height: 310px;
  background: #FFFFFF;
  /*以下css用于让登录表单垂直居中在界面,可删除*/
  position: absolute;
  top: 50%;
  left: 50%;
  transform: translate(-50%, -50%);
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
</style>