import { createApp } from "vue";
import addUser from "../../components/login/addUser.vue";
// 导入模块
createApp(addUser).mount("#addUser");
// 创建实例
// 牢记main.js的两个基本功能和创建：导入API，导入vue，实例创建和挂载