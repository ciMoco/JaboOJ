package com.ynjabo77.jaboojbackjudgeservice.judge;

import com.ynjabo77.jaboojbackmodel.entity.QuestionSubmit;

/**
 * 判题服务
 */
public interface JudgeService {

    /**
     * 判题
     *
     * @param questionSubmitId
     * @return
     */
    QuestionSubmit doJudge(long questionSubmitId);
}
