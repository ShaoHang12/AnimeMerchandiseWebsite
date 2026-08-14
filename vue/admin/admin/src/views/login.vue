<template>
  <div>
    <div class="container" :style='{"minHeight":"100vh","backgroundAttachment":"fixed","alignItems":"center","background":"url(https://bpic.588ku.com/back_pic/05/98/85/965f07315aa9e79.jpg%21/fw/720/quality/90/unsharp/true/compress/true)","display":"flex","width":"100%","backgroundSize":"cover","backgroundPosition":"center center","backgroundRepeat":"no-repeat","justifyContent":"center"}'>

      <el-form :style='{"padding":"80px 6%","boxShadow":"0px 4px 20px 0px rgba(255,105,180,0.3020)","margin":"0","borderRadius":"50px","flexWrap":"wrap","background":"linear-gradient(135deg, #fff, #fff0f5)","display":"flex","width":"500px","height":"auto"}'>
        <div  :style='{"margin":"0 0 10px 0","color":"#FF69B4","textAlign":"center","width":"100%","lineHeight":"44px","fontSize":"26px","fontWeight":"bold"}' class="title-container">动漫产品销售系统登录</div>
        <div  class="list-item" :style='{"width":"80%","margin":"0 auto 10px","alignItems":"center","flexWrap":"wrap","display":"flex"}'>
          <div  class="lable" :style='{"width":"64px","lineHeight":"44px","fontSize":"14px","color":"#FF69B4"}'>会员名</div>
          <el-input :style='{"width":"100%"}' placeholder="请输入会员名" v-model="rulesForm.username"></el-input>
        </div>
        <div  class="list-item" :style='{"width":"80%","margin":"0 auto 10px","alignItems":"center","flexWrap":"wrap","display":"flex"}'>
          <div  class="lable" :style='{"width":"64px","lineHeight":"44px","fontSize":"14px","color":"#FF69B4"}'>密码：</div>
          <el-input :style='{"width":"100%"}' placeholder="请输入密码" type="password" v-model="rulesForm.password"></el-input>
        </div>
        <div :style='{"width":"80%","margin":"20px auto","alignItems":"center","display":"flex","height":"44px"}' v-if="roles.length>1" prop="loginInRole" class="list-type">
          <el-radio v-for="item in roles" v-bind:key="item.roleName" v-model="rulesForm.role" :label="item.roleName">{{item.roleName}}</el-radio>
        </div>
        <div :style='{"width":"100%","margin":"20px auto","alignItems":"center","justifyContent":"center","display":"flex"}'>
          <el-button v-if="loginType==1" :style='{"border":"0","cursor":"pointer","padding":"0 24px","margin":"0 10px","outline":"none","color":"#fff","borderRadius":"35px","background":"linear-gradient(135deg, #FF69B4, #FF1493)","width":"auto","fontSize":"18px","minWidth":"140px","height":"50px"}' type="primary" @click="login()" class="loginInBt">登录</el-button>
        </div>
      </el-form>

    </div>
  </div>
</template>
<script>

import menu from "@/utils/menu";
export default {
  data() {
    return {
      baseUrl:this.$base.url,
      loginType: 1,
      rulesForm: {
        username: "",
        password: "",
        role: "",
        code: '',
      },
      menus: [],
      roles: [],
      tableName: "",
      codes: [{
        num: 1,
        color: '#000',
        rotate: '10deg',
        size: '16px'
      },{
        num: 2,
        color: '#000',
        rotate: '10deg',
        size: '16px'
      },{
        num: 3,
        color: '#000',
        rotate: '10deg',
        size: '16px'
      },{
        num: 4,
        color: '#000',
        rotate: '10deg',
        size: '16px'
      }],
    };
  },
  mounted() {
    let menus = menu.list();
    this.menus = menus;

    for (let i = 0; i < this.menus.length; i++) {
      if (this.menus[i].hasBackLogin=='是') {
        this.roles.push(this.menus[i])
      }
    }
    console.log(this.roles);

  },
  created() {
    this.getRandCode()
  },
  destroyed() {},
  components: {
  },
  methods: {

    //注册
    register(tableName){
		this.$storage.set("loginTable", tableName);
        this.$storage.set("pageFlag", "register");
		this.$router.push({path:'/register'})
    },
    // 登陆
    login() {

		if (!this.rulesForm.username) {
			this.$message.error("请输入会员名");
			return;
		}
		if (!this.rulesForm.password) {
			this.$message.error("请输入密码");
			return;
		}
		if(this.roles.length>1) {
			let menus = this.menus;
			for (let i = 0; i < menus.length; i++) {
				if (menus[i].roleName == this.rulesForm.role) {
					this.tableName = menus[i].tableName;
				}
			}
		} else {
			this.tableName = this.roles[0].tableName;
			this.rulesForm.role = this.roles[0].roleName;
		}

		this.$http({
			url: `${this.tableName}/login?username=${this.rulesForm.username}&password=${this.rulesForm.password}`,
			method: "post"
		}).then(({ data }) => {
			if (data && data.code === 0) {
				this.$storage.set("Token", data.token);
				this.$storage.set("role", this.rulesForm.role);
				this.$storage.set("sessionTable", this.tableName);
				this.$storage.set("adminName", this.rulesForm.username);
				this.$router.replace({ path: "/index/" });
			} else {
				this.$message.error(data.msg);
			}
		});
    },
    getRandCode(len = 4){
		this.randomString(len)
    },
    randomString(len = 4) {
      let chars = [
          "a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k",
          "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v",
          "w", "x", "y", "z", "A", "B", "C", "D", "E", "F", "G",
          "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R",
          "S", "T", "U", "V", "W", "X", "Y", "Z", "0", "1", "2",
          "3", "4", "5", "6", "7", "8", "9"
      ]
      let colors = ["0", "1", "2","3", "4", "5", "6", "7", "8", "9", "a", "b", "c", "d", "e", "f"]
      let sizes = ['14', '15', '16', '17', '18']

      let output = [];
      for (let i = 0; i < len; i++) {
        let key = Math.floor(Math.random()*chars.length)
        this.codes[i].num = chars[key]
        let code = '#'
        for (let j = 0; j < 6; j++) {
          let key = Math.floor(Math.random()*colors.length)
          code += colors[key]
        }
        this.codes[i].color = code
        let rotate = Math.floor(Math.random()*60)
        let plus = Math.floor(Math.random()*2)
        if(plus == 1) rotate = '-'+rotate
        this.codes[i].rotate = 'rotate('+rotate+'deg)'
        let size = Math.floor(Math.random()*sizes.length)
        this.codes[i].size = sizes[size]+'px'
      }
    },
  }
};
</script>

<style lang="scss" scoped>
.container {
  min-height: 100vh;
  position: relative;
  background-repeat: no-repeat;
  background-position: center center;
  background-size: cover;
  background: url(https://bpic.588ku.com/back_pic/05/98/85/965f07315aa9e79.jpg%21/fw/720/quality/90/unsharp/true/compress/true);
  animation: bgFloat 20s ease-in-out infinite;

  .list-item ::v-deep .el-input .el-input__inner {
		border: none;
		padding: 0 10px;
		box-shadow: 0px 4px 10px 0px rgba(255,105,180,0.2020);
		color: #333;
		width: 100%;
		font-size: 14px;
		height: 44px;
		border-radius: 8px;
		background: #fff0f5;
		transition: all 0.3s ease;
		&:focus {
			box-shadow: 0px 4px 15px 0px rgba(255,105,180,0.4);
		}
	  }
  
  .list-code ::v-deep .el-input .el-input__inner {
  	  	border: 0px solid #FF69B4;
  	  	padding: 0 10px;
  	  	box-shadow: 0px 4px 10px 0px rgba(255,105,180,0.2020);
  	  	outline: none;
  	  	color: #333;
  	  	width: calc(100% - 20px);
  	  	font-size: 14px;
  	  	height: 44px;
		border-radius: 8px;
		background: #fff0f5;
  	  }

  .list-type ::v-deep .el-radio__input .el-radio__inner {
		background: rgba(53, 53, 53, 0);
		border-color: #FFB6C1;
	  }
  .list-type ::v-deep .el-radio__input.is-checked .el-radio__inner {
        background: #FF69B4;
        border-color: #FF69B4;
      }
  .list-type ::v-deep .el-radio__label {
		color: #C71585;
		font-size: 14px;
	  }
  .list-type ::v-deep .el-radio__input.is-checked+.el-radio__label {
        color: #FF1493;
        font-size: 14px;
      }

  .loginInBt {
    transition: all 0.3s cubic-bezier(0.25, 0.8, 0.25, 1);
    position: relative;
    overflow: hidden;
    &::after {
      content: '';
      position: absolute;
      top: 50%;
      left: 50%;
      width: 0;
      height: 0;
      background: rgba(255,255,255,0.2);
      border-radius: 50%;
      transform: translate(-50%, -50%);
      transition: width 0.6s, height 0.6s;
    }
    &:hover {
      transform: translateY(-3px);
      box-shadow: 0 7px 20px rgba(255,105,180,0.5);
      &::after {
        width: 300px;
        height: 300px;
      }
    }
    &:active {
      transform: translateY(-1px);
    }
  }
}

@keyframes bgFloat {
  0% { background-position: 0% 0%; }
  50% { background-position: 100% 100%; }
  100% { background-position: 0% 0%; }
}
</style>
