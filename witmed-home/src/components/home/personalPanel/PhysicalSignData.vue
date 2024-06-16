<script setup>
import { getphySignData } from '@/api/apiUtils.js';
import { ref } from 'vue';
import VChart from 'vue-echarts';
import { use } from 'echarts/core';
import { LineChart } from 'echarts/charts';
import {
    TitleComponent,
    LegendComponent,
    GridComponent,
    TooltipComponent,
    ToolboxComponent,
} from 'echarts/components';
import { CanvasRenderer } from 'echarts/renderers';
use([
    TitleComponent,
    TooltipComponent,
    LegendComponent,
    ToolboxComponent,
    GridComponent,
    LineChart,
    CanvasRenderer
]);

import { useDataStore } from '@/stores/data.js';
// 父向子传参，当前用户ID: props.userId
const props = defineProps(['userId']);

// 数据仓库
const dataStore = useDataStore();
const dataByType = ref({});

function formatTime(dateTime) {
    const date = new Date(dateTime);
    const month = String(date.getMonth() + 1).padStart(2, '0');
    const day = String(date.getDate()).padStart(2, '0');
    const hours = String(date.getHours()).padStart(2, '0');
    const minutes = String(date.getMinutes()).padStart(2, '0');
    return `${month}-${day} ${hours}:${minutes}`;
}

function dataProcess() {
    // 遍历测量日志，并按类型组织数据
    dataStore.measureLog.forEach(measurement => {
        const { type, data, dateTime } = measurement;
        if (!dataByType.value[type]) {
            dataByType.value[type] = {
                data: [],
                time: []
            };
        }
        dataByType.value[type].data.push(data);
        dataByType.value[type].time.push(formatTime(dateTime));
    });
    // 对每种类型的时间数组进行排序
    for (const type in dataByType.value) {
        const { data, time } = dataByType.value[type];
        const sortedIndices = time.map((_, index) => index).sort((a, b) => {
            return new Date(time[a]).getTime() - new Date(time[b]).getTime();
        });
        dataByType.value[type].data = sortedIndices.map(index => data[index]);
        dataByType.value[type].time = sortedIndices.map(index => time[index]);
    }
}


dataProcess()

// 心率
const heartRateOption = ref({
    color: ['#5470c6'],
    title: {
        text: '心率',
        // subtext: 'Fake Data',
        left: 'center'
    },
    legend: {
        orient: 'vertical',
        left: 'left'
    },
    tooltip: {
        trigger: 'axis',
        axisPointer: {
            type: 'cross',
            label: {
                backgroundColor: '#6a7985'
            }
        }
    },
    grid: {
        left: '3%',
        right: '4%',
        bottom: '3%',
        containLabel: true
    },
    xAxis: {
        type: 'category',
        data: dataByType.value['heart_rate'].time
    },
    yAxis: {
        type: 'value',
        min: 60
    },
    series: [
        {
            name: '心率',
            data: dataByType.value['heart_rate'].data,
            type: 'line'
        }
    ]
});

// 血氧
const bloodOxygenOption = ref({
    color: ['#ee6666'],
    title: {
        text: '血氧',
        // subtext: 'Fake Data',
        left: 'center'
    },
    legend: {
        orient: 'vertical',
        left: 'left'
    },
    tooltip: {
        trigger: 'axis',
        axisPointer: {
            type: 'cross',
            label: {
                backgroundColor: '#6a7985'
            }
        }
    },
    grid: {
        left: '3%',
        right: '4%',
        bottom: '3%',
        containLabel: true
    },
    xAxis: {
        type: 'category',
        data: dataByType.value['blood_oxygen'].time
    },
    yAxis: {
        type: 'value',
        min: 60,
        max: 100
    },
    series: [
        {
            name: '血氧',
            data: dataByType.value['blood_oxygen'].data,
            type: 'line'
        }
    ]
});

// 体温
const temOption = ref({
    color: ['#73c0de'],
    title: {
        text: '体温',
        // subtext: 'Fake Data',
        left: 'center'
    },
    legend: {
        orient: 'vertical',
        left: 'left'
    },
    tooltip: {
        trigger: 'axis',
        axisPointer: {
            type: 'cross',
            label: {
                backgroundColor: '#6a7985'
            }
        }
    },
    grid: {
        left: '3%',
        right: '4%',
        bottom: '3%',
        containLabel: true
    },
    xAxis: {
        type: 'category',
        data: dataByType.value['body_tem'].time
    },
    yAxis: {
        type: 'value',
        min: 36,
        max: 40
    },
    series: [
        {
            name: '体温',
            data: dataByType.value['body_tem'].data,
            type: 'line'
        }
    ]
});

// 血糖
const bloodSugarOption = ref({
    color: ['#fac858'],
    title: {
        text: '血糖',
        // subtext: 'Fake Data',
        left: 'center'
    },
    tooltip: {
        trigger: 'axis',
        axisPointer: {
            type: 'cross',
            label: {
                backgroundColor: '#6a7985'
            }
        }
    },
    legend: {
        orient: 'vertical',
        left: 'left'
    },
    grid: {
        left: '3%',
        right: '4%',
        bottom: '3%',
        containLabel: true
    },
    xAxis: {
        type: 'category',
        data: dataByType.value['blood_sugar'].time
    },
    yAxis: {
        type: 'value',
        min: 3,
        max: 10
    },
    series: [
        {
            name: '血糖',
            data: dataByType.value['blood_sugar'].data,
            type: 'line'
        }
    ]
});

// 血压
const bloodPressureOption = ref({
    color: ['#a7ffc0', '#4ce7ff'],
    title: {
        text: '血压',
        left: 'center'
    },
    tooltip: {
        trigger: 'axis',
        axisPointer: {
            type: 'cross',
            label: {
                backgroundColor: '#6a7985'
            }
        }
    },
    grid: {
        left: '3%',
        right: '4%',
        bottom: '3%',
        containLabel: true
    },
    legend: {
        data: ['低压', '高压'],
        left: 'left'
    },
    xAxis: [
        {
            type: 'category',
            boundaryGap: false,
            data: dataByType.value['low_preassure'].time
        }
    ],
    yAxis: [
        {
            type: 'value',
            min: 50,
            max: 180
        }
    ],
    series: [
        {
            name: '低压',
            type: 'line',
            // stack: 'Total',
            smooth: true,
            areaStyle: {},
            emphasis: {
                focus: 'series'
            },
            data: dataByType.value['low_preassure'].data
        },
        {
            name: '高压',
            type: 'line',
            // stack: 'Total',
            smooth: true,
            areaStyle: {},
            emphasis: {
                focus: 'series'
            },
            data: dataByType.value['high_preassure'].data
        },
    ]
});
</script>

<template>
    <div class="physical-sign-data-container">
        <div class="chart-container border bg-l2 scrollbar-box">
            <v-chart class="chart" :option="heartRateOption" autoresize />
            <v-chart class="chart" :option="bloodOxygenOption" autoresize />
            <v-chart class="chart" :option="temOption" autoresize />
            <v-chart class="chart" :option="bloodSugarOption" autoresize />
            <v-chart class="chart" :option="bloodPressureOption" autoresize style="border-bottom: none; grid-column: span 2;"/>
        </div>
    </div>

</template>

<style lang="css" scoped>
.physical-sign-data-container {
    height: 100%;
    width: 100%;
    overflow: hidden;
    padding: 10px 20px 20px 10px;
    box-sizing: border-box;
}

.chart-container {
    overflow: hidden;
    /* 90: 60px的tab栏高度 + 30px的上下padding */
    height: calc(100vh - 90px - 5px);
    width: 100%;
    overflow-y: scroll;
    box-sizing: border-box;
    padding-bottom: 10px;

    display: grid;
    grid-template-columns: repeat(2, 1fr);
}

.chart {
    margin-top: 30px;
    padding-bottom: 30px;
    height: calc(36vh);
    border-bottom: 1px dashed var(--border-color);
}
</style>