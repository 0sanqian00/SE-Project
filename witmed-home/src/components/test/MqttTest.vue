<script>
import mqtt from "mqtt";

export default {
    data() {
        return {
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
                qos: 2,
                payload: '{ "msg": "Hello, this is a message from Vue." }',
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
                        console.log("Connection succeeded!");
                    });
                    this.client.on("reconnect", this.handleOnReConnect);
                    this.client.on("error", (error) => {
                        console.log("Connection failed", error);
                    });
                    this.client.on("message", (topic, message) => {
                        this.receiveNews = message.toString();
                        console.log(`Received message ${message.toString()} from topic ${topic}`);
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
                    console.log('Subscribe to topics error', error)
                    return
                }
                this.subscribeSuccess = true
                console.log('Subscribe to topics res', res)
            })
        },
        doUnSubscribe() {
            const { topic } = this.subscription
            this.client.unsubscribe(topic, error => {
                if (error) {
                    console.log('Unsubscribe error', error)
                }
            })
        },
        doPublish() {
            const { topic, qos, payload } = this.publish
            this.client.publish(topic, payload, { qos }, error => {
                if (error) {
                    console.log('Publish error', error)
                }
            })
        },
        destroyConnection() {
            if (this.client.connected) {
                try {
                    this.client.end(false, () => {
                        this.initData()
                        console.log('Successfully disconnected!')
                    })
                } catch (error) {
                    console.log('Disconnect failed', error.toString())
                }
            }
        }




    },
    mounted() {
        this.initData();
        this.createConnection()

        this.client.subscribe(this.subscription.topic, { qos: this.subscription.qos }, (err) => {
            if (!err) {
                this.subscribeSuccess = true;
                console.log(`Subscribed to topic ${this.subscription.topic}`);
            } else {
                console.error("Failed to subscribe to topic", err);
            }
        });

        this.doPublish();

    }
};
</script>


<template>
    test
</template>


<style lang="css" scoped></style>