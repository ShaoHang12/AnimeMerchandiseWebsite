import Vue from 'vue';
//配置路由
import VueRouter from 'vue-router'

Vue.use(VueRouter);
//1.创建组件
import Index from '@/views/index'
import Home from '@/views/home'
import Login from '@/views/login'
import NotFound from '@/views/404'
import UpdatePassword from '@/views/update-password'
import pay from '@/views/pay'
import register from '@/views/register'
import center from '@/views/center'
import news from '@/views/modules/news/list'
import aboutus from '@/views/modules/aboutus/list'
import chanpinleibie from '@/views/modules/chanpinleibie/list'
import systemintro from '@/views/modules/systemintro/list'
import yonghu from '@/views/modules/yonghu/list'
import chat from '@/views/modules/chat/list'
import discussdianzichanpin from '@/views/modules/discussdianzichanpin/list'
import dianzichanpin from '@/views/modules/dianzichanpin/list'
import messages from '@/views/modules/messages/list'
import orders from '@/views/modules/orders/list'
import shouhoushenqing from '@/views/modules/shouhoushenqing/list'
import config from '@/views/modules/config/list'


//2.配置路由   注意：名字
const routes = [{
    path: '/index',
    name: 'home',
    component: Index,
    children: [{
        // 这里不设置值，是把main作为默认页面
        path: '/',
        name: 'home',
        component: Home,
        meta: {icon: '', title: 'center'}
    }, {
        path: '/updatePassword',
        name: 'updatePassword',
        component: UpdatePassword,
        meta: {icon: '', title: 'updatePassword'}
    }, {
        path: '/pay',
        name: 'pay',
        component: pay,
        meta: {icon: '', title: 'pay'}
    }, {
        path: '/center',
        name: 'center',
        component: center,
        meta: {icon: '', title: 'center'}
    }
        , {
            path: '/news',
            name: 'news',
            component: news
        }
        , {
            path: '/aboutus',
            name: 'aboutus',
            component: aboutus
        }
        , {
            path: '/chanpinleibie',
            name: 'chanpinleibie',
            component: chanpinleibie
        }
        , {
            path: '/systemintro',
            name: 'systemintro',
            component: systemintro
        }
        , {
            path: '/yonghu',
            name: 'yonghu',
            component: yonghu
        }
        , {
            path: '/chat',
            name: 'chat',
            component: chat
        }
        , {
            path: '/discussdianzichanpin',
            name: 'discussdianzichanpin',
            component: discussdianzichanpin
        }
        , {
            path: '/dianzichanpin',
            name: 'dianzichanpin',
            component: dianzichanpin
        }
        , {
            path: '/messages',
            name: 'messages',
            component: messages
        }
        , {
            path: '/orders/:status',
            name: 'orders',
            component: orders
        }
        , {
            path: '/config',
            name: 'config',
            component: config
        }
    ]
},
    {
        path: '/login',
        name: 'login',
        component: Login,
        meta: {icon: '', title: 'login'}
    },
    {
        path: '/register',
        name: 'register',
        component: register,
        meta: {icon: '', title: 'register'}
    },
    {
        path: '/',
        name: 'home',
        redirect: '/index'
    }, /*默认跳转路由*/
    {
        path: '*',
        component: NotFound
    }
]
//3.实例化VueRouter  注意：名字
const router = new VueRouter({
    mode: 'hash',
    /*hash模式改为history*/
    routes // （缩写）相当于 routes: routes
})
const originalPush = VueRouter.prototype.push
//修改原型对象中的push方法
VueRouter.prototype.push = function push(location) {
    return originalPush.call(this, location).catch(err => err)
}
export default router;
