<template>
  <div>
    <div class="card" v-if="data.user.role === 'USER'">你好老板！欢迎您使用本系统，祝您购物顺利！</div>
    <div class="card" style="margin-top: 10px; width: 50%" v-if="data.user.role === 'USER'">
      <div style="font-size: 18px; margin-bottom: 20px">公告系统</div>
      <el-timeline style="max-width: 600px">
        <el-timeline-item :timestamp="item.time" color="#0bbd87" placement="top" v-for="item in data.noticeData">
          <h4>{{ item.title }}</h4>
          <p>{{ item.content }}</p>
        </el-timeline-item>
      </el-timeline>
    </div>
    <div v-else>
      <div style="display: flex; grid-gap: 10px">
        <div class="card" style="height: 400px; width: 50%" id="pie"></div>
        <div class="card" style="height: 400px; width: 50%" id="bar"></div>
      </div>
      <div class="card" style="height: 400px; width: 100%; margin-top: 10px" id="line"></div>
    </div>

  </div>
</template>
<script setup>
import {reactive, onMounted} from "vue";
import request from "@/utils/request.js";
import {ElMessage} from "element-plus";
import * as echarts from "echarts";

const data = reactive({
  user: JSON.parse(localStorage.getItem('code_user') || "{}"),
  noticeData: []
})

const loadNotice = () => {
  request.get('/notice/selectAll').then(res => {
    if (res.code === '200') {
      data.noticeData = res.data
      if (data.noticeData.length > 3) {
        data.noticeData = data.noticeData.slice(0, 3)
      }
    } else {
      ElMessage.error(res.msg)
    }
  })
}
loadNotice()

const loadPie = () => {
  request.get('/echarts/pie').then(res => {
    if (res.code === '200') {
      let chartDom = document.getElementById('pie')
      let myChart = echarts.init(chartDom)
      pieOptions.series[0].data = res.data
      myChart.setOption(pieOptions)
    }
  })
}
const loadBar = () => {
  request.get('/echarts/bar').then(res => {
    if (res.code === '200') {
      let chartDom = document.getElementById('bar')
      let myChart = echarts.init(chartDom)
      barOptions.xAxis.data = res.data.xAxis
      barOptions.series[0].data = res.data.yAxis
      myChart.setOption(barOptions)
    }
  })
}
const loadLine = () => {
  request.get('/echarts/line').then(res => {
    if (res.code === '200') {
      let chartDom = document.getElementById('line')
      let myChart = echarts.init(chartDom)
      lineOptions.xAxis.data = res.data.xAxis
      lineOptions.series[0].data = res.data.yAxis
      myChart.setOption(lineOptions)
    }
  })
}
onMounted(() => {
  loadPie()
  loadBar()
  loadLine()
})

// 平滑折线图
let lineOptions = {
  title: {
    text: '最近一周每天平台用户发布的需求数量',
    subtext: '统计维度：最近一周',
    left: 'center'
  },
  legend: {
    data: [],
    template:""
  },
  grid: {
    left: '3%',
    right: '4%',
    bottom: '3%',
    containLabel: true
  },
  tooltip: {
    trigger: 'item'
  },
  xAxis: {
    name: '日期',
    type: 'category',
    data: ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun']
  },
  yAxis: {
    name: '需求数量',
    type: 'value'
  },
  series: [
    {
      name: '需求数量',
      data: [820, 932, 901, 934, 1290, 1330, 1320],
      type: 'line',
      smooth: true,
      markLine: {
        data: [{ type: 'average', name: '最近一周场需求发布数量平均值' }]
      },
      markPoint: {
        data: [
          { type: 'max', name: '最大值' },
          { type: 'min', name: '最小值' }
        ]
      },
    },
  ]
};
// 柱状图
let barOptions = {
  title: {
    text: '不同用户发布需求数量Top5', // 主标题
    subtext: '统计维度：用户昵称', // 副标题
    left: 'center'
  },
  grid : {   // ---------------------------增加这个属性，bottom就是距离底部的距离
    top: '20%',
    bottom : '20%'
  },
  legend: {
    orient: 'vertical',
    left: 'left'
  },
  xAxis: {
    type: 'category',
    data: ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'], // 示例数据：统计的维度（横坐标）
    name: '用户昵称',
    axisLabel: {
      show: true,
      interval: 0,
      rotate: -60,
      inside: false,
      margin: 6,
    },
  },
  yAxis: {
    type: 'value',
    name: '需求数量',
  },
  tooltip: {
    trigger: 'item',
  },
  series: [
    {
      data: [120, 200, 150, 80, 70, 110, 130],
      type: 'bar',
      itemStyle: {
        normal: {
          color: function () {
            return "#" + Math.floor(Math.random() * (256 * 256 * 256 - 1)).toString(16);
          }
        },
      },
    }
  ]
};
// 饼图
let pieOptions = {
  title: {
    text: '不同分类下用户发布需求帖子的数量', // 主标题
    subtext: '统计维度：攻略分类', // 副标题
    left: 'center'
  },
  tooltip: {
    trigger: 'item',
    formatter: '{a} <br/>{b} : {c} ({d}%)'
  },
  legend: {
    orient: 'vertical',
    left: 'left'
  },
  series: [
    {
      name: '数量占比', // 鼠标移上去显示内容
      type: 'pie',
      radius: '50%',
      center: ['50%', '60%'],
      data: [
        {value: 1048, name: '瑞幸咖啡'}, // 示例数据：name表示维度，value表示对应的值
        {value: 735, name: '雀巢咖啡'},
        {value: 580, name: '星巴克咖啡'},
        {value: 484, name: '栖巢咖啡'},
        {value: 300, name: '小武哥咖啡'}
      ]
    }
  ]
}
</script>