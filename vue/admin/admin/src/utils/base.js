const base = {
    get() {
        return {
            url : "http://localhost:8080/anime_mall/",
            name: "anime_mall",
            // 退出到首页链接
            indexUrl: 'http://localhost:8080/anime_mall/front/dist/index.html'
        };
    },
    getProjectName(){
        return {
            projectName: "动漫产品销售系统"
        } 
    }
}
export default base
