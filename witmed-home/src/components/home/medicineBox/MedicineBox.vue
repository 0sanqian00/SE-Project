<script setup>
import { getDrugBox, getMedicalRecord, getMedicalRecord1 } from '@/api/apiUtils.js';
import { ref } from 'vue';
import { useDataStore } from '@/stores/data.js'

// 数据仓库
const dataStore = useDataStore();
//getDrugBox();
getMedicalRecord(1)
getMedicalRecord1(1)
// 药品搜索框
const search = ref('')
function filterTableData() {
    return dataStore.drugBox.filter(
        (data) =>
            !search.value ||
            data.name.toLowerCase().includes(search.value.toLowerCase())
    );
}

function filterPeople(){
    return dataStore.medicalRecord.filter(
        (data) =>
            !search.value ||
            data.name.toLowerCase().includes(search.value.toLowerCase())
    );
}

function filterPeople1(){
    return dataStore.medicalRecord1.filter(
        (data) =>
            !search.value ||
            data.name.toLowerCase().includes(search.value.toLowerCase())
    );
}
// 按照boxId筛选药品
// const filterBoxId = {
//     filter: (value, row) => {
//         console.log(value, row)
//         return row.boxId == value;
//     }
// };
// const filterBoxIdDataGenerator = dataStore.drugBox?.map((item) => {
//     return {
//         text: `药箱${item.boxId}`,
//         value: item.boxId.toString()
//     };
// }) || [];

// boxId Tag主题选择
function tagThemeSelector(boxId) {
    let typeList = ['primary', 'success', 'warning', 'danger']
    return typeList[(boxId - 1) % typeList.length];
}



</script>

<template>
    <div class="medicine-box-container">
        <div class="header">
            <div style="display: flex; align-items: center;">
                <router-link to="/home">
                    <div class="nav-btn">
                        <img style="height: 20px; margin-right: 5px;" src="@/assets/mainPage/home.png">回到主页
                    </div>
                </router-link>
            </div>


            <div class="option-area" style="display: flex; align-items: center;">
                <div class="search-box">
                    <img src="@/assets/icons/search.svg">
                    <input v-model="search" type="text" placeholder="搜索用户" class="search-input">
                </div>
                <div class="options">
                    <div class="add-option"><img src="@/assets/icons/add.svg"></div>
                    <div class="edit-option"><img src="@/assets/icons/edit.svg"></div>
                </div>
            </div>
        </div>
        <div class="main">
            <div class="medicine-box border">
                <!-- <el-table :data="filterTableData()" stripe style="font-size: 28px; height: 100%;"
                    :row-style="{ height: '80px' }"
                    :header-cell-style="{ 'text-align': 'center', 'background-color': '#4474ff', 'color': '#fff', 'font-weight': '400' }"
                    :cell-style="{ 'text-align': 'center' }">
                    <el-table-column prop="boxId" label="用户" sortable :filters="filterBoxIdDataGenerator"
                        :filter-method="filterBoxId.filter" filter-placement="bottom-end">
                        <template #default="scope">
                            <el-tag size="large" style="font-size: 24px;" :type="tagThemeSelector(scope.row.boxId)"
                                disable-transitions>用户{{
                                    scope.row.boxId
                                }}</el-tag>
                        </template>
                    </el-table-column>

                    <el-table-column label="姓名" prop="name" />
                    <el-table-column label="年龄" prop="number" sortable />
                    <el-table-column label="病历" prop="unit" />
                </el-table> -->
                <el-table :data="filterPeople()" stripe style="font-size: 28px; height: 100%;"
                    :row-style="{ height: '80px' }"
                    :header-cell-style="{ 'text-align': 'center', 'background-color': '#4474ff', 'color': '#fff', 'font-weight': '400' }"
                    :cell-style="{ 'text-align': 'center' }">
                    <!-- <el-table-column prop="boxId" label="用户" sortable :filters="filterBoxIdDataGenerator"
                        :filter-method="filterBoxId.filter" filter-placement="bottom-end"> -->
                    <el-table-column prop="personId" label="用户">
                        <template #default="scope">
                            <el-tag size="large" style="font-size: 24px;" :type="tagThemeSelector(scope.row.boxId)"
                                disable-transitions>用户{{
                                    scope.row.personId
                                }}</el-tag>
                        </template>
                    </el-table-column>

                    <el-table-column label="姓名" prop="name" />
                    <el-table-column label="年龄" prop="age" sortable />
                    <el-table-column label="病历" prop="sympton" />
                </el-table>
            </div>
        </div>
    </div>
</template>

<style scoped>
.medicine-box-container {
    height: 100%;
    width: 100%;
}

/* header栏 */
.header {
    height: 65px;
    width: 100%;
    background-color: rgba(255, 255, 255, 0.6);
    display: grid;
    grid-template-columns: 20% 80%;
    backdrop-filter: blur(5px);
}

.nav-btn {
    text-decoration: none;
    color: #0c12c0;
    height: 45px;
    width: 130px;
    margin-left: 25px;
    font-size: 20px;
    font-weight: 700;
    background-color: #c3d1ff;
    border-radius: 5px;
    display: flex;
    align-items: center;
    justify-content: center;
}


.option-area {
    display: flex;
    justify-content: right;
}

.search-box {
    width: 300px;
    height: 45px;
    background-color: #fff;
    border-radius: 22px;
    display: flex;
    align-items: center;
    padding-left: 20px;
}

.search-box img {
    height: 20px;
    width: 20px;
}

.search-input {
    border: none;
    font-size: 18px;
}

.search-input:focus {
    outline: none;
}

.options {
    display: flex;
    margin-right: 20px;
}

.options img {
    height: 34px;
    width: 34pxpx;
}

.add-option,
.edit-option {
    margin-left: 20px;
}


/* 主体区域 */
.main {
    height: calc(100% - 65px - 40px);
    width: calc(100% - 40px);
    display: grid;
    margin: 20px;
    gap: 20px;
}

.medicine-box {
    height: 100%;
    width: 100%;
    overflow: auto;
    /* padding: 20px; */
    background-color: #fff;
}


:deep(.el-table__cell .cell) {
    line-height: 40px !important;
}
</style>