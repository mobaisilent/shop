<script>
export default {
  data() {
    return {
      orderItems: [
        { id: 1, name: '商品1', quantity: 2, price: 100, image: 'link_to_image1' },
        { id: 2, name: '商品2', quantity: 1, price: 200, image: 'link_to_image2' }
      ],
      selectedAddress: {
        name: '张三',
        phone: '13800000000',
        address: '北京市朝阳区某街道某小区'
      },
      paymentMethods: [
        { id: 'wechat', name: '微信支付' },
        { id: 'alipay', name: '支付宝' },
        { id: 'credit-card', name: '信用卡' }
      ],
      selectedPaymentMethod: 'wechat',
      invoiceType: '个人',
      invoiceTitle: '',
      invoiceTaxNumber: '',
      orderNote: '',
      shippingFee: 10,
      discount: 20
    };
  },
  computed: {
    totalPrice() {
      return this.orderItems.reduce((total, item) => total + item.price * item.quantity, 0);
    },
    totalPayable() {
      return this.totalPrice + this.shippingFee - this.discount;
    }
  },
  methods: {
    addAddress() {
      // 跳转到添加地址页面或弹出添加地址表单
      alert('添加地址功能尚未实现');
    },
    editAddress() {
      // 跳转到编辑地址页面或弹出编辑地址表单
      alert('编辑地址功能尚未实现');
    },
    submitOrder() {
      // 提交订单逻辑
      alert('订单已提交');
    }
  }
};
</script>

<template>
  <div class="order-container">
    <h1>订单结算</h1>
    <div class="order-main">
      <!-- 订单信息 -->
      <section class="order-info">
        <h2>订单商品</h2>
        <ul>
          <li v-for="item in orderItems" :key="item.id">
            <img :src="item.image" alt="product image" />
            <div>
              <p>{{ item.name }}</p>
              <p>数量: {{ item.quantity }}</p>
              <p>价格: ¥{{ item.price }}</p>
            </div>
          </li>
        </ul>
      </section>

      <!-- 收货地址 -->
      <section class="shipping-address">
        <h2>收货地址</h2>
        <div v-if="selectedAddress">
          <p>{{ selectedAddress.name }} {{ selectedAddress.phone }}</p>
          <p>{{ selectedAddress.address }}</p>
          <button @click="editAddress">编辑地址</button>
        </div>
        <div v-else>
          <p>请添加收货地址</p>
          <button @click="addAddress">添加地址</button>
        </div>
      </section>

      <!-- 支付方式 -->
      <section class="payment-method">
        <h2>支付方式</h2>
        <div v-for="method in paymentMethods" :key="method.id">
          <input type="radio" :id="method.id" v-model="selectedPaymentMethod" :value="method.id" />
          <label :for="method.id">{{ method.name }}</label>
        </div>
      </section>

      <!-- 发票信息 -->
      <section class="invoice-info">
        <h2>发票信息</h2>
        <div>
          <label>
            <input type="radio" value="个人" v-model="invoiceType" /> 个人
          </label>
          <label>
            <input type="radio" value="公司" v-model="invoiceType" /> 公司
          </label>
        </div>
        <div v-if="invoiceType === '公司'">
          <input type="text" v-model="invoiceTitle" placeholder="发票抬头" />
          <input type="text" v-model="invoiceTaxNumber" placeholder="税号" />
        </div>
      </section>

      <!-- 订单备注 -->
      <section class="order-note">
        <h2>订单备注</h2>
        <textarea v-model="orderNote" placeholder="留下你的备注信息" class="putnote"></textarea>
      </section>

      <!-- 价格详情 -->
      <section class="price-details">
        <h2>价格详情</h2>
        <p>商品总价: ¥{{ totalPrice }}</p>
        <p>运费: ¥{{ shippingFee }}</p>
        <p>优惠: ¥{{ discount }}</p>
        <p>应付总额: ¥{{ totalPayable }}</p>
      </section>

      <!-- 提交订单按钮 -->
      <button class="submit-order" @click="submitOrder">提交订单</button>
    </div>
  </div>
</template>

<style scoped>
@import url(../../CSS/order/order.css);
/* 这里备注一下 导入css文件需要使用@符号 */


</style>
