<template>
  <el-card class="box-card">
    <div slot="header" class="header">
      <span>{{title}}</span>
      <span>
        <el-tag size="small" :type="titleTag">{{titleUnit}}</el-tag>
      </span>
    </div>
    <div class="content">
      {{content}}&nbsp;&nbsp;
      <span class="unit">{{contentUnit}}</span>
    </div>
    <div class="bottom">
      <span>{{bottomTitle}}</span>
      <span>
        {{bottomContent}}
        <i :class="bottomIcon"></i>
      </span>
    </div>
  </el-card>
</template>
<script>
export default {
  props: [
    "title",
    "titleTag",
    "titleUnit",
    "content",
    "contentUnit",
    "bottomTitle",
    "bottomContent",
    "bottomIcon"
  ]
};
</script>
<style lang="scss" scoped>
.box-card {
  margin-right: 10px;
  border-radius: 12px;
  border: none;
  background: linear-gradient(135deg, #fff, #fff0f5);
  box-shadow: 0 2px 12px rgba(255,105,180,0.1);
  transition: all 0.3s cubic-bezier(0.25, 0.8, 0.25, 1);
  animation: fadeInUp 0.6s ease-out;

  &:hover {
    transform: translateY(-8px);
    box-shadow: 0 12px 28px rgba(255,105,180,0.25);
  }

  .header {
    display: flex;
    justify-content: space-between;
    align-items: center;
    color: #C71585;
    font-weight: bold;
  }
  .content {
    font-size: 30px;
    font-weight: bold;
    color: #FF69B4;
    text-align: center;
    .unit {
      font-size: 16px;
      color: #FFB6C1;
    }
  }
  .bottom {
    display: flex;
    justify-content: space-between;
    align-items: center;
    margin-top: 10px;
    color: #C71585;
  }
}

@keyframes fadeInUp {
  from {
    opacity: 0;
    transform: translateY(20px);
  }
  to {
    opacity: 1;
    transform: translateY(0);
  }
}
</style>
