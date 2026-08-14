<template>
  <div class="main-containers">
    <div class="top-container"
         :style='{"boxShadow":"0 2px 20px rgba(255, 107, 157, 0.15)","padding":"0px","margin":"0 auto","overflow":"hidden","alignItems":"center","background":"linear-gradient(135deg, #FFD6E5 0%, #FFF0F5 50%, #FFD6E5 100%) fixed","display":"flex","width":"100%","position":"relative","justifyContent":"space-around","height":"80px","zIndex":"1002"}'>
      <img v-if='false'
           :style='{"width":"44px","objectFit":"cover","borderRadius":"100%","display":"block","height":"44px"}'
           src='http://codegen.caihongy.cn/20201114/7856ba26477849ea828f481fa2773a95.jpg'>
      <div v-if="true"
           :style='{"margin":"0 0 12px","background":"linear-gradient(135deg, #FF6B9D, #E85588)","-webkit-background-clip":"text","-webkit-text-fill-color":"transparent","backgroundClip":"text","textAlign":"center","display":"inline-block","fontSize":"36px","fontWeight":"bold","letterSpacing":"2px","textShadow":"none"}'>
        动漫产品销售系统
      </div>
      <div>
        <div v-if="true" :style='{"color":"#666","fontSize":"14px","display":"inline-block"}'></div>
        <div v-if="Token" :style='{"color":"#FF6B9D","fontSize":"14px","display":"inline-block","fontWeight":"500"}'>{{ username }}</div>
        <el-button v-if="!Token" @click="toLogin()"
                   :style='{"border":"none","padding":"0 24px","boxShadow":"0 4px 15px rgba(255, 107, 157, 0.3)","margin":"0 0 12px","color":"#fff","borderRadius":"25px","background":"linear-gradient(135deg, #FF6B9D 0%, #FF8FB1 50%, #FFB8D0 100%)","display":"inline-block","fontSize":"14px","lineHeight":"36px","height":"36px","cursor":"pointer","transition":"all 0.3s ease"}'>
          登录/注册
        </el-button>
        <el-button v-if="Token" @click="logout"
                   :style='{"border":"2px solid #FF6B9D","padding":"0 24px","boxShadow":"none","margin":"0 0 0 10px","color":"#FF6B9D","borderRadius":"25px","background":"#fff","display":"inline-block","fontSize":"14px","lineHeight":"32px","height":"36px","cursor":"pointer","transition":"all 0.3s ease"}'>
          退出
        </el-button>
      </div>
    </div>


    <div class="body-containers"
         :style='"horizontal" == "vertical" ? {"minHeight":"100vh","padding":"64px 0 0","margin":"0 0 0 210px","position":"relative","background":"rgba(255, 107, 157, .1)","display":"block"} : {"minHeight":"100vh","padding":"0","margin":"0","position":"relative","background":"linear-gradient(180deg, #FFF0F5 0%, #FFFFFF 100%) fixed"}'>
      <div class="banner-preview" :style='{"width":"100%","margin":"0","height":"auto","position":"relative","overflow":"hidden"}'>
        <!-- 轮播图渐变遮罩 -->
        <div class="carousel-overlay-top"></div>
        <div class="carousel-overlay-bottom"></div>
        <el-carousel :style='{"width":"100%","margin":"0 auto"}' trigger="click" indicator-position="inside"
                     arrow="always" type="default" direction="horizontal" height="800px" :autoplay="true"
                     :interval="3000" :loop="true">
          <el-carousel-item :style='{"borderRadius":"0","width":"100%","height":"100%"}' v-for="item in carouselList"
                            :key="item.id">
            <el-image :style='{"objectFit":"cover","width":"100%","height":"100%","transition":"transform 0.5s ease"}' :src="item.value"
                      fit="cover"></el-image>
          </el-carousel-item>
        </el-carousel>
      </div>
      <div class="menu-preview"
           :style='{"padding":"0 20px","borderColor":"#FFB8D0","textAlign":"center","background":"linear-gradient(135deg, #FF6B9D 0%, #FF8FB1 50%, #FFB8D0 100%)","borderWidth":"0 0 0px 0","width":"100%","borderStyle":"solid","height":"auto","boxShadow":"0 4px 20px rgba(255, 107, 157, 0.3)","position":"relative","overflow":"hidden"}'>
        <!-- 粉色动态粒子背景 -->
        <div class="pink-particles"></div>
        <el-menu class="el-menu-horizontal-demo"
                 :style='{"border":0,"padding":"0","margin":"0 auto","borderColor":"#FF6B9D","alignItems":"center","display":"flex","justifyContent":"center","listStyle":"none","overflow":"hidden","flexWrap":"wrap","background":"none","borderWidth":"0px 1px 0px 0px","width":"100%","position":"relative","borderStyle":"solid","height":"55px"}'
                 :default-active="activeIndex" :unique-opened="true" mode="horizontal" :router="true"
                 @select="handleSelect">
          <el-image v-if="false"
                    :style='{"width":"44px","margin":"8px 10px 8px 0","objectFit":"cover","borderRadius":"100%","float":"left","height":"44px"}'
                    src="http://codegen.caihongy.cn/20201114/7856ba26477849ea828f481fa2773a95.jpg"
                    fit="cover"></el-image>
          <el-menu-item v-for="(menu, index) in menuList" :index="index + ''" :key="index" :route="menu.url" class="menu-item-animate">
            <i v-if="true"
               :style='{"padding":"0 10px","margin":"0","color":"inherit","width":"14px","lineHeight":"55px","fontSize":"16px","height":"55px","transition":"transform 0.3s ease"}'
               :class="iconArr[index]"></i>
            <span :style='{"padding":"0 10px","lineHeight":"55px","fontSize":"15px","color":"inherit","height":"55px","fontWeight":"500","transition":"transform 0.3s ease"}'>{{ menu.name }}</span>
          </el-menu-item>
          <el-menu-item :index="menuList.length + 1 + ''" @click="goMenu('/index/cart')" class="menu-item-animate">
            <i v-if="true"
               :style='{"padding":"0 10px","margin":"0","color":"inherit","width":"14px","lineHeight":"55px","fontSize":"16px","height":"55px","transition":"transform 0.3s ease"}'
               class="el-icon-shopping-cart-2"></i>
            <span :style='{"padding":"0 10px","lineHeight":"55px","fontSize":"15px","color":"inherit","height":"55px","fontWeight":"500","transition":"transform 0.3s ease"}'>购物车</span>
          </el-menu-item>
          <el-menu-item :index="menuList.length + 2 + ''" v-if="Token && notAdmin" @click="goMenu('/index/center')" class="menu-item-animate">
            <i v-if="true"
               :style='{"padding":"0 10px","margin":"0","color":"inherit","width":"14px","lineHeight":"55px","fontSize":"16px","height":"55px","transition":"transform 0.3s ease"}'
               class="el-icon-user"></i>
            <span :style='{"padding":"0 10px","lineHeight":"55px","fontSize":"15px","color":"inherit","height":"55px","fontWeight":"500","transition":"transform 0.3s ease"}'>个人中心</span>
          </el-menu-item>
        </el-menu>
      </div>
      <router-view></router-view>

      <div class="bottom-preview"
           :style='{"minHeight":"150px","padding":"30px 0","alignItems":"center","color":"#fff","background":"linear-gradient(135deg, #FF6B9D 0%, #FF8FB1 50%, #FFB8D0 100%)","flexDirection":"column","display":"flex","width":"100%","justifyContent":"center","boxShadow":"0 -2px 20px rgba(255, 107, 157, 0.15)"}'>
        <img :style='{"width":"44px","objectFit":"cover","borderRadius":"100%","display":"none","height":"44px"}'
             src="http://codegen.caihongy.cn/20201114/7856ba26477849ea828f481fa2773a95.jpg">
        <div :style='{"margin":"0","fontSize":"14px","lineHeight":"28px","color":"#fff"}'></div>
        <div :style='{"margin":"10px 0 0","fontSize":"14px","lineHeight":"28px","color":"#fff"}'></div>
        <div :style='{"margin":"10px 0 0","fontSize":"14px","lineHeight":"28px","color":"#fff"}'></div>
      </div>
    </div>
  </div>
</template>

<script>
import Vue from 'vue'

export default {
  data() {
    return {
      activeIndex: '0',
      roleMenus: [{
        "backMenu": [{
          "child": [{
            "appFrontIcon": "cuIcon-vip",
            "buttons": ["新增", "查看", "修改", "删除"],
            "menu": "会员",
            "menuJump": "列表",
            "tableName": "yonghu"
          }], "menu": "会员管理"
        }, {
          "child": [{
            "appFrontIcon": "cuIcon-shop",
            "buttons": ["新增", "查看", "修改", "删除"],
            "menu": "产品类别",
            "menuJump": "列表",
            "tableName": "chanpinleibie"
          }], "menu": "产品类别管理"
        }, {
          "child": [{
            "appFrontIcon": "cuIcon-link",
            "buttons": ["新增", "查看", "修改", "删除", "查看评论"],
            "menu": "动漫产品",
            "menuJump": "列表",
            "tableName": "dianzichanpin"
          }], "menu": "动漫产品管理"
        }, {
          "child": [{
            "appFrontIcon": "cuIcon-camera",
            "buttons": ["删除", "审核", "查看"],
            "menu": "售后申请",
            "menuJump": "列表",
            "tableName": "shouhoushenqing"
          }], "menu": "售后申请管理"
        }, {
          "child": [{
            "appFrontIcon": "cuIcon-circle",
            "buttons": ["查看", "修改", "回复", "删除"],
            "menu": "留言板管理",
            "tableName": "messages"
          }], "menu": "留言板管理"
        }, {
          "child": [{
            "appFrontIcon": "cuIcon-phone",
            "buttons": ["新增", "查看", "修改", "删除"],
            "menu": "轮播图管理",
            "tableName": "config"
          }, {
            "appFrontIcon": "cuIcon-rank",
            "buttons": ["查看", "修改"],
            "menu": "关于我们",
            "tableName": "aboutus"
          }, {
            "appFrontIcon": "cuIcon-news",
            "buttons": ["新增", "查看", "修改", "删除"],
            "menu": "通知公告",
            "tableName": "news"
          }, {
            "appFrontIcon": "cuIcon-taxi",
            "buttons": ["查看", "修改"],
            "menu": "系统简介",
            "tableName": "systemintro"
          }, {
            "appFrontIcon": "cuIcon-service",
            "buttons": ["新增", "查看", "修改", "删除"],
            "menu": "在线客服",
            "tableName": "chat"
          }], "menu": "系统管理"
        }, {
          "child": [{
            "appFrontIcon": "cuIcon-addressbook",
            "buttons": ["查看", "删除"],
            "menu": "已发货订单",
            "tableName": "orders/已发货"
          }, {
            "appFrontIcon": "cuIcon-present",
            "buttons": ["查看", "删除", "发货"],
            "menu": "已支付订单",
            "tableName": "orders/已支付"
          }, {
            "appFrontIcon": "cuIcon-newshot",
            "buttons": ["查看", "删除", "日销量", "月销量", "年销量", "品销量", "日销额", "月销额", "年销额", "品销额"],
            "menu": "已完成订单",
            "tableName": "orders/已完成"
          }, {
            "appFrontIcon": "cuIcon-attentionfavor",
            "buttons": ["查看", "删除"],
            "menu": "已取消订单",
            "tableName": "orders/已取消"
          }, {
            "appFrontIcon": "cuIcon-pay",
            "buttons": ["查看", "删除"],
            "menu": "已退款订单",
            "tableName": "orders/已退款"
          }, {
            "appFrontIcon": "cuIcon-attentionfavor",
            "buttons": ["查看", "删除"],
            "menu": "未支付订单",
            "tableName": "orders/未支付"
          }], "menu": "订单管理"
        }],
        "frontMenu": [{
          "child": [{
            "appFrontIcon": "cuIcon-similar",
            "buttons": ["查看"],
            "menu": "电子产品列表",
            "menuJump": "列表",
            "tableName": "dianzichanpin"
          }], "menu": "电子产品模块"
        }],
        "hasBackLogin": "是",
        "hasBackRegister": "否",
        "hasFrontLogin": "否",
        "hasFrontRegister": "否",
        "roleName": "管理员",
        "tableName": "users"
      }, {
        "backMenu": [{
          "child": [{
            "appFrontIcon": "cuIcon-camera",
            "buttons": ["新增", "查看", "修改", "删除"],
            "menu": "售后申请",
            "menuJump": "列表",
            "tableName": "shouhoushenqing"
          }], "menu": "售后申请管理"
        }],
        "frontMenu": [{
          "child": [{
            "appFrontIcon": "cuIcon-similar",
            "buttons": ["查看"],
            "menu": "电子产品列表",
            "menuJump": "列表",
            "tableName": "dianzichanpin"
          }], "menu": "电子产品模块"
        }],
        "hasBackLogin": "是",
        "hasBackRegister": "否",
        "hasFrontLogin": "是",
        "hasFrontRegister": "是",
        "roleName": "会员",
        "tableName": "yonghu"
      }],
      carouselList: [],
      menuList: [],
      chatFormVisible: false,
      chatList: [],
      form: {
        ask: '',
        userid: localStorage.getItem('userid')
      },
      Token: localStorage.getItem('Token'),
      username: localStorage.getItem('username'),
      notAdmin: localStorage.getItem('sessionTable') != '"users"',
      timer: '',
      iconArr: [
        'el-icon-star-off',
        'el-icon-goods',
        'el-icon-warning',
        'el-icon-question',
        'el-icon-info',
        'el-icon-help',
        'el-icon-picture-outline-round',
        'el-icon-camera-solid',
        'el-icon-video-camera-solid',
        'el-icon-video-camera',
        'el-icon-bell',
        'el-icon-s-cooperation',
        'el-icon-s-order',
        'el-icon-s-platform',
        'el-icon-s-operation',
        'el-icon-s-promotion',
        'el-icon-s-release',
        'el-icon-s-ticket',
        'el-icon-s-management',
        'el-icon-s-open',
        'el-icon-s-shop',
        'el-icon-s-marketing',
        'el-icon-s-flag',
        'el-icon-s-comment',
        'el-icon-s-finance',
        'el-icon-s-claim',
        'el-icon-s-opportunity',
        'el-icon-s-data',
        'el-icon-s-check'
      ],
    }
  },
  created() {
    this.menuList = this.$config.indexNav;
    this.getCarousel();
    if (localStorage.getItem('Token') && localStorage.getItem('Token') != null) {
      this.saveChathelper('主人，我是您的智能助手小搏，请问有什么可以帮您！');
      this.getChatList();
    }
  },
  mounted() {
    this.activeIndex = localStorage.getItem('keyPath') || '0';
  },
  watch: {
    $route(newValue) {
      let that = this
      let url = window.location.href
      let arr = url.split('#')
      for (let x in this.menuList) {
        if (newValue.path == this.menuList[x].url) {
          this.activeIndex = x
        }
      }
      this.Token = localStorage.getItem('Token')
    },
  },
  methods: {
    handleSelect(keyPath) {
      if (keyPath) {
        localStorage.setItem('keyPath', keyPath)
      }
    },
    toLogin() {
      this.$router.push('/login');
    },
    logout() {
      localStorage.clear();
      Vue.http.headers.common['Token'] = "";
      this.$router.push('/index/home');
      this.activeIndex = '0'
      localStorage.setItem('keyPath', this.activeIndex)
      this.Token = ''
      this.$forceUpdate()
      this.$message({
        message: '登出成功',
        type: 'success',
        duration: 1000,
      });
    },
    getCarousel() {
      this.carouselList = [
        {id: "local1", value: "/02.jpg"},
        {id: "local2", value: "/EVA明日香1.png"},
        {id: "local3", value: "/蕾姆.png"}
      ];
    },
    goBackend() {
      window.open(`${this.$config.baseUrl}admin/dist/index.html`, "_blank");
    },
    getChatList() {
      this.$http.get('chat/list', {
        params: {
          userid: localStorage.getItem('userid'),
          sort: 'addtime',
          order: 'asc',
          limit: 1000
        }
      }).then(res => {
        if (res.data.code == 0) {
          this.chatList = res.data.data.list;
          let div = document.getElementsByClassName('chat-content')[0]
          setTimeout(() => {
            if (div)
              div.scrollTop = div.scrollHeight
          }, 0)
        }
      });
    },
    addChat() {
      this.$http.post('chat/add', this.form).then(res => {
        if (res.data.code == 0) {
          this.form.ask = '';
          this.getChatList();
        }
      });
    },
    chatClose() {
      clearInterval(this.timer);
      this.chatFormVisible = false;
    },
    goChat() {
      if (!localStorage.getItem('Token')) {
        this.toLogin();
        return;
      }
      this.chatFormVisible = true;
      this.timer = setInterval(this.getChatList, 2000);
    },
    goMenu(path) {
      if (!localStorage.getItem('Token')) {
        this.toLogin();
      } else {
        this.$router.push(path);
      }
    },
  }
}
</script>

<style rel="stylesheet/scss" lang="scss" scoped>
/* 粉色动态粒子效果 */
.pink-particles {
  position: absolute;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  background-image: 
    radial-gradient(circle at 20% 50%, rgba(255, 184, 208, 0.4) 0%, transparent 50%),
    radial-gradient(circle at 80% 20%, rgba(255, 107, 157, 0.3) 0%, transparent 40%),
    radial-gradient(circle at 40% 80%, rgba(255, 214, 229, 0.5) 0%, transparent 45%);
  animation: particleFloat 8s ease-in-out infinite;
  pointer-events: none;
  z-index: 0;
}

@keyframes particleFloat {
  0%, 100% {
    background-position: 0% 50%;
    opacity: 0.6;
  }
  25% {
    background-position: 50% 0%;
    opacity: 0.8;
  }
  50% {
    background-position: 100% 50%;
    opacity: 0.7;
  }
  75% {
    background-position: 50% 100%;
    opacity: 0.9;
  }
}

/* 轮播图遮罩效果 */
.carousel-overlay-top {
  position: absolute;
  top: 0;
  left: 0;
  right: 0;
  height: 80px;
  background: linear-gradient(to bottom, rgba(255, 107, 157, 0.3), transparent);
  z-index: 1;
  pointer-events: none;
  animation: shimmerTop 4s ease-in-out infinite;
}

.carousel-overlay-bottom {
  position: absolute;
  bottom: 0;
  left: 0;
  right: 0;
  height: 100px;
  background: linear-gradient(to top, rgba(255, 107, 157, 0.4), transparent);
  z-index: 1;
  pointer-events: none;
  animation: shimmerBottom 4s ease-in-out infinite;
}

@keyframes shimmerTop {
  0%, 100% { opacity: 0.6; }
  50% { opacity: 1; }
}

@keyframes shimmerBottom {
  0%, 100% { opacity: 0.8; }
  50% { opacity: 1; }
}

.menu-preview {
  .el-scrollbar {
    height: 100%;

    & ::v-deep .scrollbar-wrapper {
      overflow-x: hidden;
    }
  }
}

/* 菜单项动画效果 */
.menu-item-animate {
  animation: menuItemAppear 0.5s ease-out forwards;
  opacity: 0;
  transform: translateY(-20px);
}

.menu-item-animate:nth-child(1) { animation-delay: 0.1s; }
.menu-item-animate:nth-child(2) { animation-delay: 0.15s; }
.menu-item-animate:nth-child(3) { animation-delay: 0.2s; }
.menu-item-animate:nth-child(4) { animation-delay: 0.25s; }
.menu-item-animate:nth-child(5) { animation-delay: 0.3s; }
.menu-item-animate:nth-child(6) { animation-delay: 0.35s; }
.menu-item-animate:nth-child(7) { animation-delay: 0.4s; }
.menu-item-animate:nth-child(8) { animation-delay: 0.45s; }
.menu-item-animate:nth-child(9) { animation-delay: 0.5s; }
.menu-item-animate:nth-child(10) { animation-delay: 0.55s; }

@keyframes menuItemAppear {
  0% {
    opacity: 0;
    transform: translateY(-20px);
  }
  100% {
    opacity: 1;
    transform: translateY(0);
  }
}

.menu-preview .el-menu-horizontal-demo .el-menu-item {
  cursor: pointer;
  padding: 0 15px;
  color: #fff;
  white-space: nowrap;
  display: block;
  font-size: 15px;
  border-color: transparent;
  line-height: 55px;
  background: none;
  width: auto;
  min-width: 100px;
  border-width: 0px;
  position: relative;
  border-style: solid;
  list-style: none;
  height: 55px;
  transition: all 0.4s cubic-bezier(0.25, 0.46, 0.45, 0.94);
  font-weight: 500;
  z-index: 1;
  overflow: hidden;
}

.menu-preview .el-menu-horizontal-demo .el-menu-item::before {
  content: '';
  position: absolute;
  bottom: 0;
  left: 50%;
  width: 0;
  height: 3px;
  background: linear-gradient(90deg, #fff, #FFD6E5);
  transition: all 0.4s ease;
  transform: translateX(-50%);
  border-radius: 2px;
}

.menu-preview .el-menu-horizontal-demo .el-menu-item::after {
  content: '';
  position: absolute;
  top: 50%;
  left: 50%;
  width: 0;
  height: 0;
  background: rgba(255, 255, 255, 0.15);
  border-radius: 50%;
  transition: all 0.5s ease;
  transform: translate(-50%, -50%);
}

.menu-preview .el-menu-horizontal-demo .el-menu-item:hover {
  cursor: pointer;
  padding: 0 15px;
  color: #fff;
  white-space: nowrap;
  font-size: 15px;
  border-color: transparent;
  line-height: 55px;
  background: linear-gradient(135deg, rgba(255, 255, 255, 0.25), rgba(255, 184, 208, 0.4));
  width: auto;
  min-width: 100px;
  border-width: 0px;
  position: relative;
  border-style: solid;
  list-style: none;
  height: 55px;
  transform: translateY(-3px);
  box-shadow: 0 6px 20px rgba(255, 107, 157, 0.4);
  text-shadow: 0 0 10px rgba(255, 255, 255, 0.5);
}

.menu-preview .el-menu-horizontal-demo .el-menu-item:hover::before {
  width: 60%;
}

.menu-preview .el-menu-horizontal-demo .el-menu-item:hover::after {
  width: 200%;
  height: 200%;
  opacity: 0;
}

.menu-preview .el-menu-horizontal-demo .el-menu-item:hover i {
  transform: scale(1.2) rotate(5deg);
}

.menu-preview .el-menu-horizontal-demo .el-menu-item:hover span {
  transform: translateX(2px);
}

.menu-preview .el-menu-horizontal-demo .el-menu-item.is-active {
  cursor: pointer;
  padding: 0 15px;
  color: #fff;
  white-space: nowrap;
  font-size: 15px;
  border-color: transparent;
  line-height: 55px;
  background: linear-gradient(135deg, rgba(255, 255, 255, 0.3), rgba(255, 184, 208, 0.5));
  width: auto;
  min-width: 100px;
  border-width: 0px;
  position: relative;
  border-style: solid;
  list-style: none;
  height: 55px;
  font-weight: 600;
  box-shadow: 0 4px 15px rgba(255, 107, 157, 0.3);
}

.menu-preview .el-menu-horizontal-demo .el-menu-item.is-active::before {
  width: 80%;
  background: linear-gradient(90deg, #fff, #FF6B9D);
}

.banner-preview {
  .el-carousel ::v-deep .el-carousel__indicator button {
    width: 0;
    height: 0;
    display: none;
  }
}

.banner-preview .el-carousel ::v-deep .el-carousel__container .el-carousel__arrow--left {
  width: 50px;
  font-size: 18px;
  height: 50px;
  background: linear-gradient(135deg, #FF6B9D, #FF8FB1);
  border-radius: 50%;
  box-shadow: 0 4px 15px rgba(255, 107, 157, 0.5);
  transition: all 0.3s ease;
  animation: arrowPulse 2s ease-in-out infinite;
}

.banner-preview .el-carousel ::v-deep .el-carousel__container .el-carousel__arrow--left:hover {
  background: linear-gradient(135deg, #FF8FB1, #FFB8D0);
  transform: scale(1.1);
  box-shadow: 0 6px 25px rgba(255, 107, 157, 0.7);
}

.banner-preview .el-carousel ::v-deep .el-carousel__container .el-carousel__arrow--right {
  width: 50px;
  font-size: 18px;
  height: 50px;
  background: linear-gradient(135deg, #FF6B9D, #FF8FB1);
  border-radius: 50%;
  box-shadow: 0 4px 15px rgba(255, 107, 157, 0.5);
  transition: all 0.3s ease;
  animation: arrowPulse 2s ease-in-out infinite 1s;
}

.banner-preview .el-carousel ::v-deep .el-carousel__container .el-carousel__arrow--right:hover {
  background: linear-gradient(135deg, #FF8FB1, #FFB8D0);
  transform: scale(1.1);
  box-shadow: 0 6px 25px rgba(255, 107, 157, 0.7);
}

@keyframes arrowPulse {
  0%, 100% {
    box-shadow: 0 4px 15px rgba(255, 107, 157, 0.5);
  }
  50% {
    box-shadow: 0 4px 25px rgba(255, 107, 157, 0.8);
  }
}

.banner-preview .el-carousel ::v-deep .el-carousel__indicators {
  padding: 0;
  margin: 0 0 20px 0;
  z-index: 2;
  position: absolute;
  list-style: none;
}

.banner-preview .el-carousel ::v-deep .el-carousel__indicators li {
  border-radius: 50%;
  padding: 0;
  margin: 0 8px;
  background: linear-gradient(135deg, #FFB8D0, #FFD6E5);
  display: inline-block;
  width: 14px;
  opacity: 0.7;
  transition: all 0.4s cubic-bezier(0.25, 0.46, 0.45, 0.94);
  height: 14px;
  box-shadow: 0 2px 8px rgba(255, 107, 157, 0.3);
}

.banner-preview .el-carousel ::v-deep .el-carousel__indicators li:hover {
  border-radius: 50%;
  padding: 0;
  margin: 0 8px;
  background: linear-gradient(135deg, #FF6B9D, #FF8FB1);
  display: inline-block;
  width: 16px;
  opacity: 1;
  height: 16px;
  transform: scale(1.2);
  box-shadow: 0 4px 12px rgba(255, 107, 157, 0.5);
}

.banner-preview .el-carousel ::v-deep .el-carousel__indicators li.is-active {
  border-radius: 8px;
  padding: 0;
  margin: 0 8px;
  background: linear-gradient(135deg, #FF6B9D, #E85588);
  display: inline-block;
  width: 28px;
  opacity: 1;
  height: 14px;
  box-shadow: 0 4px 15px rgba(255, 107, 157, 0.6);
  animation: indicatorPulse 2s ease-in-out infinite;
}

@keyframes indicatorPulse {
  0%, 100% {
    box-shadow: 0 4px 15px rgba(255, 107, 157, 0.6);
  }
  50% {
    box-shadow: 0 4px 25px rgba(255, 107, 157, 0.9);
  }
}

.chat-content {
  .left-content {
    width: 100%;
    text-align: left;
  }

  .right-content {
    width: 100%;
    text-align: right;
  }
}
</style>