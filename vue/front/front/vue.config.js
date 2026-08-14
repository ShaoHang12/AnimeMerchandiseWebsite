module.exports = {
  lintOnSave: false,
  publicPath: process.env.NODE_ENV === 'development' ? './' : '././',
  outputDir: 'dist',
  devServer: {
    host: "0.0.0.0",
    port: 8082,
    hot: true,
    https: false,
    proxy: {
      '/anime_mall': {
        target: 'http://localhost:8080/anime_mall/',
        changeOrigin: true,
        secure: false,
        pathRewrite: {
          '^/anime_mall': ''
        }
      }
    }
  }
}
