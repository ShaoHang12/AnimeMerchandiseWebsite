const menu = {
    list() {
        return [{
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
            },  {
                "child": [{
                    "appFrontIcon": "cuIcon-circle",
                    "buttons": ["查看", "修改", "回复", "删除"],
                    "menu": "论坛管理",
                    "tableName": "messages"
                }], "menu": "论坛管理"
            }, {
                "child": [{
                    "appFrontIcon": "cuIcon-phone",
                    "buttons": ["新增", "查看", "修改", "删除"],
                    "menu": "轮播图管理",
                    "tableName": "config"
                }, ], "menu": "系统管理"
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
                    "menu": "动漫产品列表",
                    "menuJump": "列表",
                    "tableName": "dianzichanpin"
                }], "menu": "动漫产品模块"
            }],
            "hasBackLogin": "是",
            "hasBackRegister": "否",
            "hasFrontLogin": "否",
            "hasFrontRegister": "否",
            "roleName": "管理员",
            "tableName": "users"
        }, {
            "backMenu": [],
            "frontMenu": [{
                "child": [{
                    "appFrontIcon": "cuIcon-similar",
                    "buttons": ["查看"],
                    "menu": "动漫产品列表",
                    "menuJump": "列表",
                    "tableName": "dianzichanpin"
                }], "menu": "动漫产品模块"
            }],
            "hasBackLogin": "是",
            "hasBackRegister": "否",
            "hasFrontLogin": "是",
            "hasFrontRegister": "是",
            "roleName": "会员",
            "tableName": "yonghu"
        }]
    }
}
export default menu;
