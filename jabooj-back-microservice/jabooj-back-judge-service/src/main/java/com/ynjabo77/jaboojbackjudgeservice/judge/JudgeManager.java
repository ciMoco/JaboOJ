package com.ynjabo77.jaboojbackjudgeservice.judge;

import com.ynjabo77.jaboojbackjudgeservice.judge.strategy.DefaultJudgeStrategy;
import com.ynjabo77.jaboojbackjudgeservice.judge.strategy.JavaLanguageJudgeStrategy;
import com.ynjabo77.jaboojbackjudgeservice.judge.strategy.JudgeContext;
import com.ynjabo77.jaboojbackjudgeservice.judge.strategy.JudgeStrategy;
import com.ynjabo77.jaboojbackmodel.codesandbox.JudgeInfo;
import com.ynjabo77.jaboojbackmodel.entity.QuestionSubmit;
import org.springframework.stereotype.Service;

/**
 * 判题管理（简化调用）
 */
@Service
public class JudgeManager {

    /**
     * 执行判题
     *
     * @param judgeContext
     * @return
     */
    JudgeInfo doJudge(JudgeContext judgeContext) {
        QuestionSubmit questionSubmit = judgeContext.getQuestionSubmit();
        String language = questionSubmit.getLanguage();
        JudgeStrategy judgeStrategy = new DefaultJudgeStrategy();
        if ("java".equals(language)) {
            judgeStrategy = new JavaLanguageJudgeStrategy();
        }
        return judgeStrategy.doJudge(judgeContext);
    }
}
