<script setup>
import { setPain } from '@/api/apiUtils.js';
import { ElMessage } from 'element-plus';
import { use } from 'echarts/core';
import { RadarChart } from 'echarts/charts';
import { CanvasRenderer } from 'echarts/renderers';
import { useDataStore } from '@/stores/data.js';

use([RadarChart, CanvasRenderer]);

import { ref } from 'vue';
import VChart from 'vue-echarts';

// 数据仓库
const dataStore = useDataStore();
const props = defineProps(['userId']);

const dialogVisible = ref(false);

const chestPain = ref(null);
const anginaPectoris = ref(null);

const predData = ref({
    data: [],
    pred: null,
});

function submit() {
    setPain(parseInt(props.userId), parseInt(chestPain.value), parseInt(anginaPectoris.value));
    dialogVisible.value = false;
    ElMessage.success('更新成功');
}

// 根据id匹配phySignData
function getSignData() {
    let matchedSignData = dataStore.phySignData.find(data => data.personId == props.userId);
    if (matchedSignData) {
        predData.value.pred = matchedSignData.carPrediction;

        predData.value.data = [];
        predData.value.data.push(matchedSignData.heartRate);
        predData.value.data.push(matchedSignData.bloodOxygen);
        predData.value.data.push(matchedSignData.bloodSugar);
        predData.value.data.push(matchedSignData.highPreasure);
        predData.value.data.push(matchedSignData.lowPreasure);
    }
    return;
}
getSignData()

// 疾病预测
const diseasePredOption = ref({
    color: ['#56A3F1', '#FF917C'],
    radar: [
        {
            indicator: [
                { text: '心率', max: 150 },
                { text: '血氧', max: 100 },
                { text: '血糖', max: 10 },
                { text: '高压', max: 180 },
                { text: '低压', max: 130 },
            ],
            radius: 180,
            axisName: {
                color: '#fff',
                backgroundColor: '#666',
                borderRadius: 3,
                padding: [3, 5]
            }
        }
    ],
    series: [
        {
            type: 'radar',
            radarIndex: 0,
            data: [
                {
                    value: [80, 100, 7, 130, 85],
                    name: 'reference',
                    symbol: 'rect',
                    symbolSize: 12,
                    lineStyle: {
                        type: 'dashed'
                    },
                    label: {
                        show: false,
                    }
                },
                {
                    value: predData.value.data,
                    name: 'detected value',
                    symbol: 'rect',
                    label: {
                        show: true,
                    }
                }
            ]
        }
    ]
});

</script>

<template>
    <div class="disease-pred-container">
        <div class="pred-card border">
            <div class="top-box">
                <span class="title">心血管疾病预测概率</span>
            </div>
            <div class="middle-box">
                <div class="disease_predict_probability">
                    <p>23 %</p>
                </div>
                <div class="chart-container">
                    <v-chart class="chart" :option="diseasePredOption" autoresize />
                </div>
            </div>
            <div class="bottom-box">
                <div class="attach-container">
                    <div class="card-attach">
                        <a class="attach-avatar" href="#">
                            <span>
                            </span></a>
                        <svg class="half-circle" viewBox="0 0 106 57">
                            <path d="M102 4c0 27.1-21.9 49-49 49S4 31.1 4 4"></path>
                        </svg>
                        <div class="attach-name">
                            <div class="attach-name-prefix">家有良医</div> 呵护健康，关爱有你
                        </div>
                    </div>
                </div>
                <div class="update-data-btn">
                    <el-button @click="dialogVisible = true" style="margin-top: 3cqw; margin-right: 20px;">
                        更新数据
                    </el-button>
                </div>
            </div>
        </div>

    </div>
    <!-- 更正数据 -->
    <el-dialog v-model="dialogVisible" title="更新数据" width="50%" :before-close="handleClose">
        <div class="correction-card">
            <div>
                <div class="correction-title">
                    是否心绞痛：
                </div>
                <el-radio-group v-model="anginaPectoris" class="correction-option">
                    <el-radio label="1">是</el-radio>
                    <el-radio label="0">否</el-radio>
                </el-radio-group>
            </div>
            <div >
                <div class="correction-title">
                    胸痛类型：
                </div>
                <el-radio-group v-model="chestPain" class="correction-option">
                    <el-radio label="0">无症状</el-radio>
                    <el-radio label="1">典型心绞痛</el-radio>
                    <el-radio label="2">非典型心绞痛</el-radio>
                    <el-radio label="3">非心绞痛</el-radio>
                </el-radio-group>
            </div>
        </div>

        <template #footer>
            <span class="dialog-footer">
                <el-button @click="dialogVisible = false">取消</el-button>
                <el-button type="primary" @click="submit()" :disabled="!chestPain || !anginaPectoris">
                    提交
                </el-button>
            </span>
        </template>
    </el-dialog>
</template>



<style lang="css" scoped>
.disease-pred-container {
    height: calc(100vh - 65px - 50px);
    padding: 20px 25px 30px 25px;
}

.pred-card {
    height: 100%;
    width: 100%;
    display: grid;
    grid-template-rows: 15% 70% 15%;
    font-family: 'Inter', sans-serif;
    background-color: rgba(255, 255, 255, 0.8);
    /* border-ra */
}

/* 上面部分 */
.top-box {
    display: flex;
    align-items: center;
}

/* 标题 */
.title {
    display: block;
    font-size: 36px;
    font-weight: 700;
    margin-left: 30px;
    margin-top: 20px;
    color: #7a7a8c;
}

/* 中间部分 */
.middle-box {
    display: grid;
    grid-template-columns: 30% 70%;

}

/* 概率数字 */
.disease_predict_probability {
    font-size: 60px;
    font-weight: 700;
    cursor: pointer;
    font-family: 'Arial Black', sans-serif;
    color: #05058a;
    display: flex;
    justify-content: right;
}

/* 卫星图 */
.chart {
    /* width: 100%; */
}

/* 底部 */
.bottom-box {
    display: flex;
    justify-content: space-between;
}

/* card-attach 左下角 */
.card-attach {
    position: relative;
    display: grid;
    grid-template-columns: 75px 1fr;
    align-items: center;
    margin-left: 20px;
    /* margin-top: 100px; */
}

.attach-name {
    color: #7a7a8c;
}

.attach-name-prefix {
    color: #e52e71;
    font-weight: 600;
}

.attach-avatar span {
    display: block;
    width: 40px;
    height: 40px;
    border-radius: 50%;
    background: #f2f2f2;
    margin: 16px 10px;
}

.half-circle {
    position: absolute;
    bottom: 0;
    left: 0;
    width: 60px;
    height: 48px;
    fill: none;
    stroke: #ff8a00;
    stroke-width: 8;
    stroke-linecap: round;
}


/* 更正数据面板 */
.correction-card {
    height: 280px;
    display: grid;
    grid-template-rows: 1fr 1fr;
}

.correction-option {
    display: grid;
    margin-left: 30px;
}


.correction-title {
    font-size: 22px;
    font-weight: 700;
}
</style>