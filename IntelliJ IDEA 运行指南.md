# 使用 IntelliJ IDEA 运行项目（推荐）

## 为什么推荐使用 IntelliJ IDEA？

1. ✅ 已安装 JDK 25（IntelliJ IDEA 自带）
2. ✅ 自动管理 Maven 依赖
3. ✅ 无需手动下载 Maven Wrapper
4. ✅ 支持断点调试
5. ✅ 代码提示和自动补全

## 详细步骤

### 步骤1：打开项目

1. 启动 IntelliJ IDEA
2. 选择 "Open"
3. 导航到：D:\Study\Code\项目\动漫产品商城\动漫产品商城\anime_mall
4. 点击 "OK"
5. 等待 IDEA 导入项目（右下角会显示进度）

### 步骤2：配置数据库

1. 打开文件：src/main/resources/application-dev.yml
2. 修改第18行的密码：
   `yaml
   password: 你的MySQL密码
   `

### 步骤3：初始化数据库

1. 打开 MySQL 命令行或 Navicat
2. 执行 SQL 脚本：
   - 文件位置：anime_mall/anime_mall.sql
   - 或在命令行执行：mysql -u root -p < anime_mall/anime_mall.sql

### 步骤4：运行项目

#### 方法A：直接运行
1. 在左侧项目树中找到：src/main/java/com/SpringbootSchemaApplication.java
2. 右键点击该文件
3. 选择 "Run 'SpringbootSchemaApplication.main()'"

#### 方法B：使用运行配置
1. 点击顶部菜单：Run -> Edit Configurations
2. 点击 "+" -> Application
3. 配置：
   - Name: AnimeMall
   - Main class: com.SpringbootSchemaApplication
   - JRE: 选择 IntelliJ IDEA 自带的 JBR
4. 点击 "OK"
5. 点击绿色三角形按钮运行

### 步骤5：等待启动

启动成功后，会看到类似以下日志：
`
Started SpringbootSchemaApplication in x.xx seconds
Tomcat started on port(s): 8080
`

### 步骤6：访问系统

- 后端API：http://localhost:8080/anime_mall/
- 管理后台：http://localhost:8081（需要单独启动前端）
- 前台商城：http://localhost:8082（需要单独启动前端）

## 启动前端（可选）

如果需要完整的前后端分离体验：

### 启动管理后台
`ash
cd vue\admin\admin
npm install
npm run serve
`

### 启动前台商城
`ash
cd vue\front\front
npm install
npm run serve -- --port 8082
`

## 常见问题

### Q：IDEA 提示 "Cannot resolve symbol"
A：右键点击 pom.xml -> Maven -> Reimport

### Q：端口 8080 被占用
A：修改 application-dev.yml 中的 server.port

### Q：数据库连接失败
A：检查 application-dev.yml 中的数据库配置

## 默认账号

- 管理员：admin / admin123
- 测试用户：user1 / 123456
