# shop(尚未写完)
`注：` 该项目由vue构建框架,鉴于这不是最主要考察前端以及相关技术不熟练或未掌握(比如路由实现局部刷新（懒加载）vue-router），就不把前端写复杂了，尽量展示API调用接口实现数据库的功能

## 登录界面:

登录页面形式如下：

![loginPage](https://img.nxtf.net/3jJ9Zq.png)

页面实现代码见components下login文件夹的login.vue文件，主要是用fetch调用后端API接口：这里不再赘述。

后端再通过数据库查询实现，通过返回信息（200，500等状态码实现登录判断）再通过前端反馈信息实现下列功能

### 登录功能:

#### 登录密码错误信息显示:

通过alert警告框实现

![laertinputpassword](https://img.nxtf.net/NwttNJ.png)

#### 输入密码警告框:

![alertpassworderror](https://img.nxtf.net/L5FTKi.png)

#### 正确登录:

正确登录会跳出加载动画

![image-20240527142102763](https://img.nxtf.net/URUjPx.png)

#### 允许跳过登录:

![image-20240527135731950](https://img.nxtf.net/r4a45C.png)

### 忘记密码界面:

> 暂不支持改密功能

![image-20240527135839059](https://img.nxtf.net/fJxCUI.png)

### 注册功能:

![adduser](https://img.nxtf.net/sPeX7B.png)

## 主页:

主页预览(上部）：

![https://img.nxtf.net/x7Te0I.png](https://img.nxtf.net/P5n9Hd.png)

主页预览（下部）：

![index2](https://img.nxtf.net/x7Te0I.png)

### 图片放大展示功能:

点击图片进行居中放大展示：

![enlargeimg](https://img.nxtf.net/q2TCi5.png)

### 鼠标指针放入某个商品区域块实现”添加到购物车“按钮自动浮现:

![addbuton](https://img.nxtf.net/3aTU6o.png)

### 图片自动放大并悬浮:

![anime1](https://img.nxtf.net/59cpzV.png)

### 动态文字与导航与免责声明:

![anime2](https://img.nxtf.net/mjMxHY.png)

### 一键置顶与暗黑模式按键:

![anime3](https://img.nxtf.net/MnnDrO.png)

### 暗黑模式:

![anime4](https://img.nxtf.net/aqQKhg.png)

### 搜索功能:

![search](https://img.nxtf.net/AN0aze.png)

### 添加至购物车:

现在对这三件商品添加至购物车

![](https://img.nxtf.net/3rOfoW.png)

同步数据更新

![t1](https://img.nxtf.net/WjKUjJ.png)

## 购物车:

对上面添加到购物车的商品的信息展示

![t2](https://img.nxtf.net/cdmTK0.png)

### 结算功能:

> 显示的地址是多个地址中的第一个：详情请见 “我的地址” 区块

![t3](https://img.nxtf.net/LzYuEp.png)


### 提示功能:


![tr]()

### 微信支付:

> 点击已付款默认扣除余额：（请勿随意付款，谨防诈骗）

![t23]()

### 支付宝付款:

![tfjj]()

### 已付款功能:

> 付款之后实现修改余额，提示反馈信息:反馈信息如下

![jfsdk]()



![image-20240528232315976](C:\Users\绝尘\AppData\Roaming\Typora\typora-user-images\image-20240528232315976.png)

