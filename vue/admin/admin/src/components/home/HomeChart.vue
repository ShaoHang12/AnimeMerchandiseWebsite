<template>
  <div id="home-chart" style="width:100%;height:400px;"></div>
</template>
<script>
export default {
  mounted() {
    this.homeChart();
  },
  methods: {
    homeChart() {
      var myChart = this.$echarts.init(document.getElementById("home-chart"));
      var option = {
        color: ['#FF69B4', '#FFB6C1', '#FF1493'],
        tooltip: {
          trigger: "axis"
        },
        legend: {
          data: ["访问量", "会员量", "收入"],
          textStyle: {
            color: '#C71585'
          }
        },
        grid: {
          left: "3%",
          right: "4%",
          bottom: "3%",
          containLabel: true
        },
        xAxis: {
          type: "category",
          boundaryGap: false,
          data: [
            "1月", "2月", "3月", "4月", "5月", "6月",
            "7月", "8月", "9月", "10月", "11月", "12月"
          ],
          axisLine: { lineStyle: { color: '#FFB6C1' } },
          axisLabel: { color: '#C71585' }
        },
        yAxis: {
          type: "value",
          axisLine: { lineStyle: { color: '#FFB6C1' } },
          axisLabel: { color: '#C71585' },
          splitLine: { lineStyle: { color: 'rgba(255,105,180,0.1)' } }
        },
        series: [
          {
            name: "访问量",
            type: "line",
            stack: "总量",
            smooth: true,
            areaStyle: {
              color: {
                type: 'linear',
                x: 0, y: 0, x2: 0, y2: 1,
                colorStops: [
                  { offset: 0, color: 'rgba(255,105,180,0.4)' },
                  { offset: 1, color: 'rgba(255,105,180,0.05)' }
                ]
              }
            },
            data: [120, 132, 101, 134, 90, 230, 210, 120, 132, 101, 134, 90, 230]
          },
          {
            name: "会员量",
            type: "line",
            stack: "总量",
            smooth: true,
            areaStyle: {
              color: {
                type: 'linear',
                x: 0, y: 0, x2: 0, y2: 1,
                colorStops: [
                  { offset: 0, color: 'rgba(255,182,193,0.4)' },
                  { offset: 1, color: 'rgba(255,182,193,0.05)' }
                ]
              }
            },
            data: [220, 182, 191, 234, 290, 330, 310, 182, 191, 234, 290, 330, 310]
          },
          {
            name: "收入",
            type: "line",
            stack: "总量",
            smooth: true,
            areaStyle: {
              color: {
                type: 'linear',
                x: 0, y: 0, x2: 0, y2: 1,
                colorStops: [
                  { offset: 0, color: 'rgba(255,20,147,0.4)' },
                  { offset: 1, color: 'rgba(255,20,147,0.05)' }
                ]
              }
            },
            data: [150, 232, 201, 154, 190, 330, 410, 232, 201, 154, 190, 330, 410]
          }
        ]
      };
      myChart.setOption(option);
      window.onresize = function() {
        myChart.resize();
      };
    }
  }
};
</script>
<style lang="scss" scoped>
#home-chart {
  background: linear-gradient(135deg, #fff, #fff0f5);
  padding: 20px 0;
  border-radius: 12px;
  box-shadow: 0 2px 12px rgba(255,105,180,0.1);
  animation: fadeIn 0.8s ease-out;
  transition: all 0.3s ease;

  &:hover {
    box-shadow: 0 5px 20px rgba(255,105,180,0.2);
  }
}

@keyframes fadeIn {
  from { opacity: 0; transform: scale(0.98); }
  to { opacity: 1; transform: scale(1); }
}
</style>
