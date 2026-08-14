<template>
  <router-view></router-view>
</template>

<script>
export default {
  name: 'App'
}
</script>

<style>
  * {
    box-sizing: border-box;
  }
  html, body{
    width: 100%;
    height: 100%;
    margin: 0;
    padding: 0;
    font-family: 'PingFang SC', 'Microsoft YaHei', 'Helvetica Neue', Arial, sans-serif;
  }
  [v-cloak]{
    display:none
  }
  
  /* Element UI 全局粉色主题 */
  .el-tabs__item {
    font-size: 16px;
    color: #666;
    transition: all 0.3s ease;
  }
  .el-tabs__item:hover {
    color: #FF6B9D;
  }
  .el-tabs__item.is-active {
    color: #FF6B9D;
    font-weight: 600;
  }
  .el-tabs__active-bar {
    background: linear-gradient(90deg, #FF6B9D, #FFB8D0);
    height: 3px;
    border-radius: 2px;
  }
  
  .el-loading-spinner .el-loading-text {
    color: #FF6B9D;
  }
  .el-loading-spinner .path {
    stroke: #FF6B9D;
  }
  
  .el-breadcrumb {
    line-height: 60px;
    font-size: 16px;
  }
  .el-breadcrumb__inner {
    color: #666;
  }
  .el-breadcrumb__inner:hover {
    color: #FF6B9D;
  }
  
  /* 消息提示粉色主题 */
  .el-message--success {
    border-color: #FFB8D0;
    background: linear-gradient(135deg, #FFF0F5, #FFFFFF);
  }
  .el-message--success .el-message__content {
    color: #FF6B9D;
  }
  
  /* 分页器粉色主题 */
  .el-pagination.is-background .el-pager li:not(.disabled).active {
    background: linear-gradient(135deg, #FF6B9D, #FFB8D0);
    color: #fff;
    border-radius: 20px;
  }
  .el-pagination.is-background .el-pager li {
    border-radius: 20px;
    margin: 0 3px;
    transition: all 0.3s ease;
  }
  .el-pagination.is-background .el-pager li:hover {
    color: #FF6B9D;
  }
  
  /* 对话框粉色主题 */
  .el-dialog__header {
    background: linear-gradient(135deg, #FF6B9D 0%, #FFB8D0 100%);
    padding: 20px;
    border-radius: 16px 16px 0 0;
  }
  .el-dialog__title {
    color: #fff;
    font-size: 18px;
    font-weight: 600;
  }
  .el-dialog__headerbtn .el-dialog__close {
    color: #fff;
  }
  .el-dialog {
    border-radius: 16px;
    overflow: hidden;
    box-shadow: 0 10px 40px rgba(255, 107, 157, 0.2);
  }
  
  /* 表格粉色主题 */
  .el-table th {
    background: linear-gradient(135deg, #FFF0F5, #FFD6E5) !important;
    color: #333;
    font-weight: 600;
  }
  .el-table--striped .el-table__body tr.el-table__row--striped td {
    background: #FFF8FA;
  }
  .el-table__row:hover > td {
    background: #FFF0F5 !important;
  }
  
  /* 表单验证粉色主题 */
  .el-form-item__error {
    color: #FF6B9D;
  }
  .el-form-item.is-error .el-input__inner,
  .el-form-item.is-error .el-textarea__inner {
    border-color: #FF6B9D;
  }
  
  /* 标签粉色主题 */
  .el-tag--light {
    background: #FFF0F5;
    border-color: #FFB8D0;
    color: #FF6B9D;
  }
  
  /* 选择器粉色主题 */
  .el-select .el-input.is-focus .el-input__inner {
    border-color: #FF6B9D;
  }
  .el-select-dropdown__item.selected {
    color: #FF6B9D;
    font-weight: 600;
  }
  
  /* 按钮全局粉色主题 */
  .el-button--default:hover {
    color: #FF6B9D;
    border-color: #FFB8D0;
    background: #FFF0F5;
  }
  
  .ql-editor {
    min-height: 200px;
  }
  .ql-snow .ql-tooltip[data-mode="link"]::before {
    content: "请输入链接地址:";
  }
  .ql-snow .ql-tooltip.ql-editing a.ql-action::after {
    border-right: 0px;
    content: "保存";
    padding-right: 0px;
  }
  .ql-snow .ql-tooltip[data-mode="video"]::before {
    content: "请输入视频地址:";
  }
  .ql-snow .ql-picker.ql-size .ql-picker-label::before,
  .ql-snow .ql-picker.ql-size .ql-picker-item::before {
    content: "14px";
  }
  .ql-snow .ql-picker.ql-size .ql-picker-label[data-value="small"]::before,
  .ql-snow .ql-picker.ql-size .ql-picker-item[data-value="small"]::before {
    content: "10px";
  }
  .ql-snow .ql-picker.ql-size .ql-picker-label[data-value="large"]::before,
  .ql-snow .ql-picker.ql-size .ql-picker-item[data-value="large"]::before {
    content: "18px";
  }
  .ql-snow .ql-picker.ql-size .ql-picker-label[data-value="huge"]::before,
  .ql-snow .ql-picker.ql-size .ql-picker-item[data-value="huge"]::before {
    content: "32px";
  }
  .ql-snow .ql-picker.ql-header .ql-picker-label::before,
  .ql-snow .ql-picker.ql-header .ql-picker-item::before {
    content: "文本";
  }
  .ql-snow .ql-picker.ql-header .ql-picker-label[data-value="1"]::before,
  .ql-snow .ql-picker.ql-header .ql-picker-item[data-value="1"]::before {
    content: "标题1";
  }
  .ql-snow .ql-picker.ql-header .ql-picker-label[data-value="2"]::before,
  .ql-snow .ql-picker.ql-header .ql-picker-item[data-value="2"]::before {
    content: "标题2";
  }
  .ql-snow .ql-picker.ql-header .ql-picker-label[data-value="3"]::before,
  .ql-snow .ql-picker.ql-header .ql-picker-item[data-value="3"]::before {
    content: "标题3";
  }
  .ql-snow .ql-picker.ql-header .ql-picker-label[data-value="4"]::before,
  .ql-snow .ql-picker.ql-header .ql-picker-item[data-value="4"]::before {
    content: "标题4";
  }
  .ql-snow .ql-picker.ql-header .ql-picker-label[data-value="5"]::before,
  .ql-snow .ql-picker.ql-header .ql-picker-item[data-value="5"]::before {
    content: "标题5";
  }
  .ql-snow .ql-picker.ql-header .ql-picker-label[data-value="6"]::before,
  .ql-snow .ql-picker.ql-header .ql-picker-item[data-value="6"]::before {
    content: "标题6";
  }
  .ql-snow .ql-picker.ql-font .ql-picker-label::before,
  .ql-snow .ql-picker.ql-font .ql-picker-item::before {
    content: "标准字体";
  }
  .ql-snow .ql-picker.ql-font .ql-picker-label[data-value="serif"]::before,
  .ql-snow .ql-picker.ql-font .ql-picker-item[data-value="serif"]::before {
    content: "衬线字体";
  }
  .ql-snow .ql-picker.ql-font .ql-picker-label[data-value="monospace"]::before,
  .ql-snow .ql-picker.ql-font .ql-picker-item[data-value="monospace"]::before {
    content: "等宽字体";
  }
</style>
