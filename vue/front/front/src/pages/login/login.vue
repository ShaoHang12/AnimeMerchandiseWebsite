<template>
<div>
	<div class="container" :style='{"minHeight":"100vh","alignItems":"center","background":"linear-gradient(135deg, #FFD6E5 0%, #FFF0F5 50%, #FFD6E5 100%) no-repeat","display":"flex","width":"100%","backgroundSize":"cover","backgroundPosition":"center center","backgroundRepeat":"no-repeat","justifyContent":"center"}'>
		<el-form ref="loginForm" :model="loginForm" :style='{"padding":"40px 30px 35px","boxShadow":"0 10px 40px rgba(255, 107, 157, 0.2)","margin":"0","borderRadius":"24px","width":"450px","maxWidth":"90vw","height":"auto","background":"rgba(255, 255, 255, 0.95)","backdropFilter":"blur(10px)"}' :rules="rules">
			<div v-if="true" :style='{"margin":"0 0 15px 0","background":"linear-gradient(135deg, #FF6B9D, #E85588)","-webkit-background-clip":"text","-webkit-text-fill-color":"transparent","backgroundClip":"text","textAlign":"center","width":"100%","fontSize":"16px","fontWeight":"bold","letterSpacing":"3px"}'>USER / LOGIN</div>
			<div v-if="true" :style='{"margin":"0 0 30px 0","background":"linear-gradient(135deg, #FF6B9D, #E85588)","-webkit-background-clip":"text","-webkit-text-fill-color":"transparent","backgroundClip":"text","textAlign":"center","width":"100%","fontSize":"28px","fontWeight":"bold","letterSpacing":"2px"}'>动漫产品销售系统登录</div>
			<el-form-item v-if="loginType==1" class="list-item" :style='{"width":"85%","margin":"0 auto 20px"}' prop="username">
				<div v-if="true" :style='{"width":"64px","lineHeight":"40px","fontSize":"14px","color":"#FF6B9D","fontWeight":"500"}'>账号：</div>
				<el-input :style='{"width":"100%"}' v-model="loginForm.username" placeholder="请输入账户"></el-input>
			</el-form-item>
			<el-form-item v-if="loginType==1" class="list-item" :style='{"width":"85%","margin":"0 auto 20px"}' prop="password">
				<div v-if="true" :style='{"width":"64px","lineHeight":"40px","fontSize":"14px","color":"#FF6B9D","fontWeight":"500"}'>密码：</div>
				<el-input :style='{"width":"100%"}' v-model="loginForm.password" placeholder="请输入密码" type="password"></el-input>
			</el-form-item>
			<el-form-item v-if="roles.length>1" class="list-type" :style='{"width":"85%","margin":"25px auto"}' prop="role">
				<el-radio v-model="loginForm.tableName" :label="item.tableName" v-for="(item, index) in roles" :key="index" @change.native="getCurrentRow(item)">{{item.roleName}}</el-radio>
			</el-form-item>
			<el-form-item :style='{"width":"85%","margin":"30px auto"}'>
				<el-button v-if="loginType==1" :style='{"border":"none","cursor":"pointer","padding":"0 36px","boxShadow":"0 4px 15px rgba(255, 107, 157, 0.3)","margin":"0 10px","outline":"none","color":"#fff","borderRadius":"25px","background":"linear-gradient(135deg, #FF6B9D 0%, #FF8FB1 50%, #FFB8D0 100%)","width":"auto","fontSize":"16px","height":"48px","fontWeight":"500","transition":"all 0.3s ease"}' @click="submitForm('loginForm')">登录</el-button>
				<el-button v-if="loginType==1" :style='{"border":"2px solid #FFB8D0","cursor":"pointer","padding":"0 36px","boxShadow":"none","margin":"0 10px","outline":"none","color":"#FF6B9D","borderRadius":"25px","background":"#fff","width":"auto","fontSize":"16px","height":"48px","fontWeight":"500","transition":"all 0.3s ease"}' @click="resetForm('loginForm')">重置</el-button>
			</el-form-item>
			<div :style='{"width":"85%","margin":"20px auto","textAlign":"center"}'>
			<router-link :style='{"cursor":"pointer","margin":"0 10px","fontSize":"14px","textDecoration":"none","color":"#FF6B9D","fontWeight":"500","transition":"all 0.3s ease"}' :to="{path: '/register', query: {role: item.tableName,pageFlag:'register'}}" v-if="item.hasFrontRegister=='是'" v-for="(item, index) in roles" :key="index">注册{{item.roleName.replace('注册','')}}</router-link>
			</div>
		</el-form>
    </div>
</div>
</template>

<script>

export default {
	//数据集合
	data() {
		return {
            baseUrl: this.$config.baseUrl,
            loginType: 1,
			roleMenus: [{"backMenu":[{"child":[{"appFrontIcon":"cuIcon-vip","buttons":["新增","查看","修改","删除"],"menu":"会员","menuJump":"列表","tableName":"yonghu"}],"menu":"会员管理"},{"child":[{"appFrontIcon":"cuIcon-shop","buttons":["新增","查看","修改","删除"],"menu":"产品类别","menuJump":"列表","tableName":"chanpinleibie"}],"menu":"产品类别管理"},{"child":[{"appFrontIcon":"cuIcon-link","buttons":["新增","查看","修改","删除","查看评论"],"menu":"动漫产品","menuJump":"列表","tableName":"dianzichanpin"}],"menu":"动漫产品管理"},{"child":[{"appFrontIcon":"cuIcon-camera","buttons":["删除","审核","查看"],"menu":"售后申请","menuJump":"列表","tableName":"shouhoushenqing"}],"menu":"售后申请管理"},{"child":[{"appFrontIcon":"cuIcon-circle","buttons":["查看","修改","回复","删除"],"menu":"留言板管理","tableName":"messages"}],"menu":"留言板管理"},{"child":[{"appFrontIcon":"cuIcon-phone","buttons":["新增","查看","修改","删除"],"menu":"轮播图管理","tableName":"config"},{"appFrontIcon":"cuIcon-rank","buttons":["查看","修改"],"menu":"关于我们","tableName":"aboutus"},{"appFrontIcon":"cuIcon-news","buttons":["新增","查看","修改","删除"],"menu":"通知公告","tableName":"news"},{"appFrontIcon":"cuIcon-taxi","buttons":["查看","修改"],"menu":"系统简介","tableName":"systemintro"},{"appFrontIcon":"cuIcon-service","buttons":["新增","查看","修改","删除"],"menu":"在线客服","tableName":"chat"}],"menu":"系统管理"},{"child":[{"appFrontIcon":"cuIcon-addressbook","buttons":["查看","删除"],"menu":"已发货订单","tableName":"orders/已发货"},{"appFrontIcon":"cuIcon-present","buttons":["查看","删除","发货"],"menu":"已支付订单","tableName":"orders/已支付"},{"appFrontIcon":"cuIcon-newshot","buttons":["查看","删除","日销量","月销量","年销量","品销量","日销额","月销额","年销额","品销额"],"menu":"已完成订单","tableName":"orders/已完成"},{"appFrontIcon":"cuIcon-attentionfavor","buttons":["查看","删除"],"menu":"已取消订单","tableName":"orders/已取消"},{"appFrontIcon":"cuIcon-pay","buttons":["查看","删除"],"menu":"已退款订单","tableName":"orders/已退款"},{"appFrontIcon":"cuIcon-attentionfavor","buttons":["查看","删除"],"menu":"未支付订单","tableName":"orders/未支付"}],"menu":"订单管理"}],"frontMenu":[{"child":[{"appFrontIcon":"cuIcon-similar","buttons":["查看"],"menu":"电子产品列表","menuJump":"列表","tableName":"dianzichanpin"}],"menu":"电子产品模块"}],"hasBackLogin":"是","hasBackRegister":"否","hasFrontLogin":"否","hasFrontRegister":"否","roleName":"管理员","tableName":"users"},{"backMenu":[{"child":[{"appFrontIcon":"cuIcon-camera","buttons":["新增","查看","修改","删除"],"menu":"售后申请","menuJump":"列表","tableName":"shouhoushenqing"}],"menu":"售后申请管理"}],"frontMenu":[{"child":[{"appFrontIcon":"cuIcon-similar","buttons":["查看"],"menu":"电子产品列表","menuJump":"列表","tableName":"dianzichanpin"}],"menu":"电子产品模块"}],"hasBackLogin":"是","hasBackRegister":"否","hasFrontLogin":"是","hasFrontRegister":"是","roleName":"会员","tableName":"yonghu"}],
			loginForm: {
				username: '',
				password: '',
				tableName: '',
				code: '',
			},
			role: '',
            roles: [],
			rules: {
				username: [
					{ required: true, message: '请输入账户', trigger: 'blur' }
				],
				password: [
					{ required: true, message: '请输入密码', trigger: 'blur' }
				]
			},
			codes: [{
				num: 1,
				color: '#000',
				rotate: '10deg',
				size: '16px'
			}, {
				num: 2,
				color: '#000',
				rotate: '10deg',
				size: '16px'
			}, {
				num: 3,
				color: '#000',
				rotate: '10deg',
				size: '16px'
			}, {
				num: 4,
				color: '#000',
				rotate: '10deg',
				size: '16px'
			}]
		}
	},
  components: {
  },
	created() {
        for(let item in this.roleMenus) {
            if(this.roleMenus[item].hasFrontLogin=='是') {
                this.roles.push(this.roleMenus[item]);
            }
        }
	},
	mounted() {
	},
    //方法集合
    methods: {
		randomString() {
			var len = 4;
			var chars = [
			  'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k',
			  'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v',
			  'w', 'x', 'y', 'z', 'A', 'B', 'C', 'D', 'E', 'F', 'G',
			  'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R',
			  'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z', '0', '1', '2',
			  '3', '4', '5', '6', '7', '8', '9'
			]
			var colors = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'a', 'b', 'c', 'd', 'e', 'f']
			var sizes = ['14', '15', '16', '17', '18']
			
			var output = []
			for (var i = 0; i < len; i++) {
			  // 随机验证码
			  var key = Math.floor(Math.random() * chars.length)
			  this.codes[i].num = chars[key]
			  // 随机验证码颜色
			  var code = '#'
			  for (var j = 0; j < 6; j++) {
			    var key = Math.floor(Math.random() * colors.length)
			    code += colors[key]
			  }
			  this.codes[i].color = code
			  // 随机验证码方向
			  var rotate = Math.floor(Math.random() * 45)
			  var plus = Math.floor(Math.random() * 2)
			  if (plus == 1) rotate = '-' + rotate
			  this.codes[i].rotate = 'rotate(' + rotate + 'deg)'
			  // 随机验证码字体大小
			  var size = Math.floor(Math.random() * sizes.length)
			  this.codes[i].size = sizes[size] + 'px'
			}
		},
      getCurrentRow(row) {
        this.role = row.roleName;
      },
      submitForm(formName) {
        if (this.roles.length!=1) {
            if (!this.role) {
                this.$message.error("请选择登录会员类型");
                return false;
            }
        } else {
            this.role = this.roles[0].roleName;
            this.loginForm.tableName = this.roles[0].tableName;
        }
        this.$refs[formName].validate((valid) => {
          if (valid) {
            this.$http.get(`${this.loginForm.tableName}/login`, {params: this.loginForm}).then(res => {
              if (res.data.code === 0) {
                localStorage.setItem('Token', res.data.token);
                localStorage.setItem('UserTableName', this.loginForm.tableName);
                localStorage.setItem('username', this.loginForm.username);
                localStorage.setItem('adminName', this.loginForm.username);
                localStorage.setItem('sessionTable', this.loginForm.tableName);
                localStorage.setItem('role', this.role);
                localStorage.setItem('keyPath', this.$config.indexNav.length+2);
                this.$router.push('/index/center');
                this.$message({
                  message: '登录成功',
                  type: 'success',
                  duration: 1500,
                });
              } else {
                this.$message.error(res.data.msg);
              }
            });
          } else {
            return false;
          }
        });
      },
      resetForm(formName) {
        this.$refs[formName].resetFields();
      }
    }
  }
</script>

<style rel="stylesheet/scss" lang="scss" scoped>
	.container {
		position: relative;
		
		.el-form-item {
		  & ::v-deep .el-form-item__content {
		    width: 100%;
		  }
		}
		
		.list-item ::v-deep .el-input .el-input__inner {
			border: 2px solid #FFD6E5;
			border-radius: 12px;
			padding: 0 15px;
			box-shadow: 0 2px 10px rgba(255, 107, 157, 0.1);
			color: #333;
			background: #fff;
			width: 100%;
			font-size: 14px;
			height: 48px;
			transition: all 0.3s ease;
		}
		
		.list-item ::v-deep .el-input .el-input__inner:focus {
			border-color: #FF6B9D;
			box-shadow: 0 2px 15px rgba(255, 107, 157, 0.2);
		}
		
		.list-code ::v-deep .el-input .el-input__inner {
			border: 2px solid #FFD6E5;
			border-radius: 12px;
			padding: 0 15px;
			box-shadow: 0 2px 10px rgba(255, 107, 157, 0.1);
			outline: none;
			color: #333;
			background: #fff;
			display: inline-block;
			vertical-align: middle;
			width: calc(100% - 164px);
			font-size: 14px;
			height: 48px;
			transition: all 0.3s ease;
		}
		
		.list-type ::v-deep .el-radio__input .el-radio__inner {
			background: rgba(255, 107, 157, 0.1);
			border-color: #FFB8D0;
		}
		.list-type ::v-deep .el-radio__input.is-checked .el-radio__inner {
			background: #FF6B9D;
			border-color: #FF6B9D;
		}
		.list-type ::v-deep .el-radio__label {
			color: #666666;
			font-size: 14px;
		}
		.list-type ::v-deep .el-radio__input.is-checked+.el-radio__label {
			color: #FF6B9D;
			font-size: 14px;
		}
	}
</style>

