<template>
    <div>
        <el-button>test</el-button>
        <router-view></router-view>
        <component v-bind:is="current_page"></component>
    </div>
</template>


<script>

import Login from "./views/login/Login.vue"
import Frame from "./views/frame/Frame.vue"

export default {
    components: {
        Login: Login,
        Frame: Frame
    },
    data() {
        return {
            current_page: "Login"
        }
    },
    mounted() {
        console.log("App")
        this.$root.$on("change_page", page_name => {
            this.current_page = page_name
        })
    }
}
</script>
