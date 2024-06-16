<script setup>
import { getDoctorList, appointDoctor ,changeGrantDoctor, deleteDoctor, addDoctor} from '@/api/apiUtils.js';
import { ref,computed } from 'vue';
import { useDataStore } from '@/stores/data.js'
import dayjs from 'dayjs'
import { ElMessage } from 'element-plus';

const dataStore = useDataStore();
getDoctorList();
const availablePeopleList = [1,2,3,4,5,6,7];
const man = {
    id : 1,
    url: "@/assets/icons/logo.webp",
    name: 'zdk',
    room: 111,
    title: 'shit',
    jj: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
    isRejected: 0
};

const showModal = ref(false);
function changeGrant(data){
  getDoctorList();
  for (var i = 0; i < dataStore.doctorList.length; i++) {
  // console.log(dataStore.doctorList[i]);
    if(data == dataStore.doctorList[i].id)
    {
      // console.log(dataStore.doctorList[i].grant);
      if(dataStore.doctorList[i].authority == 0)
      {
        changeGrantDoctor(data, Number(1))
        console.log(dataStore.doctorList[i].authority)
      }
      else{
        changeGrantDoctor(data, Number(0))
        console.log(dataStore.doctorList[i].authority)
      }
    }
  }
  getDoctorList();
  // console.log(data);
}

function handleAddDoc(authority, name, office, title, introduction, image)
{
  getDoctorList();
  if(name!=''&&office!=''&&title!=''&&introduction!=''&&image!='')
  {
    addDoctor(dataStore.doctorList.length + 1, authority, name, office, title, introduction, image);
    showModal = false;
  }
  else{
    ElMessage.error('信息请填写完全！')
  }
}

function handleDelete(docId){
  deleteDoctor(Number(docId));
}
const name = ref('');
const department = ref('');
const avatarURL = ref('');
const title = ref('');
const bio = ref('');

</script>

<template>
    <div :class="{'main-page-container': !showModal,'main-page-container-modal-open': showModal}" >
        <div class="doc-header ">
          <img class="image-logo" src="@/assets/icons/system.svg">
          <router-link to="/index" class="nav-text" v-if="!showModal"> 管理端服务界面</router-link>
          <router-link to="/index" class="nav-text" v-else> 请填写新医生的信息</router-link>
          <button class="add-button" @click="showModal = true" v-if="!showModal">添加医生</button>
        </div>
        <div class="modal" v-if="showModal">
          <form class="form" >
  
            <div class="flex">
                <label>
                    <input v-model="name" class="input" type="text" placeholder="" required="">
                    <span>姓名</span>
                </label>

                <label>
                    <input v-model="department" class="input" type="text" placeholder="" required="">
                    <span>科室</span>
                </label>
            </div>  
                    
            <label>
                <input v-model="avatarURL" class="input" type="text" placeholder="" required="">
                <span>头像url</span>
            </label> 
                
            <label>
                <input v-model="title" class="input" placeholder="" type="text" required="">
                <span>职称</span>
            </label>
            <label>
                <textarea v-model="bio" class="input01" placeholder="" rows="3" required=""></textarea>
                <span>个人简介</span>
            </label>
            
            <button href="#" class="fancy" @click="handleAddDoc(0, name, department, title, bio, avatarURL)">
              <span class="top-key"></span>
              <span class="text">提交</span>
              <span class="bottom-key-1"></span>
              <span class="bottom-key-2"></span>
            </button>
          </form>
        </div>
        
      

        <div class="cards" v-else>
            <div class="card item" v-for="doctor in dataStore.doctorList" :key="doctor.id" >
                <!-- <p class="tip">Hover Me</p>
                <p class="second-text">Lorem Ipsum</p> -->
                <table class="table">
                <thead>
                    <tr>
                    <th width="10%">ID</th>
                    <th width="10%">头像</th>
                    <th width="10%">姓名</th>
                    <th width="10%">科室</th>
                    <th width="10%">职称</th>
                    <th width="30%">个人简介</th>
                    <th width="10%">预约权限</th>
                    <th width="10%">操作</th>
                    </tr>
                </thead>
                <tbody>
                    
                    <td>{{ doctor.id }}</td>
                    <td>
                        <!-- <img class="image-table" :src="man.url"> -->
                        <img class="image-table" :src="doctor.image">
                    </td>
                    <td>{{ doctor.name }}</td>
                    <td>{{ doctor.office }}</td>
                    <td>{{ doctor.title }}</td>
                    <td>{{ doctor.introduction }}</td>
                    <td>
                        <div class="checkbox-con" @click="changeGrant(doctor.id)">
                            <input id="checkbox" type="checkbox" :checked="doctor.authority" @click.prevent>
                        </div> 
                    </td>
                    <td>
                      <button class="button" @click="handleDelete(doctor.id)">删除</button>
                    </td>


                </tbody>
                </table>
            </div>
        </div>
    </div>
</template>
<style lang="css" scoped>
/* 编辑医生表单样式 */
.modal{
  justify-items: center;
    /* display: flex; */
  display: grid;
  margin-top: 10%;
}
.form {
  display: flex;
  flex-direction: column;
  gap: 10px;
  min-width: 60%;
  min-height: 100%;
  background-color: #355891;
  padding: 20px;
  border-radius: 10px;
  /* position: relative; */
}

.message {
  color: #355891;
  font-size: 14px;
}

.flex {
  display: flex;
  width: 100%;
  gap: 6px;
}

.form label {
  position: relative;
}

.form label .input {
  width: 100%;
  padding: 10px 10px 20px 10px;
  outline: 0;
  border: 1px solid #355891;
  border-radius: 5px;
}

.form label .input + span {
  position: absolute;
  left: 10px;
  top: 15px;
  color: #355891;
  font-size: 0.9em;
  cursor: text;
  transition: 0.3s ease;
}

.form label .input:placeholder-shown + span {
  top: 15px;
  font-size: 0.9em;
}

.form label .input:focus + span,.form label .input:valid + span {
  top: 30px;
  font-size: 0.7em;
  font-weight: 600;
}

.form label .input:valid + span {
  color: green;
}

.input01 {
  width: 100%;
  padding: 10px 10px 20px 10px;
  outline: 0;
  border: 1px solid #355891;
  border-radius: 5px;
}

.form label .input01 + span {
  position: absolute;
  left: 10px;
  top: 50px;
  color: #355891;
  font-size: 0.9em;
  cursor: text;
  transition: 0.3s ease;
}

.form label .input01:placeholder-shown + span {
  top: 40px;
  font-size: 0.9em;
}

.form label .input01:focus + span,.form label .input01:valid + span {
  top: 50px;
  font-size: 0.7em;
  font-weight: 600;
}

.form label .input01:valid + span {
  color: green;
}

.fancy {
  background-color: white;
  border: 2px solid #355891;
  border-radius: 0px;
  box-sizing: border-box;
  color: #355891;
  cursor: pointer;
  display: inline-block;
  font-weight: 390;
  letter-spacing: 2px;
  margin: 0;
  outline: none;
  overflow: visible;
  padding: 8px 30px;
  position: relative;
  text-align: center;
  text-decoration: none;
  text-transform: none;
  transition: all 0.3s ease-in-out;
  user-select: none;
  font-size: 13px;
}

.fancy::before {
  content: " ";
  width: 1.7rem;
  height: 2px;
  background: #355891;
  top: 50%;
  left: 1.5em;
  position: absolute;
  transform: translateY(-50%);
  transform: translateX(230%);
  transform-origin: center;
  transition: background 0.3s linear, width 0.3s linear;
}

.fancy .text {
  font-size: 1.125em;
  line-height: 1.33333em;
  padding-left: 2em;
  display: block;
  text-align: left;
  transition: all 0.3s ease-in-out;
  text-transform: lowercase;
  text-decoration: none;
  color: #355891;
  transform: translateX(30%);
}

.fancy .top-key {
  height: 2px;
  width: 1.5625rem;
  top: -2px;
  left: 0.625rem;
  position: absolute;
  background: #355891;
  transition: width 0.5s ease-out, left 0.3s ease-out;
}

.fancy .bottom-key-1 {
  height: 2px;
  width: 1.5625rem;
  right: 1.875rem;
  bottom: -2px;
  position: absolute;
  background: #355891;
  transition: width 0.5s ease-out, right 0.3s ease-out;
}

.fancy .bottom-key-2 {
  height: 2px;
  width: 0.625rem;
  right: 0.625rem;
  bottom: -2px;
  position: absolute;
  background: #355891;
  transition: width 0.5s ease-out, right 0.3s ease-out;
}

.fancy:hover {
  color: #355891;
  background: #5f82a9;
}

.fancy:hover::before {
  width: 1.5rem;
  background: #355891;
}

.fancy:hover .text {
  color: white;
  padding-left: 1.5em;
}

.fancy:hover .top-key {
  left: -2px;
  width: 0px;
}

.fancy:hover .bottom-key-1,
 .fancy:hover .bottom-key-2 {
  right: 0;
  width: 0;
}







/* 权限更改开关样式 */
.checkbox-con {
 margin: 10px;
 display: flex;
 align-items: center;
 justify-content: center;
 color: white;
}

.checkbox-con input[type="checkbox"] {
 appearance: none;
 width: 48px;
 height: 27px;
 border: 2px solid #ff0000;
 border-radius: 20px;
 background: #f1e1e1;
 position: relative;
 box-sizing: border-box;
}

.checkbox-con input[type="checkbox"]::before {
 content: "";
 width: 14px;
 height: 14px;
 background: rgba(234, 7, 7, 0.5);
 border: 2px solid #ea0707;
 border-radius: 50%;
 position: absolute;
 top: 0;
 left: 0;
 transform: translate(13%, 15%);
 transition: all 0.3s ease-in-out;
}

.checkbox-con input[type="checkbox"]::after {
 content: url("data:image/svg+xml,%3Csvg xmlns='://www.w3.org/2000/svg' width='23' height='23' viewBox='0 0 23 23' fill='none'%3E%3Cpath fill-rule='evenodd' clip-rule='evenodd' d='M6.55021 5.84315L17.1568 16.4498L16.4497 17.1569L5.84311 6.55026L6.55021 5.84315Z' fill='%23EA0707' fill-opacity='0.89'/%3E%3Cpath fill-rule='evenodd' clip-rule='evenodd' d='M17.1567 6.55021L6.55012 17.1568L5.84302 16.4497L16.4496 5.84311L17.1567 6.55021Z' fill='%23EA0707' fill-opacity='0.89'/%3E%3C/svg%3E");
 position: absolute;
 top: 0;
 left: 20px;
}

.checkbox-con input[type="checkbox"]:checked {
 border: 2px solid #02c202;
 background: #e2f1e1;
}

.checkbox-con input[type="checkbox"]:checked::before {
 background: rgba(2, 194, 2, 0.5);
 border: 2px solid #02c202;
 transform: translate(133%, 13%);
 transition: all 0.3s ease-in-out;
}

.checkbox-con input[type="checkbox"]:checked::after {
 content: url("data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='15' height='13' viewBox='0 0 15 13' fill='none'%3E%3Cpath fill-rule='evenodd' clip-rule='evenodd' d='M14.8185 0.114533C15.0314 0.290403 15.0614 0.605559 14.8855 0.818454L5.00187 12.5L0.113036 6.81663C-0.0618274 6.60291 -0.0303263 6.2879 0.183396 6.11304C0.397119 5.93817 0.71213 5.96967 0.886994 6.18339L5.00187 11L14.1145 0.181573C14.2904 -0.0313222 14.6056 -0.0613371 14.8185 0.114533Z' fill='%2302C202' fill-opacity='0.9'/%3E%3C/svg%3E");
 position: absolute;
 top: 5px;
 left: 5px;
}

.checkbox-con label {
 margin-left: 10px;
 cursor: pointer;
 user-select: none;
}



/* 头部样式 */
.doc-header {
    height: 50px;
    background-color: #235cbe;
    line-height: 50px;
    /* display: flex; */
    display: flex;
    align-items: center;
 /* justify-content: center; */

}
.nav-text {
    font-size: 20px;
    color: #fff;
    font-weight: 700;
    padding-left: 30px;
    text-decoration: none;
}


/* 删除按钮样式 */
.button {
  background: linear-gradient(140.14deg, #ec540e 15.05%, #d6361f 114.99%)
      padding-box,
    linear-gradient(142.51deg, #ff9465 8.65%, #af1905 88.82%) border-box;
  border-radius: 7px;
  border: 2px solid transparent;

  text-shadow: 1px 1px 1px #00000040;
  box-shadow: 8px 8px 20px 0px #45090059;

  padding: 10px 40px;
  line-height: 20px;
  cursor: pointer;
  transition: all 0.3s;
  color: white;
  font-size: 18px;
  font-weight: 500;
}

.button:hover {
  box-shadow: none;
  opacity: 80%;
}

/* 添加按钮样式 */
.add-button {
  padding: 1.3em 3em;
  font-size: 12px;
  text-transform: uppercase;
  letter-spacing: 2.5px;
  font-weight: 500;
  color: #000;
  background-color: #fff;
  border: none;
  border-radius: 45px;
  box-shadow: 0px 8px 15px rgba(0, 0, 0, 0.1);
  transition: all 0.3s ease 0s;
  cursor: pointer;
  outline: none;
  position:absolute;
  right: 3%;
}

.add-button:hover {
  background-color: #23c483;
  box-shadow: 0px 15px 20px rgba(46, 229, 157, 0.4);
  color: #fff;
  /* transform: translateY(-7px); */
}

.add-button:active {
  transform: translateY(-3px);
}

/* 主容器 */
.main-page-container {
    height: auto;
    width: 100%;
    background: url('@/assets/background.png');
    background-size: cover;
    padding: 0;
    display: grid;
    grid-template-rows: 80px 95%;
    /* margin: 30px; */
}

.main-page-container-modal-open{
    height: auto;
    width: 100%;
    background: url('@/assets/background.png');
    background-size: cover;
    padding: 0;
    min-height: 100%;
    /* align-items: center; */
    
    /* grid-template-rows: 100%;  */
    /* margin: 30px; */
}

/* 表格 */
.table {
  width: 100%;
  border-collapse: collapse;
}
.table th{
  justify-content: center;
  color: rgb(158,173,190);
}
.image-logo{
  margin-left: 1%;
  max-height: 100%;
  object-fit: contain;
}
.image-table{
    max-width: 100%;
    max-height: 100%;
    object-fit: contain;
}
.table td {
  padding: 8px;
  justify-content: center;
  text-align: center;
}

/* 卡片效果 */
.cards {
  display: flex;
  flex-direction: column;
  gap: 10px;
  width: 90%;
  height: 100%;
}

.cards .item {
  background-color: #ffffff;
  margin-left:5%;
  /* display: grid;
  grid-template-columns: 10% 10% 10% 10% 10% 40% 10%; */
  /* grid-template-columns: repeat(7, 1fr); */
  /* border: 2px solid black; */
}


.cards .card {
  display: flex;
  /* align-items: center; */
  /* justify-content: center; */
  /* flex-direction: column; */
  /* text-align: center;  */
  width: 100%;
  min-height: 150px;
  border: 2px solid #c3c6ce;
  border-radius: 10px;
  color: rgb(0, 0, 0);
  cursor: pointer;
  transition: 400ms;
  flex: 1;
}

.cards .card:hover {
 border-color: #008bf8;
 box-shadow: 0 4px 18px 0 rgba(0, 0, 0, 0.25);
}

.cards .card p.tip {
  font-size: 1em;
  font-weight: 700;
}

.cards .card p.second-text {
  font-size: .7em;
}

.cards .card:hover {
  transform: scale(1.1, 1.1);
}

.cards:hover > .card:not(:hover) {
  filter: blur(10px);
  transform: scale(0.9, 0.9);
}

</style>