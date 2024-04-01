<template>
  <div id="userLoginView">
    <h2 style="margin-bottom: 16px">用户登录</h2>
    <a-form
      :model="form"
      auto-label-width
      label-align="left"
      style="margin: 0 auto; max-width: 480px"
      @submit="handleSubmit"
    >
      <a-form-item field="userAccount" label="账号">
        <a-input v-model="form.userAccount" placeholder="请输入账号" />
      </a-form-item>
      <a-form-item field="userPassword" label="密码" tooltip="不少于8位哦">
        <a-input-password
          v-model="form.userPassword"
          placeholder="请输入你的密码"
        />
      </a-form-item>
      <a-form-item>
        <a-space>
          <a-button html-type="submit" style="width: 80px" type="primary"
            >登录
          </a-button>
          <a-button html-type="" style="width: 80px" @click="doRegister"
            >去注册
          </a-button>
        </a-space>
      </a-form-item>
    </a-form>
  </div>
</template>

<script lang="ts" setup>
import { reactive } from "vue";
import { UserControllerService, UserLoginRequest } from "../../../backapi";
import message from "@arco-design/web-vue/es/message";
import { useRouter } from "vue-router";
import { useStore } from "vuex";

/**
 * 表单信息
 */
const form = reactive({
  userAccount: "",
  userPassword: "",
} as UserLoginRequest);

const router = useRouter();
const store = useStore();

/**
 * 提交表单
 */
const handleSubmit = async () => {
  if (!form.userAccount) {
    message.error("请输入账号");
    return;
  }
  if (!form.userPassword) {
    message.error("请输入密码");
    return;
  }

  const res = await UserControllerService.userLoginUsingPost(form);
  // 登录成功，跳转到主页
  if (res.code === 0) {
    message.success("登录成功！");
    await store.dispatch("user/getLoginUser");
    await router.push({
      path: "/",
      replace: true,
    });
  } else {
    message.error("登陆失败，" + res.message);
  }
};

const doRegister = () => {
  router.push({
    path: "/user/register",
  });
};
</script>
<style scoped>
input[type="password"]::-ms-reveal {
  display: none;
}

input[type="password"]::-ms-clear {
  display: none;
}
</style>
