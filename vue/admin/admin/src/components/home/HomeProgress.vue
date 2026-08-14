<template>
  <div class="home-progress">
    <div class="title">月访问量</div>
    <div class="tip">同上期增长</div>
    <el-progress
      class="progress"
      :text-inside="true"
      :stroke-width="24"
      :percentage="20"
      status="success"
    ></el-progress>
    <div class="title">月会员量</div>
    <div class="tip">同上期增长</div>
    <el-progress
      class="progress"
      :text-inside="true"
      :stroke-width="24"
      :percentage="50"
      status="success"
    ></el-progress>
    <div class="title">月收入</div>
    <div class="tip">同上期减少</div>
    <el-progress
      class="progress"
      :text-inside="true"
      :stroke-width="24"
      :percentage="28"
      status="exception"
    ></el-progress>
  </div>
</template>
<script>
export default {};
</script>
<style lang="scss">
.home-progress {
  background: linear-gradient(135deg, #fff, #fff0f5);
  height: 400px;
  padding: 20px;
  border-radius: 12px;
  box-shadow: 0 2px 12px rgba(255,105,180,0.1);
  animation: fadeInUp 0.8s ease-out;

  .title {
    color: #C71585;
    font-weight: bold;
    font-size: 20px;
    margin-top: 10px;
  }
  .tip {
    color: #FFB6C1;
    font-size: 16px;
    margin-top: 10px;
  }
  .progress {
    margin-top: 10px;
    animation: slideIn 0.6s ease-out;
    .el-progress-bar__inner {
      background: linear-gradient(90deg, #FF69B4, #FF1493) !important;
    }
    .el-progress-bar__outer {
      background-color: #FFE4E1 !important;
    }
  }
}

@keyframes fadeInUp {
  from { opacity: 0; transform: translateY(20px); }
  to { opacity: 1; transform: translateY(0); }
}

@keyframes slideIn {
  from { opacity: 0; transform: translateX(-20px); }
  to { opacity: 1; transform: translateX(0); }
}
</style>
