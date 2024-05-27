# shop
`注：` 该项目由vue构建框架,鉴于这不是最主要考察前端以及相关技术不熟练或未掌握，就不把前端写复杂了，尽量展示API调用接口使用数据库的功能

## 登录界面

登录页面形式如下：

![loginPage](https://img.nxtf.net/XifRB9.png)

页面实现代码见components下login文件夹的login.vue文件，主要是用fetch调用后端API接口：这里不再赘述。

### 登录功能

#### 登录密码错误信息显示

通过alert警告框实现

![inputpassword](https://img.nxtf.net/2OPiyZ.png)

#### 输入密码警告框

![passworderror](https://img.nxtf.net/neD3wc.png)

#### 正确登录

正确登录会跳出加载动画

![image-20240527135612084](C:\Users\27892\Desktop\shop\README.assets\image-20240527135635591.png)

#### 允许跳过登录

![image-20240527135731950](C:\Users\27892\Desktop\shop\README.assets\image-20240527135731950.png)

### 忘记密码界面

> 暂不实现改密功能

![image-20240527135839059](https://img.nxtf.net/DFP6tW.png)
