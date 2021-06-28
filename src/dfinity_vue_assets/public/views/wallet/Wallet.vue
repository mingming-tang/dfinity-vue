<template>
    <div>
        <el-form>
            <el-form-item label="balance:">
                <el-input v-model="balance"></el-input>
            </el-form-item>
        </el-form>
        <el-form>
            <el-form-item label="availabel:">
                <el-input v-model="availabel"></el-input>
            </el-form-item>
        </el-form>
    </div>
</template>

<script>

import wallet_1 from "ic:canisters/wallet_1";

export default {
    components: {
    },
    data() {
        return {
            current_page: "Wallet",
            data: [],
            balance: "",
            available: ""
        }
    },
    mounted() {

        wallet_1.getBalance().then(results=>{
            this.balance = results
        })

        wallet_1.getAvailable().then(results=>{
            this.available = results
        })
    },
    methods: {
    }
}
</script>