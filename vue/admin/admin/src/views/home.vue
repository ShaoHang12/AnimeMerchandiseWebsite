<template>
  <div class="content" :style='{"padding":"30px 30px 30px 240px"}'>
    <div class="text"
         :style='{"margin":"50px auto","fontSize":"33px","color":"#FF69B4","textAlign":"center","fontWeight":"bold"}'>
      欢迎使用 {{ this.$project.projectName }}
    </div>
    <div class="decorative-line"></div>
    <div class="float-hearts">
      <span v-for="n in 6" :key="n" class="heart" :style="{ animationDelay: (n * 1.2) + 's', left: (n * 15 - 5) + '%' }">&#10084;</span>
    </div>
  </div>
</template>
<script>
import router from '@/router/router-static'
import * as echarts from 'echarts'

export default {
  data() {
    return {};
  },
  mounted() {
    this.init();
  },
  methods: {
    init() {
      if (this.$storage.get('Token')) {
        this.$http({
          url: `${this.$storage.get('sessionTable')}/session`,
          method: "get"
        }).then(({data}) => {
          if (data && data.code != 0) {
            router.push({name: 'login'})
          }
        });
      } else {
        router.push({name: 'login'})
      }
    },
  }
};
</script>
<style lang="scss" scoped>
.content {
  min-height: 100vh;
  background: linear-gradient(135deg, #fff0f5, #ffe4e1, #fff5f7, #ffeef8);
  background-size: 400% 400%;
  animation: gradientBG 15s ease infinite;
  position: relative;
  overflow: hidden;

  .text {
    animation: fadeInUp 1s ease-out;
    text-shadow: 0 2px 10px rgba(255,105,180,0.3);
  }

  .decorative-line {
    width: 80px;
    height: 3px;
    background: linear-gradient(90deg, #FF69B4, #FFB6C1, #FF69B4);
    margin: 0 auto 30px;
    border-radius: 2px;
    animation: expandLine 1.5s ease-out;
  }

  .float-hearts {
    position: fixed;
    bottom: 0;
    left: 0;
    width: 100%;
    height: 100%;
    pointer-events: none;
    z-index: 0;

    .heart {
      position: absolute;
      bottom: -50px;
      font-size: 20px;
      color: rgba(255,105,180,0.15);
      animation: floatUp 8s ease-in infinite;
    }
  }
}

.cardView {
  display: flex;
  flex-wrap: wrap;
  width: 100%;

  .cards {
    display: flex;
    align-items: center;
    width: 100%;
    margin-bottom: 10px;
    justify-content: center;

    .card {
      width: calc(25% - 20px);
      margin: 0 10px;

      ::v-deep .el-card__body {
        padding: 0;
      }
    }
  }
}

@keyframes gradientBG {
  0% { background-position: 0% 50%; }
  50% { background-position: 100% 50%; }
  100% { background-position: 0% 50%; }
}

@keyframes fadeInUp {
  from {
    opacity: 0;
    transform: translateY(30px);
  }
  to {
    opacity: 1;
    transform: translateY(0);
  }
}

@keyframes expandLine {
  from {
    width: 0;
    opacity: 0;
  }
  to {
    width: 80px;
    opacity: 1;
  }
}

@keyframes floatUp {
  0% {
    transform: translateY(0) rotate(0deg);
    opacity: 0;
  }
  10% {
    opacity: 0.6;
  }
  90% {
    opacity: 0.2;
  }
  100% {
    transform: translateY(-110vh) rotate(720deg);
    opacity: 0;
  }
}
</style>
