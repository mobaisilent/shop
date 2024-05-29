# shop(doing)
`注：` 该项目由vue构建框架,鉴于这不是最主要考察前端以及相关技术不熟练或未掌握(比如路由实现局部刷新（懒加载）vue-router），就不把前端写复杂了，尽量展示API调用接口实现数据库的功能

## 登录界面:

登录页面形式如下：

![image-20240529111028114](C:\Users\27892\Desktop\shop\README.assets\image-20240529111028114.png)

页面实现代码见components下login文件夹的login.vue文件，主要是用fetch调用后端API接口：这里不再赘述。

后端再通过数据库查询实现，通过返回信息（200，500等状态码实现登录判断）再通过前端反馈信息实现下列功能

### 登录功能:

#### 登录密码错误信息显示:

通过alert警告框实现

![image-20240529111050259](C:\Users\27892\Desktop\shop\README.assets\image-20240529111050259.png)

#### 输入密码警告框:

![image-20240529111106123](C:\Users\27892\Desktop\shop\README.assets\image-20240529111106123.png)

#### 正确登录:

正确登录会跳出加载动画，动画结束后进入index主页

![image-20240529111124087](C:\Users\27892\Desktop\shop\README.assets\image-20240529111124087.png)

#### 允许跳过登录:

> 但是跳过登录很多功能都无法使用

![image-20240529111203098](C:\Users\27892\Desktop\shop\README.assets\image-20240529111203098.png)

### 忘记密码界面:

> 暂不支持改密功能：需要改密请练习管理员

![image-20240529111429728](C:\Users\27892\Desktop\shop\README.assets\image-20240529111429728.png)

### 注册功能:

> 调用接口注册用户

![adduser](https://img.nxtf.net/sPeX7B.png)

#### 注册信息提示:

> 用户名是必填项：密码不一致也有提示信息

![image-20240529111613168](C:\Users\27892\Desktop\shop\README.assets\image-20240529111613168.png)

两个弹窗警告：

![image-20240529111642904](C:\Users\27892\Desktop\shop\README.assets\image-20240529111642904.png)

![image-20240529111651622](C:\Users\27892\Desktop\shop\README.assets\image-20240529111651622.png)

> 这里注册一个mobaisilent用于演示

#### 注册成功

![image-20240529111757320](C:\Users\27892\Desktop\shop\README.assets\image-20240529111757320.png)

## 主页:

### 预览

#### 主页预览(上部）：

![image-20240529111904885](C:\Users\27892\Desktop\shop\README.assets\image-20240529111904885.png)

#### 主页预览（下部）：

![image-20240529111930278](C:\Users\27892\Desktop\shop\README.assets\image-20240529111930278.png)

### 功能区块

#### 双开门动画演示

![image-20240529112120164](C:\Users\27892\Desktop\shop\README.assets\image-20240529112120164.png)



### 鼠标指针放入某个商品区域块实现”添加到购物车“按钮自动浮现:

![addbuton](https://img.nxtf.net/3aTU6o.png)

#### 悬浮按钮与图片自动缩放

![image-20240529112213516](C:\Users\27892\Desktop\shop\README.assets\image-20240529112213516.png)

#### 动态文字与导航与侵权免责声明

![image-20240529112237389](C:\Users\27892\Desktop\shop\README.assets\image-20240529112237389.png)

#### 一键置顶与暗黑模式按键:

![image-20240529112315138](C:\Users\27892\Desktop\shop\README.assets\image-20240529112315138.png)

##### 暗黑模式:

![image-20240529112342191](C:\Users\27892\Desktop\shop\README.assets\image-20240529112342191.png)

##### 一键置顶

> 详见项目网页：暂不演示

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

