<!--
 * @Description: 我的需求页面组件
 * @Author: hai-27
 * @Date: 2020-02-20 17:21:54
 * @LastEditors: hai-27
 * @LastEditTime: 2020-02-27 13:36:27
 -->
 <template>
    <div class="need">
      <!-- 我的需求头部 -->
      <div class="need-header">
        <div class="need-header-content">
          <p>
            <i class="el-icon-s-need" style="font-size: 30px;color: #ff6700;"></i>
            我发布的商品
          </p>
        </div>
      </div>
      <!-- 我的需求头部END -->
      
  
      <!-- 我的需求主要内容 -->
      <div class="need-content" v-if="needs.length>0">
        <div class="content" v-for="(item,index) in needs" :key="index">
          <ul>
            <!-- 我的订单表头 -->
            <li class="need-info">
              <div class="need-id">订单编号: {{item[0].needId}}</div>
            </li>
            <li class="header">
              <div class="pro-img"></div>
              <div class="pro-name">商品名称</div>
              <div class="pro-price">单价</div>
              <div class="pro-num">数量</div>
              <div class="pro-total">目前收益</div>
            </li>
            <!-- 我的需求表头END -->
  
            <!-- 需求列表 -->
            <li class="product-list" v-for="(product,i) in item" :key="i">
              <div class="pro-img">
            
                <img :src="product.productPicture" />
          
            </div>

            <div class="pro-name">
              <router-link
                :to="{ path: '/goods/details', query: {productID:product.productId} }"
              >{{product.productName}}</router-link>
            </div>

            <div class="pro-price">{{product.productSellingPrice}}元</div>
            <div class="pro-num">{{product.productNum - product.productSales}}</div>
            <div class="pro-total pro-total-in">{{product.productSellingPrice*product.productSales}}元</div>
            <span class="need-total">
                共
                <span class="need-total-num">{{product.productNum - product.productSales}}</span> 件商品
              </span>
            </li>
          </ul>    
            <!-- 订单列表END -->
        </div>
        <div style="margin-top:-40px;"></div>
      </div>
      <!-- 我的订单主要内容END -->
  
      <!-- 订单为空的时候显示的内容 -->
      <div v-else class="need-empty">
        <div class="empty">
          <h2>您的需求还是空的！</h2>
          <p>快去发布需求吧！</p>
        </div>
      </div>
      <!-- 订单为空的时候显示的内容END -->
    </div>
  </template>
  <script>

  export default {
    data() {
      return {
        needs: [], // 订单列表
        total: [] // 每个订单的商品数量及总价列表
      };
    },
    activated() {
      // 获取订单数据
      this.$axios
        .get("/api/product")
        .then(res => {
          if (res.data.code === "001") {
            this.needs = res.data.data;
          } else {
            this.notifyError(res.data.msg);
          }
        })
        .catch(err => {
          return Promise.reject(err);
        });
    },
    watch: {
      // 通过订单信息，计算出每个订单的商品数量及总价
      needs: function(val) {
        let total = [];
        for (let i = 0; i < val.length; i++) {
          const element = val[i];
  
          let totalNum = 0;
          let totalPrice = 0;
          for (let j = 0; j < element.length; j++) {
            const temp = element[j];
            totalNum = totalNum+1;
            totalPrice += temp.productPrice * temp.productNum;
          }
          total.push({ totalNum, totalPrice });
        }
        this.total = total;
      }
    }
  };
  </script>
  <style scoped>
  .need {
    background-color: #f5f5f5;
    padding-bottom: 20px;
  }
  /* 我的订单头部CSS */
  .need .need-header {
    height: 64px;
    bneed-bottom: 2px solid #ff6700;
    background-color: #fff;
    margin-bottom: 20px;
  }
  .need .need-header .need-header-content {
    width: 1225px;
    margin: 0 auto;
  }
  .need .need-header p {
    font-size: 28px;
    line-height: 58px;
    float: left;
    font-weight: normal;
    color: #424242;
  }
  /* 我的订单头部CSS END */
  .need .content {
    width: 1225px;
    margin: 0 auto;
    background-color: #fff;
    margin-bottom: 50px;
  }
  
  .need .content ul {
    background-color: #fff;
    color: #424242;
    line-height: 85px;
  }
  /* 我的订单表头CSS */
  .need .content ul .need-info {
    height: 60px;
    line-height: 60px;
    padding: 0 26px;
    color: #424242;
    bneed-bottom: 1px solid #ff6700;
  }
  .need .content ul .need-info .need-id {
    float: left;
    color: #ff6700;
  }
  .need .content ul .need-info .need-time {
    float: right;
  }
  
  .need .content ul .header {
    height: 85px;
    padding-right: 26px;
    color: #424242;
  }
  /* 我的订单表头CSS END */
  
  /* 订单列表CSS */
  .need .content ul .product-list {
    height: 85px;
    padding: 15px 26px 15px 0;
    bneed-top: 1px solid #e0e0e0;
  }
  .need .content ul .pro-img {
    float: left;
    height: 85px;
    width: 120px;
    padding-left: 80px;
  }
  .need .content ul .pro-img img {
    height: 80px;
    width: 80px;
  }
.need .content ul .pro-name {
  float: left;
  width: 380px;
}
.need .content ul .pro-name a {
  color: #424242;
}
.need .content ul .pro-name a:hover {
  color: #ff6700;
}
.need .content ul .pro-price {
  float: left;
  width: 160px;
  padding-right: 18px;
  text-align: center;
}
  .need .content ul .pro-num {
    float: left;
    width: 190px;
    text-align: center;
  }
  .need .content ul .pro-total {
    float: left;
    width: 160px;
    padding-right: 81px;
    text-align: right;
  }
  .need .content ul .pro-total-in {
    color: #ff6700;
  }
  
  .need .need-bar {
    width: 1185px;
    padding: 0 20px;
    bneed-top: 1px solid #ff6700;
    height: 50px;
    line-height: 50px;
    background-color: #fff;
  }
  .need .need-bar .need-bar-left {
    float: left;
  }
  .need .need-bar .need-bar-left .need-total {
    color: #757575;
  }
  .need .need-bar .need-bar-left .need-total-num {
    color: #ff6700;
  }
  .need .need-bar .need-bar-right {
    float: right;
  }
  .need .need-bar .need-bar-right .total-price-title {
    color: #ff6700;
    font-size: 14px;
  }
  .need .need-bar .need-bar-right .total-price {
    color: #ff6700;
    font-size: 30px;
  }
  /* 订单列表CSS END */
  
  /* 订单为空的时候显示的内容CSS */
  .need .need-empty {
    width: 1225px;
    margin: 0 auto;
  }
  .need .need-empty .empty {
    height: 300px;
    padding: 0 0 130px 558px;
    margin: 65px 0 0;
    background: url(../assets/imgs/cart-empty.png) no-repeat 124px 0;
    color: #b0b0b0;
    overflow: hidden;
  }
  .need .need-empty .empty h2 {
    margin: 70px 0 15px;
    font-size: 36px;
  }
  .need .need-empty .empty p {
    margin: 0 0 20px;
    font-size: 20px;
  }
  /* 订单为空的时候显示的内容CSS END */
  </style>