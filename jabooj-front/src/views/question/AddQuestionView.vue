<template>
  <div id="addQuestionView">
    <a-form :model="form" label-align="left">
      <a-form-item field="title" label="标题">
        <a-input
          v-model="form.title"
          class="compact-input"
          placeholder="请输入标题"
        />
      </a-form-item>
      <a-form-item field="tags" label="标签">
        <a-input-tag
          v-model="form.tags"
          allow-clear
          class="compact-input"
          placeholder="请输入标签"
        />
      </a-form-item>
      <a-form-item field="content" label="题目内容">
        <MdEditor :handle-change="onContentChange" :value="form.content" />
      </a-form-item>
      <a-form-item field="answer" label="答案">
        <MdEditor :handle-change="onAnswerChange" :value="form.answer" />
      </a-form-item>
      <a-form-item :content-flex="false" :merge-props="false" label="判题配置">
        <a-space direction="vertical" style="min-width: 480px">
          <a-form-item field="judgeConfig.timeLimit" label="时间限制">
            <a-input-number
              v-model="form.judgeConfig.timeLimit"
              min="0"
              mode="button"
              placeholder="请输入时间限制"
              size="large"
            />
          </a-form-item>
          <a-form-item field="judgeConfig.memoryLimit" label="内存限制">
            <a-input-number
              v-model="form.judgeConfig.memoryLimit"
              min="0"
              mode="button"
              placeholder="请输入内存限制"
              size="large"
            />
          </a-form-item>
          <a-form-item field="judgeConfig.stackLimit" label="堆栈限制">
            <a-input-number
              v-model="form.judgeConfig.stackLimit"
              min="0"
              mode="button"
              placeholder="请输入堆栈限制"
              size="large"
            />
          </a-form-item>
        </a-space>
      </a-form-item>
      <a-form-item
        :content-flex="false"
        :merge-props="false"
        label="测试用例配置"
      >
        <a-form-item
          v-for="(judgeCaseItem, index) of form.judgeCase"
          :key="index"
          no-style
        >
          <a-space direction="vertical" style="min-width: 640px">
            <a-form-item
              :key="index"
              :field="`form.judgeCase[${index}].input`"
              :label="`输入用例-${index}`"
            >
              <a-input
                v-model="judgeCaseItem.input"
                placeholder="请输入测试输入用例"
              />
            </a-form-item>
            <a-form-item
              :key="index"
              :field="`form.judgeCase[${index}].output`"
              :label="`输出用例-${index}`"
            >
              <a-input
                v-model="judgeCaseItem.output"
                placeholder="请输入测试输出用例"
              />
            </a-form-item>
            <a-button status="danger" @click="handleDelete(index)"
              >删除
            </a-button>
          </a-space>
        </a-form-item>
        <div style="margin-top: 16px">
          <a-button status="success" type="outline" @click="handleAdd"
            >新增测试用例
          </a-button>
        </div>
      </a-form-item>
      <div style="margin-bottom: 16px" />
      <a-form-item>
        <a-button style="width: 200px" type="primary" @click="doSubmit"
          >提交
        </a-button>
      </a-form-item>
    </a-form>
  </div>
</template>

<script lang="ts" setup>
import { onMounted, ref } from "vue";
import MdEditor from "@/components/MdEditor.vue";
import { QuestionControllerService } from "../../../backapi";
import message from "@arco-design/web-vue/es/message";
import { useRoute, useRouter } from "vue-router";

const router = useRouter();
const route = useRoute();
// 如果页面地址包含 update，视为更新页面
const updatePage = route.path.includes("update");

let form = ref({
  title: "",
  tags: [],
  answer: "",
  content: "",
  judgeConfig: {
    memoryLimit: 1000,
    stackLimit: 1000,
    timeLimit: 1000,
  },
  judgeCase: [
    {
      input: "",
      output: "",
    },
  ],
});

/**
 * 根据题目id获取老的数据
 */
const loadData = async () => {
  const id = route.query.id;
  if (!id) {
    return;
  }
  const res = await QuestionControllerService.getQuestionByIdUsingGet(
    id as any
  );
  if (res.code === 0) {
    form.value = res.data as any;
    // json转js对象
    if (!form.value.judgeCase) {
      form.value.judgeCase = [
        {
          input: "",
          output: "",
        },
      ];
    } else {
      form.value.judgeCase = JSON.parse(form.value.judgeCase as any);
    }
    if (!form.value.judgeConfig) {
      form.value.judgeConfig = {
        memoryLimit: 1000,
        stackLimit: 1000,
        timeLimit: 1000,
      };
    } else {
      form.value.judgeConfig = JSON.parse(form.value.judgeConfig as any);
    }
    if (!form.value.tags) {
      form.value.tags = [];
    } else {
      form.value.tags = JSON.parse(form.value.tags as any);
    }
  } else {
    message.error("加载失败，" + res.message);
  }
};

onMounted(() => {
  loadData();
});

// 表单提交
const doSubmit = async () => {
  // console.log(form);
  // 区分更新还是创建
  if (updatePage) {
    const res = await QuestionControllerService.updateQuestionUsingPost(
      form.value
    );
    if (res.code === 0) {
      message.success("更新成功");
      router.go(-1);
    } else {
      message.error("更新失败，" + res.message);
    }
  } else {
    const res = await QuestionControllerService.addQuestionUsingPost(
      form.value
    );
    if (res.code === 0) {
      message.success("创建成功");
      Reset();
    } else {
      message.error("创建失败，" + res.message);
    }
  }
};

/**
 * 新增判题用例
 */
const handleAdd = () => {
  form.value.judgeCase.push({
    input: "",
    output: "",
  });
};

/**
 * 删除判题用例
 */
const handleDelete = (index: number) => {
  form.value.judgeCase.splice(index, 1);
};
const onContentChange = (value: string) => {
  form.value.content = value;
};
const onAnswerChange = (value: string) => {
  form.value.answer = value;
};

/**
 * 更新后刷新页面
 * @constructor
 */
const Reset = () => {
  form.value = {
    title: "",
    tags: [],
    answer: "",
    content: "",
    judgeConfig: {
      memoryLimit: 1000,
      stackLimit: 1000,
      timeLimit: 1000,
    },
    judgeCase: [
      {
        input: "",
        output: "",
      },
    ],
  };
};
</script>

<style scoped>
#addQuestionView {
  padding: 16px;
  .compact-input {
    //width: 100%;
    max-width: 640px;
  }
}
</style>
