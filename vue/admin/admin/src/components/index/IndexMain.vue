<template>
	<div style="height: 100%;">
		<index-aside v-if="'vertical' == 'vertical'" :style='{"boxShadow":"2px 0 15px rgba(255,105,180,0.15)","overflow":"hidden","top":"60px","left":"0","background":"linear-gradient(180deg, #fff0f5, #ffe4e8)","bottom":"0","width":"210px","fontSize":"0px","position":"fixed","height":"calc(100% - 60px)","zIndex":"1001"}'></index-aside>
		<el-main :style='"vertical" == "vertical" ? {"minHeight":"100%","width":"100%","padding":"0","margin":"0","position":"relative","display":"block"} : {"minHeight":"100%","margin":"0","position":"relative"}'>
			<index-header :style='{"boxShadow":"0 1px 6px rgba(255,105,180,0.3)","padding":"0px 30px 0px 240px","alignItems":"center","top":"0","background":"linear-gradient(135deg, #FF69B4, #FFB6C1)","display":"flex","width":"100%","position":"fixed","justifyContent":"center","zIndex":"1002","height":"60px"}'></index-header>
			<index-aside v-if="'vertical' == 'horizontal'" :style='{"width":"100%","borderColor":"#efefef","borderStyle":"solid","background":"#FFB6C1","borderWidth":"0 0 1px 0","height":"auto"}'></index-aside>
			<bread-crumbs :title="title" :style='{"padding":"0 20px","margin":"80px auto 10px 240px","borderColor":"#FFB6C1","alignItems":"center","borderWidth":"0","background":"linear-gradient(135deg, rgba(255,105,180,0.85), rgba(255,182,193,0.85))","display":"flex","width":"calc(100% - 270px)","borderStyle":"solid","height":"40px","borderRadius":"8px"}' class="bread-crumbs"></bread-crumbs>
			<router-view class="router-view"></router-view>
		</el-main>
	</div>
</template>

<script>
	import IndexAside from '@/components/index/IndexAsideStatic'
	import IndexHeader from '@/components/index/IndexHeader'
	import menu from "@/utils/menu";
	export default {
		components: {
			IndexAside,
			IndexHeader
		},
		data() {
			return {
				menuList: [],
				role: "",
				currentIndex: -2,
				itemMenu: [],
				title: ''
			};
		},
		mounted() {
			let menus = menu.list();
			this.menuList = menus;
			this.role = this.$storage.get("role");

		},
		created() {
			this.init();
			console.log(console.log(this.$route.path))
		},
		methods: {
			init(){
				this.$nextTick(()=>{
					
				})
			},
			menuHandler(menu) {
				this.$router.push({
					name: menu.tableName
				});
				this.title = menu.menu;
			},
			titleChange(index, menus) {
				this.currentIndex = index
				this.itemMenu = menus;
				console.log(menus);
			},
			homeChange(index) {
				this.itemMenu = [];
				this.title = ""
				this.currentIndex = index
				this.$router.push({
					name: 'home'
				});
			},
			centerChange(index) {
				this.itemMenu = [{
					"buttons": ["新增", "查看", "修改", "删除"],
					"menu": "修改密码",
					"tableName": "updatePassword"
				}, {
					"buttons": ["新增", "查看", "修改", "删除"],
					"menu": "个人信息",
					"tableName": "center"
				}];
				this.title = ""
				this.currentIndex = index
				this.$router.push({
					name: 'home'
				});
				
			}
		}
	};
</script>
<style lang="scss" scoped>
	a {
		text-decoration: none;
		color: #555;
	}

	a:hover {
		background: #FF69B4;
	}
	
	.el-main {
		padding: 0;
		display: block;
		background: linear-gradient(135deg, #fff8fa, #fff0f5, #fff8fa);
		background-size: 400% 400%;
		animation: mainBG 20s ease infinite;
	}

	@keyframes mainBG {
		0% { background-position: 0% 50%; }
		50% { background-position: 100% 50%; }
		100% { background-position: 0% 50%; }
	}
</style>
