<template>
    <div>
        <h1>Frame page</h1>
        <el-button @click="$root.$emit('change_page', 'Login')">To login page</el-button>

        <component v-bind:is="current_page"></component>
    </div>
</template>

<script>

import Login from "../login/Login.vue"
import Users from "../users/Users.vue"

export default {
    components: {
        Login: Login,
        Users: Users,
    },
    data() {
        return {
            current_page: "Users"
        }
    },
    mounted() {
        this.$root.$on("change_page", page_name => {
            this.current_page = page_name
        })
    }
}
</script>