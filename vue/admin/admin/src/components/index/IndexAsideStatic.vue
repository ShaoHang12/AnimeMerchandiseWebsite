<template>
	<div class="menu-preview">
		<!-- 竖向 -->
		<el-scrollbar wrap-class="scrollbar-wrapper">
			<el-menu :default-openeds="[]" :unique-opened="true" :style='{"border":0,"padding":"0","listStyle":"none","margin":"0","position":"relative","background":"transparent"}' class="el-menu-vertical-demo" default-active="0">
				<el-image v-if="false" :style='{"width":"44px","margin":"10px auto","objectFit":"cover","borderRadius":"100%","display":"block","height":"44px"}' src="http://codegen.caihongy.cn/20201114/7856ba26477849ea828f481fa2773a95.jpg" fit="cover"></el-image>
				
				<el-submenu index="0" @click.native="menuHandler('')">
					<template slot="title">
						<i v-if='true' :style='{"width":"34px","verticalAlign":"middle","margin":"0 3px","fontSize":"18px","color":"inherit","textAlign":"center"}' class="el-icon-menu el-icon-s-home" />
						<span :style='{"color":"inherit","verticalAlign":"middle","fontSize":"14px"}'>系统首页</span>
					</template>
				</el-submenu>
				
				<el-submenu index="1">
					<template slot="title">
						<i v-if='true' :style='{"width":"34px","verticalAlign":"middle","margin":"0 3px","fontSize":"18px","color":"inherit","textAlign":"center"}' class="el-icon-menu el-icon-user-solid" />
						<span :style='{"color":"inherit","verticalAlign":"middle","fontSize":"14px"}'>个人中心</span>
					</template>
					<el-menu-item index="1-1" @click="menuHandler('updatePassword')">修改密码</el-menu-item>
					<el-menu-item index="1-2" @click="menuHandler('center')">个人信息</el-menu-item>
				</el-submenu>
				<el-submenu v-for=" (menu,index) in menuList.backMenu" :key="menu.menu" :index="index+2+''">
					<template slot="title">
						<i v-if='true' :style='{"width":"34px","verticalAlign":"middle","margin":"0 3px","fontSize":"18px","color":"inherit","textAlign":"center"}' class="el-icon-menu" :class="icons[index]" />
						<span :style='{"color":"inherit","verticalAlign":"middle","fontSize":"14px"}'>{{ menu.menu }}</span>
					</template>
					<el-menu-item v-for=" (child,sort) in menu.child" :key="sort" :index="(index+2)+'-'+sort" @click="menuHandler(child.tableName)">{{ child.menu }}</el-menu-item>
				</el-submenu>
			</el-menu>
		</el-scrollbar>

	</div>
</template>

<script>
import menu from '@/utils/menu'
export default {
	data() {
		return {
			menuList: [],
			dynamicMenuRoutes: [],
			role: '',
			icons: [
				'el-icon-s-cooperation',
				'el-icon-s-order',
				'el-icon-s-platform',
				'el-icon-s-fold',
				'el-icon-s-unfold',
				'el-icon-s-operation',
				'el-icon-s-promotion',
				'el-icon-s-release',
				'el-icon-s-ticket',
				'el-icon-s-management',
				'el-icon-s-open',
				'el-icon-s-shop',
				'el-icon-s-marketing',
				'el-icon-s-flag',
				'el-icon-s-comment',
				'el-icon-s-finance',
				'el-icon-s-claim',
				'el-icon-s-custom',
				'el-icon-s-opportunity',
				'el-icon-s-data',
				'el-icon-s-check',
				'el-icon-s-grid',
				'el-icon-menu',
				'el-icon-chat-dot-square',
				'el-icon-message',
				'el-icon-postcard',
				'el-icon-position',
				'el-icon-microphone',
				'el-icon-close-notification',
				'el-icon-bangzhu',
				'el-icon-time',
				'el-icon-odometer',
				'el-icon-crop',
				'el-icon-aim',
				'el-icon-switch-button',
				'el-icon-full-screen',
				'el-icon-copy-document',
				'el-icon-mic',
				'el-icon-stopwatch',
			],
			menulistBorderBottom: {},
		}
	},
	mounted() {
		let menus = menu.list();
		let role = this.$storage.get("role");
		for (let i = 0; i < menus.length; i++) {
			if (menus[i].roleName == role) {
				this.menuList = menus[i];
				break;
			}
		}
		if (!this.menuList.backMenu) {
			this.menuList = menus[0];
		}
	},
	methods: {
		menuHandler(menu) {
			if (menu == '' || menu == null) {
				this.$router.push({
					name: 'home'
				})
			} else {
				if (menu.indexOf('/') !== -1) {
					let arr = menu.split('/');
					this.$router.push({
						name: arr[0],
						params: {
							status: arr[1]
						}
					})
				} else {
					this.$router.push({
						name: menu
					})
				}
			}
		}
	}
}
</script>

<style lang="scss" scoped>
	.menu-preview {
	  .el-scrollbar {
	    height: 100%;

	    & ::v-deep .scrollbar-wrapper {
	      overflow-x: hidden;
	    }
		
			// 竖向
		.el-menu-vertical-demo {
		  .el-submenu:first-of-type ::v-deep .el-submenu__title .el-submenu__icon-arrow {
		    display: none;
		  }
		}
		
		.el-menu-vertical-demo>.el-menu-item {
				  				  cursor: pointer;
				  				  padding: 0 20px;
				  				  color: #C71585;
				  				  white-space: nowrap;
				  				  background: rgba(255,182,193,0.3);
				  				  display: flex;
				  				  border-color: rgba(255,105,180,0.2);
				  				  border-width: 0 0 1px;
				  				  justify-content: center;
				  				  align-items: center;
				  				  position: relative;
				  				  border-style: solid;
				  				  transition: all 0.3s ease;
				  		}
		
		.el-menu-vertical-demo>.el-menu-item:hover {
						color: #fff;
						background: linear-gradient(135deg, #FF69B4, #FFB6C1);
						transform: translateX(5px);
						box-shadow: 0 2px 10px rgba(255,105,180,0.3);
					}
		
		.el-menu-vertical-demo .el-submenu ::v-deep .el-submenu__title {
						cursor: pointer;
						padding: 0 20px;
						color: #C71585;
						white-space: nowrap;
						background: rgba(255,182,193,0.3);
						display: flex;
						border-color: rgba(255,105,180,0.2);
						border-width: 0 0 1px;
						justify-content: center;
						align-items: center;
						position: relative;
						border-style: solid;
						transition: all 0.3s ease;
					}
		
		.el-menu-vertical-demo .el-submenu ::v-deep .el-submenu__title:hover {
						color: #fff;
						background: linear-gradient(135deg, #FF69B4, #FFB6C1);
						transform: translateX(5px);
						box-shadow: 0 2px 10px rgba(255,105,180,0.3);
					}
		
		.el-menu-vertical-demo .el-submenu ::v-deep .el-submenu__title .el-submenu__icon-arrow {
						margin: -7px 0 0 0;
						top: 50%;
						color: inherit;
						vertical-align: middle;
						font-size: 0;
						position: absolute;
						right: 20px;
					}
		
		.el-menu-vertical-demo .el-submenu {
						padding: 0;
						margin: 0;
						list-style: none;
					}
		
		.el-menu-vertical-demo .el-submenu ::v-deep .el-menu .el-menu-item {
						padding: 0 40px;
						color: #C71585;
						background: linear-gradient(90deg, #fff0f5 0%, #fff0f5 3%, #FFB6C1 3%, #FFB6C1 5%, #fff0f5 5%, #fff0f5 100%);
						border-color: #fff;
						border-width: 0 0 2px;
						line-height: 50px;
						border-style: solid;
						text-align: center;
						height: 50px;
						transition: all 0.3s ease;
					}
		
		.el-menu-vertical-demo .el-submenu ::v-deep .el-menu .el-menu-item:hover {
						padding: 0 40px;
						color: #fff;
						background: linear-gradient(90deg, #FF69B4 0%, #FF69B4 3%, #fff0f5 3%, #fff0f5 5%, #FF69B4 5%, #FF69B4 100%);
						line-height: 50px;
						height: 50px;
					}
		
		.el-menu-vertical-demo .el-submenu ::v-deep .el-menu .el-menu-item.is-active {
						padding: 0 40px;
						color: #fff;
						background: linear-gradient(90deg, #FF69B4 0%, #FF69B4 3%, #fff0f5 3%, #fff0f5 5%, #FF69B4 5%, #FF69B4 100%);

						line-height: 50px;
						height: 50px;
					}
	  }
	}
</style>
