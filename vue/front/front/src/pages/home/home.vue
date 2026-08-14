<template>
  <div class="home-preview"
       :style='{"width":"1200px","margin":"20px auto 20px","flexWrap":"wrap","justifyContent":"space-between","display":"flex"}'>


    <div class="recommend"
         :style='{"border":"none","boxShadow":"0 8px 32px rgba(255, 107, 157, 0.15)","transition":"all 0.3s ease","margin":"20px 0 80px","overflow":"hidden","borderRadius":"16px","background":"#fff","width":"100%","height":"auto","order":"1"}'>
      <div v-if="false" class="idea recommendIdea"
           :style='{"padding":"20px","flexWrap":"wrap","background":"#efefef","justifyContent":"space-between","display":"flex"}'>
        <div class="box1" :style='{"width":"20%","background":"#fff","height":"80px"}'></div>
        <div class="box2" :style='{"width":"20%","background":"#fff","height":"80px"}'></div>
        <div class="box3" :style='{"width":"20%","background":"#fff","height":"80px"}'></div>
        <div class="box4" :style='{"width":"20%","background":"#fff","height":"80px"}'></div>
        <div class="box5" :style='{"width":"20%","background":"#fff","display":"none","height":"80px"}'></div>
        <div class="box6" :style='{"width":"20%","background":"#fff","display":"none","height":"80px"}'></div>
        <div class="box7" :style='{"width":"20%","background":"#fff","display":"none","height":"80px"}'></div>
        <div class="box8" :style='{"width":"20%","background":"#fff","display":"none","height":"80px"}'></div>
        <div class="box9" :style='{"width":"20%","background":"#fff","display":"none","height":"80px"}'></div>
        <div class="box10" :style='{"width":"20%","background":"#fff","display":"none","height":"80px"}'></div>
      </div>

      <div class="title"
           :style='{"width":"100%","margin":"24px 0 24px 0","lineHeight":"1.5","textAlign":"center","background":"url(http://codegen.caihongy.cn/20221027/fc985400d2a2484d8d9e17eb893d2c05.png) no-repeat 240px center,url(http://codegen.caihongy.cn/20221027/6602c4fb09df4bd4881cabfef19d2ed3.png) no-repeat 760px center"}'>
        <span
            :style='{"fontSize":"24px","color":"#FF6B9D","textShadow":"2px 4px 2px #eee","fontWeight":"bold"}'>动漫产品推荐</span>
      </div>


      <!-- 样式一 -->
      <div class="list list1 index-pv1"
           :style='{"width":"100%","padding":"0 10px","background":"#fff","height":"auto"}'>
        <div
            :style='{"margin":"10px","borderRadius":"8px","background":"none","display":"inline-block","width":"274px","position":"relative","height":"auto"}'
            v-for="(item,index) in dianzichanpinRecommend" :key="index" @click="toDetail('dianzichanpinDetail', item)"
            class="list-item animation-box">
          <img
              :style='{"cursor":"pointer","boxShadow":"1px 1px 1px #ddd","objectFit":"cover","borderRadius":"8px","display":"block","width":"274px","height":"274px"}'
              v-if="preHttp(item.fengmian)" :src="item.fengmian.split(',')[0]" alt=""/>
          <img
              :style='{"cursor":"pointer","boxShadow":"1px 1px 1px #ddd","objectFit":"cover","borderRadius":"8px","display":"block","width":"274px","height":"274px"}'
              v-else :src="baseUrl + (item.fengmian?item.fengmian.split(',')[0]:'')" alt=""/>
          <div class="name line1"
               :style='{"cursor":"pointer","padding":"4px 10px","boxShadow":"1px 1px 1px #ddd","margin":"4px 0 0 0","whiteSpace":"nowrap","overflow":"hidden","color":"#333","borderRadius":"8px","background":"linear-gradient(135deg, #FFF0F5, #FFFFFF)","lineHeight":"24px","fontSize":"14px","textOverflow":"ellipsis"}'>
            {{ item.chanpinmingcheng }}
          </div>
          <div class="name line1"
               :style='{"cursor":"pointer","padding":"4px 10px","boxShadow":"1px 1px 1px #ddd","margin":"4px 0 0 0","whiteSpace":"nowrap","overflow":"hidden","color":"#333","borderRadius":"8px","background":"linear-gradient(135deg, #FFF0F5, #FFFFFF)","lineHeight":"24px","fontSize":"14px","textOverflow":"ellipsis"}'>
            {{ item.chanpinleibie }}
          </div>
          <div class="name line1"
               :style='{"cursor":"pointer","padding":"4px 10px","boxShadow":"1px 1px 1px #ddd","margin":"4px 0 0 0","whiteSpace":"nowrap","overflow":"hidden","color":"#333","borderRadius":"8px","background":"linear-gradient(135deg, #FFF0F5, #FFFFFF)","lineHeight":"24px","fontSize":"14px","textOverflow":"ellipsis"}'>
            品牌:{{ item.pinpai }}
          </div>
        </div>
      </div>


      <div @click="moreBtn('dianzichanpin')"
           :style='{"border":"1px solid #FFB8D0","cursor":"pointer","boxShadow":"0px 4px 1px #FFE4EC,inset 0px 0px 56px 0px #FFD6E5","margin":"20px auto","borderRadius":"30%","textAlign":"center","left":"47%","background":"#ffffff","display":"block","width":"120px","lineHeight":"36px","position":"absolute"}'>
        <span :style='{"color":"#FF6B9D","fontSize":"14px"}'>查看更多</span>
        <i v-if="true" :style='{"color":"#FF6B9D","fontSize":"14px"}' class="el-icon-d-arrow-right"></i>
      </div>

    </div>
  </div>
</template>

<script>
export default {
  //数据集合
  data() {
    return {
      baseUrl: '',
      aboutUsDetail: {},
      systemIntroductionDetail: {},
      newsList: [],
      dianzichanpinRecommend: [],

    }
  },
  created() {
    this.baseUrl = this.$config.baseUrl;
    this.getNewsList();
    this.getAboutUs();
    this.getSystemIntroduction();
    this.getList();
  },
  //方法集合
  methods: {
    preHttp(str) {
      return str && str.substr(0, 4) == 'http';
    },
    getAboutUs() {
      this.$http.get('aboutus/detail/1', {}).then(res => {
        if (res.data.code == 0) {
          this.aboutUsDetail = res.data.data;
        }
      })
    },
    getSystemIntroduction() {
      this.$http.get('systemintro/detail/1', {}).then(res => {
        if (res.data.code == 0) {
          this.systemIntroductionDetail = res.data.data;
        }
      })
    },
    getNewsList() {
      this.$http.get('news/list', {
        params: {
          page: 1,
          limit: 6,
          order: 'desc'
        }
      }).then(res => {
        if (res.data.code == 0) {
          this.newsList = res.data.data.list;


        }
      });
    },
    getList() {
      let autoSortUrl = "";
      autoSortUrl = "dianzichanpin/autoSort";
      if (localStorage.getItem('Token')) {
        autoSortUrl = "dianzichanpin/autoSort2";
      }
      this.$http.get(autoSortUrl, {
        params: {
          page: 1,
          limit: 8,
        }
      }).then(res => {
        if (res.data.code == 0) {
          this.dianzichanpinRecommend = res.data.data.list;


          // 商品列表样式五

        }
      });

    },
    toDetail(path, item) {
      this.$router.push({path: '/index/' + path, query: {detailObj: JSON.stringify(item)}});
    },
    moreBtn(path) {
      this.$router.push({path: '/index/' + path});
    }
  }
}
</script>

<style rel="stylesheet/scss" lang="scss" scoped>
.home-preview {

  .recommend {
    .list3 .swiper-button-prev {
      left: 10px;
      right: auto;
    }

    .list3 .swiper-button-prev::after {
      color: rgb(64, 158, 255);
    }

    .list3 .swiper-button-next {
      left: auto;
      right: 10px;
    }

    .list3 .swiper-button-next::after {
      color: rgb(64, 158, 255);
    }

    .list5 .swiper-button-prev {
      left: 10px;
      right: auto;
    }

    .list5 .swiper-button-prev::after {
      color: rgb(64, 158, 255);
    }

    .list5 .swiper-button-next {
      left: auto;
      right: 10px;
    }

    .list5 .swiper-button-next::after {
      color: rgb(64, 158, 255);
    }

    .list5 {
      .swiper-slide-prev {
        position: relative;
        z-index: 3;
      }

      .swiper-slide-next {
        position: relative;
        z-index: 3;
      }

      .swiper-slide-active {
        position: relative;
        z-index: 5;
      }
    }

    .index-pv1 .animation-box {
      transform: rotate(0deg) scale(1) skew(0deg, 0deg) translate3d(0px, 0px, 0px);
      z-index: initial;
    }

    .index-pv1 .animation-box:hover {
      -webkit-perspective: 1000px;
      perspective: 1000px;
      transition: 0.3s;
      z-index: 1;
    }

    .index-pv1 .animation-box img {
      transform: rotate(0deg) scale(1) skew(0deg, 0deg) translate3d(0px, 0px, 0px);
    }

    .index-pv1 .animation-box img:hover {
      -webkit-perspective: 1000px;
      perspective: 1000px;
      transition: 0.3s;
    }
  }

  .news {
    .list3 .swiper-button-prev {
      left: 10px;
      right: auto;
    }

    .list3 .swiper-button-prev::after {
      color: rgb(64, 158, 255);
    }

    .list3 .swiper-button-next {
      left: auto;
      right: 10px;
    }

    .list3 .swiper-button-next::after {
      color: rgb(64, 158, 255);
    }

    .list6 .swiper-button-prev {
      left: 10px;
      right: auto;
    }

    .list6 .swiper-button-prev::after {
      color: rgb(64, 158, 255);
    }

    .list6 .swiper-button-next {
      left: auto;
      right: 10px;
    }

    .list6 .swiper-button-next::after {
      color: rgb(64, 158, 255);
    }

    .index-pv1 .animation-box {
      transform: rotate(0deg) scale(1) skew(0deg, 0deg) translate3d(0px, 0px, 0px);
      z-index: initial;
    }

    .index-pv1 .animation-box:hover {
      -webkit-perspective: 1000px;
      perspective: 1000px;
      transition: 0.3s;
      z-index: 1;
    }

    .index-pv1 .animation-box img {
      transform: rotate(0deg) scale(1) skew(0deg, 0deg) translate3d(0px, 0px, 0px);
    }

    .index-pv1 .animation-box img:hover {
      -webkit-perspective: 1000px;
      perspective: 1000px;
      transition: 0.3s;
    }
  }

  .lists {
    .list3 .swiper-button-prev {
      left: 10px;
      right: auto;
    }

    .list3 .swiper-button-prev::after {
      color: rgb(64, 158, 255);
    }

    .list3 .swiper-button-next {
      left: auto;
      right: 10px;
    }

    .list3 .swiper-button-next::after {
      color: rgb(64, 158, 255);
    }

    .list5 .swiper-button-prev {
      left: 10px;
      right: auto;
    }

    .list5 .swiper-button-prev::after {
      color: rgb(64, 158, 255);
    }

    .list5 .swiper-button-next {
      left: auto;
      right: 10px;
    }

    .list5 .swiper-button-next::after {
      color: rgb(64, 158, 255);
    }

    .list5 {
      .swiper-slide-prev {
        position: relative;
        z-index: 3;
      }

      .swiper-slide-next {
        position: relative;
        z-index: 3;
      }

      .swiper-slide-active {
        position: relative;
        z-index: 5;
      }
    }

    .index-pv1 .animation-box {
      transform: rotate(0deg) scale(1) skew(0deg, 0deg) translate3d(0px, 0px, 0px);
      z-index: initial;
    }

    .index-pv1 .animation-box:hover {
      -webkit-perspective: 1000px;
      perspective: 1000px;
      transition: 0.3s;
      z-index: 1;
    }

    .index-pv1 .animation-box img {
      transform: rotate(0deg) scale(1) skew(0deg, 0deg) translate3d(0px, 0px, 0px);
    }

    .index-pv1 .animation-box img:hover {
      -webkit-perspective: 1000px;
      perspective: 1000px;
      transition: 0.3s;
    }
  }
}
</style>



