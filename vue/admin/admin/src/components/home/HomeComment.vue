<template>
  <div class="home-comment">
    <div class="title">会员留言</div>
    <div class="comment-list">
      <div v-for="(item,index) in list"  v-bind:key="index" class="comment-item">
        <div class="user-content">
          <el-image
            class="avator"
            :src="item.avator"
          ></el-image>
          <span class="user">{{item.name}}</span>
        </div>
        <div class="comment">{{item.content}}</div>
        <div class="create-time">{{item.createTime}}</div>
      </div>
    </div>
  </div>
</template>
<script>
export default {
  data() {
    return {
      list: [
        {
          name: "MaskLin",
          avator: "https://fuss10.elemecdn.com/e/5d/4a731a90594a4af544c0c25941171jpeg.jpeg",
          content: "你以为只要长得漂亮就有男生喜欢？你以为只要有了钱漂亮妹子就自己贴上来了？你以为学霸就能找到好工作？我告诉你吧，这些都是真的！",
          createTime: "5月02日 00:00"
        },
        {
          name: "MaskLin",
          avator: "https://fuss10.elemecdn.com/e/5d/4a731a90594a4af544c0c25941171jpeg.jpeg",
          content: "作者太帅了",
          createTime: "5月04日 00:00"
        },
        {
          name: "MaskLin",
          avator: "https://fuss10.elemecdn.com/e/5d/4a731a90594a4af544c0c25941171jpeg.jpeg",
          content: "作者太帅了",
          createTime: "5月04日 00:00"
        },
        {
          name: "MaskLin",
          avator: "https://fuss10.elemecdn.com/e/5d/4a731a90594a4af544c0c25941171jpeg.jpeg",
          content: "作者太帅了",
          createTime: "5月04日 00:00"
        },
      ]
    };
  }
};
</script>
<style lang="scss" scoped>
.home-comment {
  background: linear-gradient(135deg, #fff, #fff0f5);
  border-radius: 12px;
  box-shadow: 0 2px 12px rgba(255,105,180,0.1);
  animation: fadeInUp 0.8s ease-out;

  .title {
    font-size: 18px;
    color: #C71585;
    font-weight: bold;
    padding: 15px;
    border-bottom: 2px solid #FFB6C1;
  }
  .comment-list {
    padding: 10px;
    .comment-item {
      padding: 15px;
      border-bottom: 1px solid rgba(255,182,193,0.3);
      transition: all 0.3s ease;
      border-radius: 8px;
      &:hover {
        background: rgba(255,240,245,0.8);
        transform: translateX(5px);
        box-shadow: 0 2px 8px rgba(255,105,180,0.1);
      }
      .user-content {
        display: flex;
        align-items: center;
        .user {
          font-size: 18px;
          color: #FF69B4;
          font-weight: bold;
          line-height: 50px;
          margin-left: 10px;
        }
        .avator {
          width: 50px;
          height: 50px;
          border-radius: 50%;
          border: 2px solid #FFB6C1;
        }
      }
      .comment {
        margin-top: 10px;
        font-size: 14px;
        color: #C71585;
      }
      .create-time {
        margin-top: 15px;
        font-size: 14px;
        color: #FFB6C1;
      }
    }
  }
}

@keyframes fadeInUp {
  from { opacity: 0; transform: translateY(20px); }
  to { opacity: 1; transform: translateY(0); }
}
</style>
