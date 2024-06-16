<script setup>
import { ref, onMounted } from 'vue';
import { useRouter } from 'vue-router';

const router = useRouter();
const url = ref(router.currentRoute.value.path);

onMounted(() => {
    window.addEventListener('popstate', () => {
        url.value = window.location.pathname;
    });

    router.afterEach(() => {
        url.value = router.currentRoute.value.path;
    });
});
</script>

<template>
    <div class="header-container default-font-color">
        <div class="go-back">
            <div class="go-back-container border" v-if="url !== '/home/mainPage'" @click="$router.push('/home/mainPage')"> 
                <img class="header-icon" src="@/assets/icons/goback.svg">
                <span class="header-desc">后退</span>
            </div>
        </div>
        <div class="time"></div>
        <div class="logo">
            <img class="header-icon" src="@/assets/home_logo.png">
        </div>
        <div class="options">options</div>
    </div>
</template>



<style lang="css" scoped>
.header-container {
    height: 100%;
    width: 100%;
    display: flex;
}

.go-back {
    padding-left: 20px;
    margin: 5px;
    flex: 13%;
}

.go-back-container {
    display: flex;
    align-items: center;
    justify-content: center;
    background-color: #086ef3;
    transition: 0.2s;
}

.go-back span {
    margin-left: 20px;
}

.go-back-container:hover {
    background-color: #267ac9;
    transform: translate(1px, 1px);
}

.time {
    flex: 20%;
}
.logo {
    flex: 34%;
    display: flex;
    align-items: center;
    justify-content: center;
}

.options {
    flex: 33%;
    padding-right: 20px;
}

.header-icon {
    height: 40px;
}

.header-desc {
    font-size: 26px;
}
</style>