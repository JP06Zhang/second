<!--
 * @Description: 发布需求组件
 * @Author: hai-27
 * @Date: 2020-02-19 20:55:17
 * @LastEditors: hai-27
 * @LastEditTime: 2020-03-01 15:34:08
 -->
 <template>
    <div id="showNeed">
      <el-dialog title="发布需求" width="300px" center :visible.sync="isNeed">
        <el-form :model="Need" :rules="rules" status-icon ref="ruleForm" class="demo-ruleForm">
          <el-form-item prop="category">
            <el-select prefix-icon="el-icon-user-solid" placeholder="请选择商品类型" v-model="Need.category">
              <el-option label="手机" value="1"></el-option>
            </el-select>
          </el-form-item>
          <el-form-item prop="name">
            <el-input
              prefix-icon="el-icon-view"
              type="name"
              placeholder="请输入商品名称"
              v-model="Need.name"
            ></el-input>
          </el-form-item>
          <el-form-item prop="title">
            <el-input
              prefix-icon="el-icon-view"
              type="title"
              placeholder="请输入商品标题"
              v-model="Need.title"
            ></el-input>
            </el-form-item>
            <el-form-item prop="intro">
            <el-input
              prefix-icon="el-icon-view"
              type="intro"
              placeholder="请输入商品介绍"
              v-model="Need.intro"
            ></el-input>
            </el-form-item>
            <el-form-item prop="price">
            <el-input
              prefix-icon="el-icon-view"
              type="pricee"
              placeholder="请输入商品原价"
              v-model="Need.price"
            ></el-input>
            </el-form-item>
            <el-form-item prop="sell">
            <el-input
              prefix-icon="el-icon-view"
              type="sell"
              placeholder="请输入售价"
              v-model="Need.sell"
            ></el-input>
            </el-form-item>
            <el-form-item prop="num">
            <el-input
              prefix-icon="el-icon-view"
              type="num"
              placeholder="请输入库存"
              v-model="Need.num"
            ></el-input>
            </el-form-item>
            
    <el-button @click="onUpload">保存</el-button>  
      <el-button @click="onPickFile">选择图片</el-button>      
      <input 
          type="file" 
          ref="fileInput" 
          accept="image/*" 
          @change="getFile"
          style="display: none"
   >
   <div class="img">
      <el-image :src="imageUrl"/>   
   </div>
          <el-form-item>
            <el-button size="medium" type="primary" @click="Send" style="width:100%;">发布</el-button>
          </el-form-item>
        </el-form>
      </el-dialog>
    </div>
  </template>
  <script>
  import { mapActions } from "vuex";
  import axios from 'axios'

  export default {
    name: "MyNeed",
    data() {
      // 用户名的校验方法
      let validateName = (rule, value, callback) => {

        if (!value) {
          return callback(new Error("请输入商品名称"));
        }
        return callback();
      };
      // 密码的校验方法
      let validatePass = (rule, value, callback) => {
        if (value === "") {
          return callback(new Error("请选择商品类型"));
        }
        return callback();
      };
      return {
        Need: {
          name: "",
          category: ""
               //需要上传到的地址
        },
        imageUrl: "",  //img绑定的src地址
        postUrl: "",  
        // 用户信息校验规则,validator(校验方法),trigger(触发方式),blur为在组件 Input 失去焦点时触发
        rules: {
          name: [{ validator: validateName, trigger: "blur" }],
          category: [{ validator: validatePass, trigger: "blur" }]
        }
      };
    },
  //   mounted () {
  //   //第一步:先请求一下api,看看需要上传到哪里去,存到postUrl里面 ( 做了跨域配置,所以直接写成了api )
  //   axios.get('api/need/upload').then( res => {
  //     if ( res.status === 200 && res.data){
  //       let data = res.data.data
  //       let postUrl = data.url
  //       console.log( postUrl)             //页面挂载后,先打印一下,拿到了需要上传到的url地址   ( 第一次有效打印 )
  //       this.postUrl = postUrl            //把地址保存下来
  //     }    
  //   })
  // },
    computed: {
      // 获取vuex中的showLogin，控制登录组件是否显示
      isNeed: {
        get() {
          return this.$store.getters.getShowNeed;
        },
        set(val) {
          this.$refs["ruleForm"].resetFields();
          this.setShowNeed(val);
        }
      }
    },
    methods: {
      ...mapActions(["setUser", "setShowNeed"]),
      onPickFile () {
      this.$refs.fileInput.click()
    },
    //第三步: 文件选择后, 后在页面上显示出来    转base64位的操作
    getFile (event) {
      const files = event.target.files
      let filename = files[0].name          //只有一个文件
      if ( filename.lastIndexOf('.') <= 0 ) {
        return alert("Please add a valid image!")        //判断图片是否有效
      }
      const fileReader = new FileReader()                //内置方法new FileReader()   读取文件
        fileReader.addEventListener('load',() => {
        this.imageUrl = fileReader.result
       })
        fileReader.readAsDataURL(files[0])
        this.image = files[0]
        //到这里后, 选择图片就可以显示出来了
    } ,
    onUpload (event) {
      event.preventDefault();
      let fd = new FormData()              //内置方法new FormData()  新建一个表格
      fd.append('file',this.image)          //把image添加进去
      console.log(this.image)                                    //(       第二次有效打印           )
      axios.post('api/need/upload',fd).then( res => {                 //第一个参:this.postUrl就是上面保存好的要上传的地址
      console.log(res)                                               //(      第三次有效打印    )
        if(res.status === 200 && res.data ){
          let data = res.data
          let imageUrl = data.url                                        //上传成功 , 后台返回了一个图片地址
          this.imageUrl = imageUrl
          console.log(this.imageUrl)
        }
       }).catch(error => {
          console.log(error)
      })
    },
      Send() {
                // 通过element自定义表单校验规则，校验用户输入的用户信息
        this.$refs["ruleForm"].validate(valid => {
          //如果通过校验开始登录

          if (valid) {
            this.$axios
              .post("/api/product",[ {
                productName: this.Need.name,
                categoryId: this.Need.category, 
                productPicture:this.imageUrl,
                productTitle:this.Need.title,
                productIntro:this.Need.intro,
                productPrice:this.Need.price,
                productSellingPrice:this.Need.sell,
                productNum:this.Need.num                                                                              
              }])
              .then(res => {
                // “001”代表登录成功，其他的均为失败
                if (res.data.code === "001") {
                  // 隐藏登录组件
                  this.isNeed = false;
                  // 登录信息存到本地
                  // let user = JSON.stringify(res.data.data);
                  // localStorage.setItem("user", user);
                  // 登录信息存到vuex
                  this.setUser(res.data.data);
                  // 弹出通知框提示登录成功信息
                  this.notifySucceed(res.data.msg);
                } else {
                  // 清空输入框的校验状态
                  this.$refs["ruleForm"].resetFields();
                  // 弹出通知框提示登录失败信息
                  this.notifyError(res.data.msg);
                }
              })
              .catch(err => {
                return Promise.reject(err);
              });
          } else {
            return false;
          }
        });
      }
    }
  };
  </script>
  <style scoped>
     ul .img img {
    height: 80px;
    width: 80px;
  }
  </style>