<script>
import mqtt from "mqtt";
import { useDataStore } from '@/stores/data.js'
import { ElMessage } from 'element-plus';


export default {
    name: 'EnterPalmMqtt',
    setup() {
        const dataStore = useDataStore();
        return {
            dataStore,
        }
    },
    data() {
        return {
            selectedMemberId: null,
            connection: {
                protocol: "ws",
                host: "116.204.122.181",
                // ws: 8083; wss: 8084
                port: 8083,
                endpoint: "/mqtt",
                // for more options, please refer to https://github.com/mqttjs/MQTT.js#mqttclientstreambuilder-options
                clean: true,
                connectTimeout: 30 * 1000, // ms
                reconnectPeriod: 4000, // ms
                clientId: "emqx_vue_" + Math.random().toString(16).substring(2, 8),
                // auth
                username: "abc",
                password: "123456",
            },
            subscription: {
                topic: "/vue/mqtt",
                qos: 2,
            },
            publish: {
                topic: "/python/mqtt",
                qos: 2
            },
            receiveNews: "", // 存储接收到的消息
            qosList: [0, 1, 2],
            client: {
                connected: false,
            },
            subscribeSuccess: false,
            connecting: false,
            retryTimes: 0,
        };
    },

    methods: {
        // 获取选择人的头像url
        getImageUrl(Id, flag) {
            if (flag === 'user') {
                const member = this.dataStore.memberInfo.find(member => member.id === Id);
                return member ? member.image : '';
            }
            else if (flag === 'doctor') {
                const doctor = this.dataStore.doctorList.find(doctor => doctor.id === Id);
                return doctor ? doctor.image : '';
            }
        },
        // 发布信息
        handleEnterPalm() {
            if (!this.selectedMemberId) {
                ElMessage('请先选择成员');
            } else {
                let payload = '{ "memberId": ' + this.selectedMemberId + ' }'
                this.doPublish(payload);
            }
        },
        initData() {
            this.client = {
                connected: false,
            };
            this.retryTimes = 0;
            this.connecting = false;
            this.subscribeSuccess = false;
        },
        handleOnReConnect() {
            this.retryTimes += 1;
            if (this.retryTimes > 5) {
                try {
                    this.client.end();
                    this.initData();
                    this.$message.error("Connection maxReconnectTimes limit, stop retry");
                } catch (error) {
                    this.$message.error(error.toString());
                }
            }
        },
        createConnection() {
            try {
                this.connecting = true;
                const { protocol, host, port, endpoint, ...options } = this.connection;
                const connectUrl = `${protocol}://${host}:${port}${endpoint}`;
                this.client = mqtt.connect(connectUrl, options);
                if (this.client.on) {
                    this.client.on("connect", () => {
                        this.connecting = false;
                        console.log("连接成功!");
                    });
                    this.client.on("reconnect", this.handleOnReConnect);
                    this.client.on("error", (error) => {
                        console.log("连接失败", error);
                    });
                    this.client.on("message", (topic, message) => {
                        this.receiveNews = message.toString();
                        console.log(`从主题 ${topic} 收到消息 ${message.toString()}`);
                    });

                }
            } catch (error) {
                this.connecting = false;
                console.log("mqtt.connect error", error);
            }
        },
        doSubscribe() {
            const { topic, qos } = this.subscription
            this.client.subscribe(topic, { qos }, (error, res) => {
                if (error) {
                    console.log('订阅主题失败', error)
                    return
                }
                this.subscribeSuccess = true
                console.log('订阅主题结果:', res)
            })
        },
        doUnSubscribe() {
            const { topic } = this.subscription
            this.client.unsubscribe(topic, error => {
                if (error) {
                    console.log('取消订阅失败', error)
                }
            })
        },
        doPublish(payload) {
            const { topic, qos } = this.publish
            this.client.publish(topic, payload, { qos }, error => {
                if (error) {
                    console.log('发布失败', error)
                } else {
                    console.log('发布信息:', payload)
                    // ElMessage("")
                }
            })
        },
        destroyConnection() {
            if (this.client.connected) {
                try {
                    this.client.end(false, () => {
                        this.initData()
                        console.log('成功连接!')
                    })
                } catch (error) {
                    console.log('连接失败', error.toString())
                }
            }
        }




    },
    mounted() {
        console.log("Mqtt连接启动中...")
        this.initData();
        this.createConnection()

        this.client.subscribe(this.subscription.topic, { qos: this.subscription.qos }, (err) => {
            if (!err) {
                this.subscribeSuccess = true;
                console.log(`已订阅主题: ${this.subscription.topic}`);
            } else {
                console.error("订阅主题失败", err);
            }
        });

    },
};
</script>


<template>
    <div class="enter-palm-container">
        <div class="enter-palm-selector">
            <div class="header-promt">
                请选择需要录入掌纹的成员：
            </div>
            <div class="selector-box">
                <div style="display: flex; align-items: center;">
                    <el-select v-model="selectedMemberId" placeholder="选择录入人员" size="large" style="width: 240px;">
                        <el-option v-for="item in dataStore.memberInfo" :key="item.id" :label="item.name"
                            :value="item.id" />
                    </el-select>
                    <div class="selected-img" style="margin-left: 10px;">
                        <img v-if="getImageUrl(selectedMemberId, 'user') !== ''" class="border"
                            :src="getImageUrl(selectedMemberId, 'user')" alt="">
                    </div>
                </div>

                <div>
                    <el-button type="primary" @click="handleEnterPalm">
                        提交
                    </el-button>
                </div>
            </div>

        </div>
        <div class="enter-palm-diplaybox border">
            展示框
        </div>
    </div>

</template>


<style lang="css" scoped>
.enter-palm-container {
    width: 100%;
    height: 100%;
    display: flex;
    flex-direction: column;
}

.header-promt{
    font-size: 22px;
    font-weight: 700;
}

.selector-box {
    display: flex;
    align-items: center;
    justify-content: space-between;
    height: 80px;

}

.enter-palm-diplaybox {
    flex: 1;

}

img {
    height: 55px;
}
</style>