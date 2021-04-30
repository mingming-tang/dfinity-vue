<template>
  <div>
    <el-button type="primary" @click="onAdd">Add</el-button>
    <el-table :data="data" border style="width: 100%">
      <el-table-column prop="username" label="Username" width="180">
      </el-table-column>
      <el-table-column prop="age" label="Age" width="180"> </el-table-column>
      <el-table-column prop="address" label="Address"> </el-table-column>
    </el-table>
    <l-create-user ref="createUserDialog"></l-create-user>
  </div>
</template>

<script>
import CreateUser from "./components/CreateUser.vue";
import learning_4 from "ic:canisters/dfinity_vue";

export default {
  components: {
    LCreateUser: CreateUser,
  },
  data() {
    return {
      current_page: "Login",
      data: [],
    };
  },
  mounted() {
    console.log("Users");
    this.getData();
  },
  methods: {
    getData() {
      learning_4.getUserList(1, 3).then((userList) => {
        console.log(userList);
        this.data = userList;
      });
    },
    onAdd() {
      // var vm = new CreateUser();
      // vm.$mount();
      // this.$el.appendChild(vm.$el);
      this.$refs.createUserDialog.show();
    },
  },
};
</script>