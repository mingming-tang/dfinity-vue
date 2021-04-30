<template>
  <el-dialog title="Tips" :visible.sync="isVisible">
    <el-form>
      <el-form-item label="Userame:">
        <el-input v-model="formData.username"></el-input>
      </el-form-item>
      <el-form-item label="Age:">
        <el-input-number v-model="formData.age"></el-input-number>
      </el-form-item>
      <el-form-item>
        <el-button @click="onSubmit" type="primary" :loading="submitLoading">Submit</el-button>
      </el-form-item>
    </el-form>
  </el-dialog>
</template>

<script>
import backend from "ic:canisters/dfinity_vue";

export default {
  data() {
    return {
      isVisible: false,
      submitLoading: false,
      formData: {},
    };
  },
  methods: {
    onSubmit() {
      this.submitLoading = true;
      backend
        .addUser(this.formData)
        .then((user) => {
          this.submitLoading = false;
        })
        .catch((error) => {
          console.log("errre:", error);
        });
    },
    show(){
        this.isVisible = true
    },
    close(){
        this.isVisible = false;
    }
  },
};
</script>