<!--<template>-->
<!--  <a-card :style="{ width: '30%' }" hoverable title="用户基本信息">-->
<!--    <a-descriptions-->
<!--      :data="data"-->
<!--      bordered-->
<!--      column="1"-->
<!--      size="large"-->
<!--      style="margin-top: 20px"-->
<!--    />-->
<!--    <template #extra>-->
<!--      <a-link @click="openEditDrawer">修改用户信息</a-link>-->
<!--    </template>-->
<!--  </a-card>-->
<!--  <a-drawer-->
<!--    :visible="visible"-->
<!--    placement="right"-->
<!--    unmountOnClose-->
<!--    width="30%"-->
<!--    @cancel="closeEditDrawer"-->
<!--    @ok="handleOk"-->
<!--  >-->
<!--    <div style="text-align: center; margin-bottom: 20px">-->
<!--      <a-upload-->
<!--        :custom-request="uploadAvatar"-->
<!--        :fileList="file ? [file] : []"-->
<!--        :show-file-list="false"-->
<!--        action="/"-->
<!--        @change="onChange"-->
<!--      >-->
<!--        <template #upload-button>-->
<!--          <div-->
<!--            :class="`arco-upload-list-item${-->
<!--              file && file.status === 'error'-->
<!--                ? ' arco-upload-list-item-error'-->
<!--                : ''-->
<!--            }`"-->
<!--          >-->
<!--            <div-->
<!--              v-if="updateForm.userAvatar"-->
<!--              class="arco-upload-list-picture custom-upload-avatar"-->
<!--            >-->
<!--              <a-avatar :size="70" shape="circle">-->
<!--                <img :src="userAvatarImg" alt="头像" />-->
<!--              </a-avatar>-->
<!--              <div class="arco-upload-list-picture-mask">-->
<!--                <IconEdit />-->
<!--              </div>-->
<!--              <a-progress-->
<!--                v-if="file && file.status === 'uploading' && file.percent < 100"-->
<!--                :percent="file.percent"-->
<!--                :style="{-->
<!--                  position: 'absolute',-->
<!--                  left: '50%',-->
<!--                  top: '50%',-->
<!--                  transform: 'translateX(-50%) translateY(-50%)',-->
<!--                }"-->
<!--                size="mini"-->
<!--                type="circle"-->
<!--              />-->
<!--            </div>-->
<!--            <div v-else class="arco-upload-picture-card">-->
<!--              <div class="arco-upload-picture-card-text">-->
<!--                <IconPlus />-->
<!--                <div style="margin-top: 10px; font-weight: 600">上传头像</div>-->
<!--              </div>-->
<!--            </div>-->
<!--          </div>-->
<!--        </template>-->
<!--      </a-upload>-->
<!--    </div>-->
<!--    <a-form-->
<!--      :model="loginUser"-->
<!--      auto-label-width-->
<!--      label-align="left"-->
<!--      style="max-width: 480px; margin: 0 auto"-->
<!--    >-->
<!--      <a-form-item field="用户名称" label="用户名称 :">-->
<!--        <a-input v-model="updateForm.userName" placeholder="请输入用户名称" />-->
<!--      </a-form-item>-->
<!--      <a-form-item field="userProfile" label="简介 :">-->
<!--        <a-textarea v-model="updateForm.userProfile" placeholder="请输入简介" />-->
<!--      </a-form-item>-->
<!--    </a-form>-->
<!--  </a-drawer>-->
<!--</template>-->
<!--<script lang="ts" setup>-->
<!--import { useStore } from "vuex";-->
<!--import { computed, ref } from "vue";-->
<!--import {-->
<!--  DescData,-->
<!--  FileItem,-->
<!--  Message,-->
<!--  RequestOption,-->
<!--} from "@arco-design/web-vue";-->
<!--import {-->
<!--  LoginUserVO,-->
<!--  UserControllerService,-->
<!--  UserUpdateMyRequest,-->
<!--} from "../../../backapi";-->

<!--const store = useStore();-->
<!--const loginUser: LoginUserVO = computed(-->
<!--  () => store.state.user?.loginUser-->
<!--) as LoginUserVO;-->
<!--const data = [-->
<!--  {-->
<!--    label: "用户名称",-->
<!--    value: store.state.user?.loginUser.userName,-->
<!--  },-->
<!--  {-->
<!--    label: "用户角色",-->
<!--    value: store.state.user?.loginUser.userRoleName,-->
<!--  },-->
<!--  {-->
<!--    label: "用户简介",-->
<!--    value:-->
<!--      store.state.user?.loginUser.userProfile &&-->
<!--      store.state.user?.loginUser.userProfile !== ""-->
<!--        ? store.state.user?.loginUser.userProfile-->
<!--        : "暂无简介",-->
<!--  },-->
<!--  {-->
<!--    label: "创建时间",-->
<!--    value: store.state.user?.loginUser.createTime,-->
<!--  },-->
<!--  {-->
<!--    label: "上次修改时间",-->
<!--    value: store.state.user?.loginUser.updateTime,-->
<!--  },-->
<!--] as DescData[];-->
<!--const visible = ref(false);-->
<!--const updateForm = ref<UserUpdateMyRequest>({-->
<!--  ...store.state.user?.loginUser,-->
<!--});-->
<!--let userAvatarImg = updateForm.value.userAvatar;-->
<!--const openEditDrawer = () => {-->
<!--  visible.value = true;-->
<!--};-->
<!--const handleOk = async () => {-->
<!--  const res = await UserControllerService.updateMyUserUsingPost(-->
<!--    updateForm.value-->
<!--  );-->
<!--  if (res.code === 0) {-->
<!--    Message.success("更新成功！");-->
<!--    visible.value = false;-->
<!--    location.reload();-->
<!--  } else {-->
<!--    Message.error(res.msg);-->
<!--  }-->
<!--};-->
<!--const closeEditDrawer = () => {-->
<!--  visible.value = false;-->
<!--};-->

<!--const uploadAvatar = async (options: RequestOption) => {-->
<!--  const { onProgress } = options;-->
<!--  onProgress(0);-->
<!--  const res = await FileService.uploadUsingPost(file.value.file);-->
<!--  onProgress(80);-->
<!--  if (res.code === 0) {-->
<!--    updateForm.value.userAvatar = res.data;-->
<!--    const imgUrlRes = await FileService.getTempAccessUsingPost(res.data);-->
<!--    userAvatarImg = imgUrlRes.data;-->
<!--    onProgress(100);-->
<!--    Message.success("上传头像成功！");-->
<!--  } else {-->
<!--    Message.error(res.msg);-->
<!--  }-->
<!--};-->

<!--const file = ref();-->

<!--const onChange = async (_: never, currentFile: FileItem) => {-->
<!--  file.value = {-->
<!--    ...currentFile,-->
<!--  };-->
<!--};-->
<!--</script>-->
