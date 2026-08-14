export function isAuth(tableName, key) {
    let role = localStorage.getItem("UserTableName");
    let menus = [{
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
        }, {
            "child": [{
                "appFrontIcon": "cuIcon-camera",
                "buttons": ["删除", "审核", "查看"],
                "menu": "售后申请",
                "menuJump": "列表",
                "tableName": "shouhoushenqing"
            }], "menu": "售后申请管理"
        }, {
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
            }, {
                "appFrontIcon": "cuIcon-rank",
                "buttons": ["查看", "修改"],
                "menu": "关于我们",
                "tableName": "aboutus"
            },  {
                "appFrontIcon": "cuIcon-taxi",
                "buttons": ["查看", "修改"],
                "menu": "系统简介",
                "tableName": "systemintro"
            }, {
                "appFrontIcon": "cuIcon-service",
                "buttons": ["新增", "查看", "修改", "删除"],
                "menu": "在线客服",
                "tableName": "chat"
            }], "menu": "系统管理"
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
                "menu": "电子产品列表",
                "menuJump": "列表",
                "tableName": "dianzichanpin"
            }], "menu": "电子产品模块"
        }],
        "hasBackLogin": "是",
        "hasBackRegister": "否",
        "hasFrontLogin": "否",
        "hasFrontRegister": "否",
        "roleName": "管理员",
        "tableName": "users"
    }, {
        "backMenu": [{
            "child": [{
                "appFrontIcon": "cuIcon-camera",
                "buttons": ["新增", "查看", "修改", "删除"],
                "menu": "售后申请",
                "menuJump": "列表",
                "tableName": "shouhoushenqing"
            }], "menu": "售后申请管理"
        }],
        "frontMenu": [{
            "child": [{
                "appFrontIcon": "cuIcon-similar",
                "buttons": ["查看"],
                "menu": "电子产品列表",
                "menuJump": "列表",
                "tableName": "dianzichanpin"
            }], "menu": "电子产品模块"
        }],
        "hasBackLogin": "是",
        "hasBackRegister": "否",
        "hasFrontLogin": "是",
        "hasFrontRegister": "是",
        "roleName": "会员",
        "tableName": "yonghu"
    }];
    for (let i = 0; i < menus.length; i++) {
        if (menus[i].tableName == role) {
            for (let j = 0; j < menus[i].frontMenu.length; j++) {
                for (let k = 0; k < menus[i].frontMenu[j].child.length; k++) {
                    if (tableName == menus[i].frontMenu[j].child[k].tableName) {
                        let buttons = menus[i].frontMenu[j].child[k].buttons.join(',');
                        return buttons.indexOf(key) !== -1 || false
                    }
                }
            }
        }
    }
    return false;
}

/**
 *  * 获取当前时间（yyyy-MM-dd hh:mm:ss）
 *   */
export function getCurDateTime() {
    let currentTime = new Date(),
        year = currentTime.getFullYear(),
        month = currentTime.getMonth() + 1 < 10 ? '0' + (currentTime.getMonth() + 1) : currentTime.getMonth() + 1,
        day = currentTime.getDate() < 10 ? '0' + currentTime.getDate() : currentTime.getDate(),
        hour = currentTime.getHours(),
        minute = currentTime.getMinutes(),
        second = currentTime.getSeconds();
    return year + "-" + month + "-" + day + " " + hour + ":" + minute + ":" + second;
}

/**
 *  * 获取当前日期（yyyy-MM-dd）
 *   */
export function getCurDate() {
    let currentTime = new Date(),
        year = currentTime.getFullYear(),
        month = currentTime.getMonth() + 1 < 10 ? '0' + (currentTime.getMonth() + 1) : currentTime.getMonth() + 1,
        day = currentTime.getDate() < 10 ? '0' + currentTime.getDate() : currentTime.getDate();
    return year + "-" + month + "-" + day;
}
