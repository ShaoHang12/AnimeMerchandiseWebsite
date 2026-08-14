-- 动漫产品商城数据库初始化脚本
-- 创建数据库
CREATE DATABASE IF NOT EXISTS anime_mall DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE anime_mall;

-- 管理员表
CREATE TABLE IF NOT EXISTS users (
  id BIGINT NOT NULL AUTO_INCREMENT,
  username VARCHAR(100) DEFAULT NULL COMMENT '用户名',
  password VARCHAR(100) DEFAULT NULL COMMENT '密码',
  ole VARCHAR(100) DEFAULT '管理员' COMMENT '角色',
  ddtime DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT '添加时间',
  PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='管理员表';

-- 用户表
CREATE TABLE IF NOT EXISTS yonghu (
  id BIGINT NOT NULL AUTO_INCREMENT,
  zhanghao VARCHAR(100) DEFAULT NULL COMMENT '账号',
  mima VARCHAR(100) DEFAULT NULL COMMENT '密码',
  xingming VARCHAR(100) DEFAULT NULL COMMENT '姓名',
  
ianling INT DEFAULT NULL COMMENT '年龄',
  xingbie VARCHAR(100) DEFAULT NULL COMMENT '性别',
  shouji VARCHAR(100) DEFAULT NULL COMMENT '手机',
  youxiang VARCHAR(100) DEFAULT NULL COMMENT '邮箱',
  	ouxiang VARCHAR(500) DEFAULT NULL COMMENT '头像',
  money FLOAT DEFAULT 0 COMMENT '余额',
  ip VARCHAR(100) DEFAULT '否' COMMENT '是否会员',
  ddtime DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT '添加时间',
  PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='用户表';

-- 产品类别表
CREATE TABLE IF NOT EXISTS chanpinleibie (
  id BIGINT NOT NULL AUTO_INCREMENT,
  chanpinleibie VARCHAR(100) DEFAULT NULL COMMENT '产品类别',
  ddtime DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT '添加时间',
  PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='产品类别表';

-- 电子产品(动漫产品)表
CREATE TABLE IF NOT EXISTS dianzichanpin (
  id BIGINT NOT NULL AUTO_INCREMENT,
  chanpinbianhao VARCHAR(100) DEFAULT NULL COMMENT '产品编号',
  chanpinmingcheng VARCHAR(100) DEFAULT NULL COMMENT '产品名称',
  chanpinleibie VARCHAR(100) DEFAULT NULL COMMENT '产品类别',
  pinpai VARCHAR(100) DEFAULT NULL COMMENT '品牌',
  guige VARCHAR(100) DEFAULT NULL COMMENT '规格',
  engmian VARCHAR(500) DEFAULT NULL COMMENT '封面',
  shangjiariqi DATE DEFAULT NULL COMMENT '上架日期',
  aoxiuqi VARCHAR(100) DEFAULT NULL COMMENT '保修期',
  chanpinjieshao TEXT COMMENT '产品介绍',
  onelimittimes INT DEFAULT NULL COMMENT '单限',
  lllimittimes INT DEFAULT NULL COMMENT '库存',
  	humbsupnum INT DEFAULT 0 COMMENT '赞',
  crazilynum INT DEFAULT 0 COMMENT '踩',
  clicktime DATETIME DEFAULT NULL COMMENT '最近点击时间',
  clicknum INT DEFAULT 0 COMMENT '点击次数',
  price FLOAT DEFAULT NULL COMMENT '价格',
  ipprice FLOAT DEFAULT NULL COMMENT '会员价',
  ddtime DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT '添加时间',
  PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='动漫产品表';

-- 地址表
CREATE TABLE IF NOT EXISTS ddress (
  id BIGINT NOT NULL AUTO_INCREMENT,
  userid BIGINT DEFAULT NULL COMMENT '用户id',
  ddress VARCHAR(500) DEFAULT NULL COMMENT '地址',
  
ame VARCHAR(100) DEFAULT NULL COMMENT '收货人',
  phone VARCHAR(100) DEFAULT NULL COMMENT '电话',
  isdefault VARCHAR(100) DEFAULT '否' COMMENT '是否默认地址',
  ddtime DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT '添加时间',
  PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='地址表';

-- 购物车表
CREATE TABLE IF NOT EXISTS cart (
  id BIGINT NOT NULL AUTO_INCREMENT,
  	ablename VARCHAR(100) DEFAULT 'dianzichanpin' COMMENT '商品表名',
  userid BIGINT DEFAULT NULL COMMENT '用户id',
  goodid BIGINT DEFAULT NULL COMMENT '商品id',
  goodname VARCHAR(200) DEFAULT NULL COMMENT '商品名称',
  picture VARCHAR(500) DEFAULT NULL COMMENT '图片',
  uynumber INT DEFAULT NULL COMMENT '购买数量',
  price FLOAT DEFAULT NULL COMMENT '单价',
  discountprice FLOAT DEFAULT NULL COMMENT '折扣价',
  goodtype VARCHAR(100) DEFAULT NULL COMMENT '商品类型',
  ddtime DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT '添加时间',
  PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='购物车表';

-- 订单表
CREATE TABLE IF NOT EXISTS orders (
  id BIGINT NOT NULL AUTO_INCREMENT,
  orderid VARCHAR(100) DEFAULT NULL COMMENT '订单编号',
  	ablename VARCHAR(100) DEFAULT 'dianzichanpin' COMMENT '商品表名',
  userid BIGINT DEFAULT NULL COMMENT '用户id',
  goodid BIGINT DEFAULT NULL COMMENT '商品id',
  goodname VARCHAR(200) DEFAULT NULL COMMENT '商品名称',
  picture VARCHAR(500) DEFAULT NULL COMMENT '图片',
  uynumber INT DEFAULT NULL COMMENT '购买数量',
  price FLOAT DEFAULT NULL COMMENT '单价',
  discountprice FLOAT DEFAULT NULL COMMENT '折扣价',
  	otal FLOAT DEFAULT NULL COMMENT '总价格',
  discounttotal FLOAT DEFAULT NULL COMMENT '折扣总价格',
  	ype INT DEFAULT 1 COMMENT '支付类型(1:现金 2:积分)',
  status VARCHAR(100) DEFAULT '未支付' COMMENT '状态',
  ddress VARCHAR(500) DEFAULT NULL COMMENT '地址',
  	el VARCHAR(100) DEFAULT NULL COMMENT '电话',
  consignee VARCHAR(100) DEFAULT NULL COMMENT '收货人',
  emark VARCHAR(500) DEFAULT NULL COMMENT '备注',
  logistics TEXT COMMENT '物流信息',
  goodtype VARCHAR(100) DEFAULT NULL COMMENT '商品类型',
  ddtime DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT '添加时间',
  PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='订单表';

-- 售后申请表
CREATE TABLE IF NOT EXISTS shouhoushenqing (
  id BIGINT NOT NULL AUTO_INCREMENT,
  shouhoudanhao VARCHAR(100) DEFAULT NULL COMMENT '售后单号',
  chanpinmingcheng VARCHAR(100) DEFAULT NULL COMMENT '产品名称',
  shenqingshijian DATETIME DEFAULT NULL COMMENT '申请时间',
  shenqingyuanyin TEXT COMMENT '申请原因',
  zhanghao VARCHAR(100) DEFAULT NULL COMMENT '账号',
  xingming VARCHAR(100) DEFAULT NULL COMMENT '姓名',
  shouji VARCHAR(100) DEFAULT NULL COMMENT '手机',
  sfsh VARCHAR(100) DEFAULT '待审核' COMMENT '是否审核',
  shhf TEXT COMMENT '审核回复',
  ddtime DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT '添加时间',
  PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='售后申请表';

-- 评论表
CREATE TABLE IF NOT EXISTS discussdianzichanpin (
  id BIGINT NOT NULL AUTO_INCREMENT,
  efid BIGINT DEFAULT NULL COMMENT '关联表id',
  userid BIGINT DEFAULT NULL COMMENT '用户id',
  vatarurl VARCHAR(500) DEFAULT NULL COMMENT '头像',
  
ickname VARCHAR(200) DEFAULT NULL COMMENT '昵称',
  content TEXT COMMENT '评论内容',
  eply TEXT COMMENT '回复内容',
  ddtime DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT '添加时间',
  PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='动漫产品评论表';

-- 留言板表
CREATE TABLE IF NOT EXISTS messages (
  id BIGINT NOT NULL AUTO_INCREMENT,
  userid BIGINT DEFAULT NULL COMMENT '用户id',
  username VARCHAR(200) DEFAULT NULL COMMENT '用户名',
  vatarurl VARCHAR(500) DEFAULT NULL COMMENT '头像',
  content TEXT COMMENT '留言内容',
  cpicture VARCHAR(500) DEFAULT NULL COMMENT '留言图片',
  eply TEXT COMMENT '回复内容',
  picture VARCHAR(500) DEFAULT NULL COMMENT '回复图片',
  ddtime DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT '添加时间',
  PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='留言板表';

-- 新闻资讯表
CREATE TABLE IF NOT EXISTS 
ews (
  id BIGINT NOT NULL AUTO_INCREMENT,
  	itle VARCHAR(200) DEFAULT NULL COMMENT '标题',
  introduction TEXT COMMENT '简介',
  picture VARCHAR(500) DEFAULT NULL COMMENT '图片',
  content TEXT COMMENT '内容',
  ddtime DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT '添加时间',
  PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='新闻资讯表';

-- 收藏表
CREATE TABLE IF NOT EXISTS storeup (
  id BIGINT NOT NULL AUTO_INCREMENT,
  userid BIGINT DEFAULT NULL COMMENT '用户id',
  efid BIGINT DEFAULT NULL COMMENT '收藏id',
  	ablename VARCHAR(100) DEFAULT NULL COMMENT '表名',
  
ame VARCHAR(200) DEFAULT NULL COMMENT '收藏名称',
  picture VARCHAR(500) DEFAULT NULL COMMENT '收藏图片',
  	ype VARCHAR(100) DEFAULT '1' COMMENT '类型(1:收藏,21:赞,22:踩)',
  inteltype VARCHAR(200) DEFAULT NULL COMMENT '推荐类型',
  emark VARCHAR(500) DEFAULT NULL COMMENT '备注',
  ddtime DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT '添加时间',
  PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='收藏表';

-- 聊天表
CREATE TABLE IF NOT EXISTS chat (
  id BIGINT NOT NULL AUTO_INCREMENT,
  userid BIGINT DEFAULT NULL COMMENT '用户id',
  dminid BIGINT DEFAULT NULL COMMENT '管理员id',
  sk TEXT COMMENT '提问',
  eply TEXT COMMENT '回复',
  isreply INT DEFAULT 0 COMMENT '是否回复',
  ddtime DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT '添加时间',
  PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='聊天表';

-- 系统简介表
CREATE TABLE IF NOT EXISTS systemintro (
  id BIGINT NOT NULL AUTO_INCREMENT,
  	itle VARCHAR(200) DEFAULT NULL COMMENT '标题',
  subtitle VARCHAR(500) DEFAULT NULL COMMENT '副标题',
  content TEXT COMMENT '内容',
  picture1 VARCHAR(500) DEFAULT NULL COMMENT '图片1',
  picture2 VARCHAR(500) DEFAULT NULL COMMENT '图片2',
  picture3 VARCHAR(500) DEFAULT NULL COMMENT '图片3',
  ddtime DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT '添加时间',
  PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='系统简介表';

-- 关于我们表
CREATE TABLE IF NOT EXISTS boutus (
  id BIGINT NOT NULL AUTO_INCREMENT,
  	itle VARCHAR(200) DEFAULT NULL COMMENT '标题',
  subtitle VARCHAR(500) DEFAULT NULL COMMENT '副标题',
  content TEXT COMMENT '内容',
  picture1 VARCHAR(500) DEFAULT NULL COMMENT '图片1',
  picture2 VARCHAR(500) DEFAULT NULL COMMENT '图片2',
  picture3 VARCHAR(500) DEFAULT NULL COMMENT '图片3',
  ddtime DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT '添加时间',
  PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='关于我们表';

-- 配置表
CREATE TABLE IF NOT EXISTS config (
  id BIGINT NOT NULL AUTO_INCREMENT,
  
ame VARCHAR(100) DEFAULT NULL COMMENT '名称',
  alue VARCHAR(500) DEFAULT NULL COMMENT '值',
  PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='配置表';

-- Token表
CREATE TABLE IF NOT EXISTS 	oken (
  id BIGINT NOT NULL AUTO_INCREMENT,
  userid BIGINT DEFAULT NULL COMMENT '用户id',
  username VARCHAR(100) DEFAULT NULL COMMENT '用户名',
  	ablename VARCHAR(100) DEFAULT NULL COMMENT '表名',
  ole VARCHAR(100) DEFAULT NULL COMMENT '角色',
  	oken VARCHAR(500) DEFAULT NULL COMMENT 'token',
  expiratedtime DATETIME DEFAULT NULL COMMENT '过期时间',
  ddtime DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT '添加时间',
  PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Token表';

-- ==================== 插入初始数据 ====================

-- 插入管理员账号 (admin/admin123)
INSERT INTO users (username, password, ole) VALUES ('admin', 'admin123', '管理员');

-- 插入测试用户
INSERT INTO yonghu (zhanghao, mima, xingming, 
ianling, xingbie, shouji, youxiang, 	ouxiang, money, ip) VALUES
('user1', '123456', '张三', 20, '男', '13800138001', 'zhangsan@example.com', 'upload/yonghu_touxiang1.jpg', 1000, '否'),
('user2', '123456', '李四', 22, '女', '13800138002', 'lisi@example.com', 'upload/yonghu_touxiang2.jpg', 500, '是');

-- 插入产品类别
INSERT INTO chanpinleibie (chanpinleibie) VALUES ('手办'), ('模型'), ('周边'), ('服饰'), ('文具');

-- 插入动漫产品
INSERT INTO dianzichanpin (chanpinbianhao, chanpinmingcheng, chanpinleibie, pinpai, guige, engmian, shangjiariqi, aoxiuqi, chanpinjieshao, onelimittimes, lllimittimes, 	humbsupnum, crazilynum, clicknum, price, ipprice) VALUES
('CP001', '火影忍者鸣人手办', '手办', '万代', '高约15cm', 'upload/dianzichanpin_fengmian1.jpg', '2024-01-15', '30天', '火影忍者主角漩涡鸣人精致手办，高品质涂装，细节丰富。', 5, 100, 10, 2, 50, 299, 269),
('CP002', '海贼王路飞模型', '模型', 'MEGAHOUSE', '高约20cm', 'upload/dianzichanpin_fengmian2.jpg', '2024-02-01', '30天', '海贼王主角蒙奇·D·路飞高端模型，可动关节设计。', 3, 80, 15, 1, 75, 399, 359),
('CP003', '龙珠超悟空手办', '手办', 'BANDAI', '高约18cm', 'upload/dianzichanpin_fengmian3.jpg', '2024-01-20', '30天', '龙珠超超级赛亚人孙悟空手办，动态造型，做工精细。', 5, 120, 20, 3, 90, 259, 239),
('CP004', '进击的巨人周边钥匙扣', '周边', '官方', '标准', 'upload/dianzichanpin_fengmian4.jpg', '2024-03-01', '无', '进击的巨人官方授权周边钥匙扣，合金材质。', 10, 500, 5, 0, 30, 39, 35),
('CP005', '鬼灭之刃炭治郎T恤', '服饰', '优衣库', 'M/L/XL', 'upload/dianzichanpin_fengmian5.jpg', '2024-02-15', '无', '鬼灭之刃联名款T恤，纯棉材质，舒适透气。', 2, 200, 8, 1, 45, 129, 109),
('CP006', '咒术回战笔记本', '文具', '官方', 'A5', 'upload/dianzichanpin_fengmian6.jpg', '2024-03-10', '无', '咒术回战主题笔记本，100页，精装设计。', 10, 300, 3, 0, 20, 25, 20),
('CP007', '我的英雄学院绿谷手办', '手办', '万代', '高约16cm', 'upload/dianzichanpin_fengmian7.jpg', '2024-02-28', '30天', '我的英雄学院绿谷出久手办，动感造型。', 5, 90, 12, 2, 60, 279, 249),
('CP008', '名侦探柯南模型套装', '模型', 'BANDAI', '套装', 'upload/dianzichanpin_fengmian8.jpg', '2024-01-01', '30天', '名侦探柯南角色模型套装，包含主要角色。', 2, 50, 25, 5, 120, 599, 539);

-- 插入新闻资讯
INSERT INTO 
ews (	itle, introduction, picture, content) VALUES
('2024年春季动漫新品上市', '多款热门动漫周边新品已到货', 'upload/news_picture1.jpg', '2024年春季动漫新品已经全面上架，包括火影忍者、海贼王、鬼灭之刃等热门IP的最新周边产品。'),
('动漫展览活动预告', '本月底将举办大型动漫展览', 'upload/news_picture2.jpg', '本月底将在市中心展览馆举办大型动漫展览活动，届时将有众多coser表演和限定商品发售。'),
('会员专属优惠活动', 'VIP会员享受更多折扣', 'upload/news_picture3.jpg', '为回馈广大VIP会员，本月推出会员专属优惠活动，全场商品享受额外9折优惠。');

-- 插入系统简介
INSERT INTO systemintro (	itle, subtitle, content, picture1, picture2, picture3) VALUES
('动漫产品商城', '您的动漫周边首选平台', '我们致力于为广大动漫爱好者提供最优质的动漫周边产品，包括手办、模型、服饰、文具等多种品类。所有产品均为正品保证，支持七天无理由退换货。', 'upload/systemintro_picture1.jpg', 'upload/systemintro_picture2.jpg', 'upload/systemintro_picture3.jpg');

-- 插入关于我们
INSERT INTO boutus (	itle, subtitle, content, picture1, picture2, picture3) VALUES
('关于我们', '专业的动漫周边商城', '动漫产品商城成立于2024年，是一家专注于动漫周边产品销售的电商平台。我们与多家知名动漫品牌合作，为消费者提供正品保障的优质产品。', 'upload/aboutus_picture1.jpg', 'upload/aboutus_picture2.jpg', 'upload/aboutus_picture3.jpg');

-- 插入配置
INSERT INTO config (
ame, alue) VALUES
('picture1', 'upload/picture1.jpg'),
('picture2', 'upload/picture2.jpg'),
('picture3', 'upload/picture3.jpg'),
('homepage', '动漫产品商城');
