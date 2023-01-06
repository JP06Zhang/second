<!--
 * @Description: 商品详情页面组件
 * @Author: hai-27
 * @Date: 2020-02-16 20:20:26
 * @LastEditors: hai-27
 * @LastEditTime: 2020-03-07 21:59:26
 -->
<template >
  <div id="details">
    <!-- 头部 -->
    <div class="page-header">
      <div class="title">
        <p>{{productDetails.productName}}</p>
        <div class="list">
          <ul>
            <li>
              <router-link to>概述</router-link>
            </li>
            <li>
              <router-link to>参数</router-link>
            </li>
            <li>
              <router-link to>用户评价</router-link>
            </li>
          </ul>
        </div>
      </div>
    </div>
    <!-- 头部END -->

    <!-- 主要内容 -->
    <div class="main">
      <!-- 左侧商品轮播图 -->
      <div class="block">
        <el-carousel height="560px" v-if="productPicture.length>1">
          <el-carousel-item v-for="item in productPicture" :key="item.id">
            <img style="height:560px;" :src="$target + item.productPicture" :alt="item.intro" />
          </el-carousel-item>
        </el-carousel>
        <div v-if="productPicture.length==1">
          <img
            style="height:560px;"
            :src="$target + productPicture[0].productPicture"
            :alt="productPicture[0].intro"
          />
        </div>
      </div>
      <!-- 左侧商品轮播图END -->

      <!-- 右侧内容区 -->
      <div class="content">
        <h1 class="name">{{productDetails.productName}}</h1>
        <p class="intro">{{productDetails.productIntro}}</p>
        <p class="store">小米自营</p>
        <div class="price">
          <span>{{productDetails.productSellingPrice}}元</span>
          <span
            v-show="productDetails.productPrice != productDetails.productSellingPrice"
            class="del"
          >{{productDetails.productPrice}}元</span>
        </div>
        <div class="pro-list">
          <span class="pro-name">{{productDetails.productName}}</span>
          <span class="pro-price">
            <span>{{productDetails.productSellingPrice}}元</span>
            <span
              v-show="productDetails.productPrice != productDetails.productSellingPrice"
              class="pro-del"
            >{{productDetails.productPrice}}元</span>
          </span>
          <p class="price-sum">总计 : {{productDetails.productSellingPrice}}元</p>
        </div>
        <!-- 内容区底部按钮 -->
        <div class="button">
          
          <el-button class="shop-cart" :disabled="dis" @click="addShoppingCart">加入购物车</el-button>
          <el-button class="like" @click="addCollect">喜欢</el-button>
          <el-button class="copy" @click="copy()"  >分享</el-button>
          

        </div>

        <!-- 评论显示区域 -->
        <!-- <div style="margin: 10px 0">
        <el-input type="textarea" placeholder="请输入评论" v-model="comment.content"></el-input> -->
        <!-- <div style="text-align: right; margin: 10px 0">
          <el-button type="primary" @click="submit">提交</el-button>
        </div> -->
      <!-- </div> -->

        <!-- 内容区底部按钮END -->
        <div class="pro-policy">
          <ul>
            <li>
              <i class="el-icon-circle-check"></i> 小米自营
            </li>
            <li>
              <i class="el-icon-circle-check"></i> 小米发货
            </li>
            <li>
              <i class="el-icon-circle-check"></i> 7天无理由退货
            </li>
            <li>
              <i class="el-icon-circle-check"></i> 7天价格保护
            </li>
          </ul>
        </div>
      
      </div>
      <!-- 右侧内容区END -->
    </div>
    <!-- 主要内容END -->
    <!-- 评论显示区域 -->
    <el-form :model="comment" status-icon ref="ruleForm" class="demo-ruleForm">
    <!-- <div style="margin: 10px 0"> -->
      <el-form-item prop="content">
      <el-input 
      
              prefix-icon="el-icon-view"
              type="sell"
              placeholder="请输入评价"
              v-model="comment.content"
             
            ></el-input>
          </el-form-item>
          </el-form>
        <div style="text-align: right; margin: 10px 0">
          <el-button type="primary" @click="submit">提交</el-button>
        </div>
      <!-- </div> -->
    
    <div style="margin: 20px 0">
      <div style="margin: 10px 0; font-size: 24px; padding: 10px 0; border-bottom: 1px solid #ccc; text-align: left">评论列表</div>

      <div style="margin: 20px 0;  text-align: left;">
        <div style="padding: 10px 0; " v-for="item in comments" :key="item.id">
          <div style="display: flex">
            <div style="width: 80px"><el-avatar :size="50" :src="'https://cube.elemecdn.com/3/7c/3ea6beec64369c2642b92c6726f1epng.png'"></el-avatar></div>
            <div style="flex: 1">
              <div>{{ item.username }} <span style="margin-left: 10px">{{  item.createtime }}</span></div>
              <div style="margin-top: 10px; color: #666">{{ item.content }}</div>
              <div>
                <el-button type="text" @click="reply(item.id, item.username)">回复</el-button>
          

              <!-- 回复列表 -->
              <div v-if="item.children && item.children.length" style="margin-left: 100px; background-color: aliceblue; padding: 10px; border-radius: 10px">
                <div v-for="sub in item.children" :key="sub.id">
                  <div style="padding:5px 0"><b style="cursor: pointer" @click="reply(sub.pid, sub.username)">{{ sub.username }}</b> <span>回复 <span style="color: cornflowerblue">@{{ sub.target }}</span>
                    <span style="color: #666; margin-left: 10px">{{ sub.content }}</span></span>
                  <span style="float: right; font-size: 13px; color: #666; margin-top: 3px">{{ sub.createtime }}</span>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>

      </div>
    </div>

    <el-dialog title="回复" :visible.sync="dialogFormVisible" width="40%">
      <el-form :model="replyComment">
        <el-form-item label="内容" :label-width="100">
          <el-input v-model="replycontent" autocomplete="off" style="width: 80%"></el-input>
        </el-form-item>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button @click="dialogFormVisible = false">取 消</el-button>
        <el-button type="primary" @click="saveReply">确 定</el-button>
      </div>
    </el-dialog> 
  </div> 
  </div>
</template>

<script>
import { mapActions } from "vuex";
export default {
  data() {
    
    return {
      dis: false, // 控制“加入购物车按钮是否可用”
      productID: "", // 商品id
      productDetails: "", // 商品详细信息
      productPicture: "", // 商品图片
      comments: [],
      comment: {
      rate: 0,
      content: ""
      },
      replyComment: {},
      replycontent:"",
      dialogFormVisible: false,
      windowUrl : window.location.href
    }
  },

  created() {
   
  },
  // 通过路由获取商品id
  activated() {
    if (this.$route.query.productID != undefined) {
      this.productID = this.$route.query.productID;
      this.load()
    }
  },
  watch: {
    // 监听商品id的变化，请求后端获取商品数据
    productID: function(val) {
      this.getDetails(val);
      this.getDetailsPicture(val);
    }
  },
  methods: {
    ...mapActions(["unshiftShoppingCart", "addShoppingCartNum"]),

//     copyLink(val) { // 复制链接
//     console.log(val, '复制链接')
//     let url = val // 后台接口返回的链接地址
//     let inputNode = document.createElement('input')  // 创建input
//     inputNode.value = url // 赋值给 input 值
//     document.body.appendChild(inputNode) // 插入进去
//     inputNode.select() // 选择对象
//     document.execCommand('Copy') // 原生调用执行浏览器复制命令
//     inputNode.className = 'oInput'
//     inputNode.style.display = 'none' // 隐藏
//     this.$message.success('复制成功')
// },

copy(){
            var domUrl = document.createElement("input");
            domUrl.value = this.windowUrl;
            domUrl.id = "creatDom";
            document.body.appendChild(domUrl);
            domUrl.select(); // 选择对象
            document.execCommand("Copy"); // 执行浏览器复制命令
            let creatDom = document.getElementById("creatDom");
            creatDom.parentNode.removeChild(creatDom);
            this.$message({
                message: '复制成功',
                type: 'success'
            });
        },

    reply(pid, target) {
      if (!this.$store.getters.getUser) {
        this.$store.dispatch("setShowLogin", true);
        return;
      }
      this.replyComment = {pid: pid, target: target}
      console.log(this.replyComment,3)
      this.dialogFormVisible = true
    },
    
    load() {  
      fetch('http://localhost:8081/api/comment?productId=' + this.productID).then(res => {
        if (res.status === 500) {
          this.$notify.error('系统错误')
          return {}
        }
        return res.json()
      }).then(res => {
        this.value = res.rate
        console.log(res.data,1)

        this.comments = res.data[0];
        console.log(res.data[0],2)
      })
    },

    saveReply() {
      if (!this.$store.getters.getUser) {
        this.$store.dispatch("setShowLogin", true);
        return;
      }
      this.$refs["ruleForm"].validate(valid => {
          if (valid) {
            this.$axios
              .post("/api/comment",[ {
                productId:this.productID,
                pid:this.replyComment.pid,
                target:this.replyComment.target,
                content:this.replycontent
                                                      
              }]).then(res => {
        if (res.status === 200) {
          this.$notify.success('成功')
          this.load()
          this.replyComment = {}
          this.dialogFormVisible = false
        }
      })
    }
  });
    },




    submit() {
      if (!this.$store.getters.getUser) {
        this.$store.dispatch("setShowLogin", true);
        return;
      }
                // 通过element自定义表单校验规则，校验用户输入的用户信息
        this.$refs["ruleForm"].validate(valid => {
          if (valid) {
            this.$axios
              .post("/api/comment",[ {
                productId:this.productID,
                content:this.comment.content                                                
              }])
              .then(res => {
        if (res.status === 200) {
          this.$notify.success('成功')
          this.load()
          this.comment = {}
        }
      
      })
    }
    });
  },

  

    // 获取商品详细信息
    getDetails(val) {
      this.$axios
        .get("/api/product/" + val)
        .then(res => {
          this.productDetails = res.data.data;
        })
        .catch(err => {
          return Promise.reject(err);
        });
    },
    // 获取商品图片
    getDetailsPicture(val) {
      this.$axios
        .get("/api/productPicture/product/" + val)
        .then(res => {
          this.productPicture = res.data.data;
        })
        .catch(err => {
          return Promise.reject(err);
        });
    },
    // 加入购物车
    addShoppingCart() {
      // 判断是否登录,没有登录则显示登录组件
      if (!this.$store.getters.getUser) {
        this.$store.dispatch("setShowLogin", true);
        return;
      }
      this.$axios
        .post("/api/cart/product/user/" + this.productID + "/" + this.$store.getters.getUser.userId)
        .then(res => {
          switch (res.data.code) {
            case "001":
              // 新加入购物车成功
              this.unshiftShoppingCart(res.data.data);
              this.notifySucceed(res.data.msg);
              break;
            case "002":
              // 该商品已经在购物车，数量+1
              this.addShoppingCartNum(this.productID);
              this.notifySucceed(res.data.msg);
              break;
            case "003":
              // 商品数量达到限购数量
              this.dis = true;
              this.notifyError(res.data.msg);
              break;
            default:
              this.notifyError(res.data.msg);
          }
        })
        .catch(err => {
          return Promise.reject(err);
        });
    },
    addCollect() {
      // 判断是否登录,没有登录则显示登录组件
      if (!this.$store.getters.getUser) {
        this.$store.dispatch("setShowLogin", true);
        return;
      }
      this.$axios
        .post("/api/collect/user/" + this.productID + "/" + this.$store.getters.getUser.userId)
        .then(res => {
          if (res.data.code == "001") {
            // 添加收藏成功
            this.notifySucceed(res.data.msg);
          } else {
            // 添加收藏失败
            this.notifyError(res.data.msg);
          }
        })
        .catch(err => {
          return Promise.reject(err);
        });
    }
  }
};
</script>
<style>
/* 头部CSS */
#details .page-header {
  height: 64px;
  margin-top: -20px;
  z-index: 4;
  background: #fff;
  border-bottom: 1px solid #e0e0e0;
  -webkit-box-shadow: 0px 5px 5px rgba(0, 0, 0, 0.07);
  box-shadow: 0px 5px 5px rgba(0, 0, 0, 0.07);
}
#details .page-header .title {
  width: 1225px;
  height: 64px;
  line-height: 64px;
  font-size: 18px;
  font-weight: 400;
  color: #212121;
  margin: 0 auto;
}
#details .page-header .title p {
  float: left;
}
#details .page-header .title .list {
  height: 64px;
  float: right;
}
#details .page-header .title .list li {
  float: left;
  margin-left: 20px;
}
#details .page-header .title .list li a {
  font-size: 14px;
  color: #616161;
}
#details .page-header .title .list li a:hover {
  font-size: 14px;
  color: #ff6700;
}
/* 头部CSS END */

/* 主要内容CSS */
#details .main {
  width: 1225px;
  height: 560px;
  padding-top: 30px;
  margin: 0 auto;
}
#details .main .block {
  float: left;
  width: 560px;
  height: 560px;
}
#details .el-carousel .el-carousel__indicator .el-carousel__button {
  background-color: rgba(163, 163, 163, 0.8);
}
#details .main .content {
  float: left;
  margin-left: 25px;
  width: 640px;
}
#details .main .content .name {
  height: 30px;
  line-height: 30px;
  font-size: 24px;
  font-weight: normal;
  color: #212121;
}
#details .main .content .intro {
  color: #b0b0b0;
  padding-top: 10px;
}
#details .main .content .store {
  color: #ff6700;
  padding-top: 10px;
}
#details .main .content .price {
  display: block;
  font-size: 18px;
  color: #ff6700;
  border-bottom: 1px solid #e0e0e0;
  padding: 25px 0 25px;
}
#details .main .content .price .del {
  font-size: 14px;
  margin-left: 10px;
  color: #b0b0b0;
  text-decoration: line-through;
}
#details .main .content .pro-list {
  background: #f9f9fa;
  padding: 30px 60px;
  margin: 50px 0 50px;
}
#details .main .content .pro-list span {
  line-height: 30px;
  color: #616161;
}
#details .main .content .pro-list .pro-price {
  float: right;
}
#details .main .content .pro-list .pro-price .pro-del {
  margin-left: 10px;
  text-decoration: line-through;
}
#details .main .content .pro-list .price-sum {
  color: #ff6700;
  font-size: 24px;
  padding-top: 20px;
}
#details .main .content .button {
  height: 55px;
  margin: 10px 0 20px 0;
}
#details .main .content .button .el-button {
  float: left;
  height: 55px;
  font-size: 16px;
  color: #fff;
  border: none;
  text-align: center;
}
#details .main .content .button .shop-cart {
  width: 200px;
  background-color: #ff6700;
}
#details .main .content .button .shop-cart:hover {
  background-color: #f25807;
}

#details .main .content .button .like {
  width: 130px;
  margin-left: 40px;
  background-color: #b0b0b0;
}
#details .main .content .button .like:hover {
  background-color: #757575;
}

#details .main .content .button .copy {
  width: 130px;
  margin-left: 40px;
  background-color: #b0b0b0;
}
#details .main .content .button .copy:hover {
  background-color: #757575;
}

#details .main .content .pro-policy li {
  float: left;
  margin-right: 20px;
  color: #b0b0b0;
}
/* 主要内容CSS END */
</style>