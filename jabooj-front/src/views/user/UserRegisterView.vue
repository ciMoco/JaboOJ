<template>
  <div id="userReigsterView">
    <h2 style="margin-bottom: 16px">用户注册</h2>
    <a-form
      :model="form"
      auto-label-width
      label-align="left"
      style="margin: 0 auto; max-width: 480px"
      @submit="handleSubmit"
    >
      <a-form-item field="userAccount" label="账号">
        <a-input
          v-model="form.userAccount"
          placeholder="请输入账号，不小于4位"
        />
      </a-form-item>
      <a-form-item field="userPassword" label="密码">
        <a-input-password
          v-model="form.userPassword"
          placeholder="请输入密码，不小于8位"
        />
      </a-form-item>
      <a-form-item field="checkPassword" label="确认密码">
        <a-input-password
          v-model="form.checkPassword"
          placeholder="请再次输入密码"
        />
      </a-form-item>
      <a-form-item>
        <a-space>
          <a-button style="width: 80px" @click="doBack">返回</a-button>
          <a-button html-type="submit" style="width: 80px" type="primary"
            >注册
          </a-button>
        </a-space>
      </a-form-item>
    </a-form>
  </div>
</template>

<script lang="ts" setup>
import { reactive } from "vue";
import { UserControllerService, UserRegisterRequest } from "../../../backapi";
import message from "@arco-design/web-vue/es/message";
import { useRouter } from "vue-router";

/**
 * 表单信息
 */
const form = reactive({
  userAccount: "",
  userPassword: "",
  checkPassword: "",
} as UserRegisterRequest);

const router = useRouter();

/**
 * 提交表单
 */
const handleSubmit = async () => {
  // 判断账号或者密码为空，禁止提交
  if (!form.userAccount || !form.userPassword || !form.checkPassword) {
    message.error("请正确输入");
    return;
  }
  const res = await UserControllerService.userRegisterUsingPost(form);
  // 登录成功，跳转到主页
  if (res.code === 0) {
    message.success("注册成功！");
    await router.push({
      path: "/user/login",
      replace: true,
    });
  } else {
    message.error("注册失败，" + res.message);
  }
};

// 返回之前页面
const doBack = () => {
  router.go(-1);
};
</script>

<style>
input[type="password"]::-ms-reveal {
  display: none;
}

input[type="password"]::-ms-clear {
  display: none;
}
</style>
