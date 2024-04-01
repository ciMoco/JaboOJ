package com.ynjabo77.jaboojbackjudgeservice.judge.strategy;

import com.ynjabo77.jaboojbackmodel.codesandbox.JudgeInfo;
import com.ynjabo77.jaboojbackmodel.dto.question.JudgeCase;
import com.ynjabo77.jaboojbackmodel.entity.Question;
import com.ynjabo77.jaboojbackmodel.entity.QuestionSubmit;
import lombok.Data;

import java.util.List;

/**
 * 上下文（用于定义在策略中传递的参数）
 */
@Data
public class JudgeContext {
    private JudgeInfo judgeInfo;

    private List<String> inputList;

    private List<String> outputList;

    private List<JudgeCase> judgeCaseList;

    private Question question;

    private QuestionSubmit questionSubmit;
}
