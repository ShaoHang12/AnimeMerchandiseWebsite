# 动漫产品商城

一个基于Spring Boot + Vue.js的动漫产品电商平台，包含前台商城和后台管理系统。

## 项目结构

`
动漫产品商城/
├── anime_mall/                 # 后端Spring Boot项目
│   ├── src/
│   │   ├── main/
│   │   │   ├── java/com/      # Java源代码
│   │   │   ├── resources/     # 配置文件和静态资源
│   │   │   └── webapp/        # Web应用目录
│   │   └── test/              # 测试代码
│   ├── target/                # 构建输出目录
│   ├── pom.xml                # Maven配置文件
│   ├── mvnw.cmd               # Maven Wrapper脚本
│   └── anime_mall.sql         # 数据库初始化脚本
├── vue/
│   ├── admin/                 # 管理后台前端
│   │   └── admin/
│   │       ├── src/           # Vue源代码
│   │       ├── public/        # 静态资源
│   │       └── package.json   # 依赖配置
│   └── front/                 # 前台商城前端
│       └── front/
│           ├── src/           # Vue源代码
│           ├── public/        # 静态资源
│           └── package.json   # 依赖配置
├── 启动后端.bat                # 后端启动脚本
├── 启动管理后台.bat            # 管理后台启动脚本
├── 启动前台.bat                # 前台启动脚本
└── README.md                  # 项目说明文档
`

## 环境要求

- **Java**: JDK 21 或更高版本（已配置使用 IntelliJ IDEA JBR）
- **Node.js**: 14.x 或更高版本
- **MySQL**: 5.7 或更高版本
- **Maven**: 3.6 或更高版本（项目已包含Maven Wrapper）

## 快速开始

### 1. 数据库配置

1. 确保MySQL服务已启动
2. 修改数据库配置文件 nime_mall/src/main/resources/application-dev.yml
   - 修改 username 为你的MySQL用户名
   - 修改 password 为你的MySQL密码
3. 执行数据库初始化脚本：
   `ash
   mysql -u root -p < anime_mall/anime_mall.sql
   `

### 2. 启动后端服务

**方式一：使用启动脚本（推荐）**
双击运行 启动后端.bat

**方式二：手动启动**
`ash
cd anime_mall
set JAVA_HOME=你的JDK路径
mvnw.cmd clean package -DskipTests
java -jar target/anime_mall-0.0.1-SNAPSHOT.jar
`

后端服务将在 http://localhost:8080/anime_mall/ 启动

### 3. 启动管理后台

**方式一：使用启动脚本（推荐）**
双击运行 启动管理后台.bat

**方式二：手动启动**
`ash
cd vue/admin/admin
npm install
npm run serve
`

管理后台将在 http://localhost:8081 启动

### 4. 启动前台商城

**方式一：使用启动脚本（推荐）**
双击运行 启动前台.bat

**方式二：手动启动**
`ash
cd vue/front/front
npm install
npm run serve -- --port 8082
`

前台商城将在 http://localhost:8082 启动

## 默认账号

### 管理员账号
- 用户名: dmin
- 密码: dmin123

### 测试用户账号
- 账号: user1
- 密码: 123456

- 账号: user2
- 密码: 123456

## 功能特性

### 前台商城
- 用户注册/登录
- 商品浏览和搜索
- 商品详情查看
- 购物车管理
- 订单管理
- 收货地址管理
- 评论和留言
- 收藏功能
- 个人中心

### 管理后台
- 管理员登录
- 用户管理
- 商品管理（增删改查）
- 订单管理
- 评论管理
- 留言管理
- 新闻管理
- 数据统计

## 技术栈

### 后端
- Spring Boot 2.2.2
- MyBatis Plus 2.3
- MySQL 8.0
- Apache Shiro 1.3.2

### 前端
- Vue.js 2.6
- Element UI 2.13
- Vue Router 3.5
- Axios

## 常见问题

### 1. 数据库连接失败
检查 pplication-dev.yml 中的数据库配置是否正确，确保MySQL服务已启动。

### 2. Java版本不兼容
确保使用JDK 11或更高版本。

### 3. npm install失败
尝试使用淘宝镜像：
`ash
npm install --registry=https://registry.npmmirror.com
`

### 4. 端口被占用
修改对应的配置文件中的端口号：
- 后端：pplication-dev.yml 中的 server.port
- 管理后台：ue.config.js 中的 devServer.port
- 前台：ue.config.js 中的 devServer.port

## 联系方式

如有问题，请联系项目维护人员。

