<template>
  <div class="noAuth">
    <a-result status="403" subtitle="权限不足">
      <template #extra>
        <a-space>
          <a-button type="primary" @click="doBack()">返回主页</a-button>
        </a-space>
      </template>
    </a-result>
  </div>
</template>

<script lang="ts" setup>
import { useRouter } from "vue-router";

const router = useRouter();
const doBack = () => {
  router.push("/");
};
</script>
