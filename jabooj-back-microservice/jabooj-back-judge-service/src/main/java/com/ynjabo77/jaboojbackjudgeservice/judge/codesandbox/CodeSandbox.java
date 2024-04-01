package com.ynjabo77.jaboojbackjudgeservice.judge.codesandbox;

import com.ynjabo77.jaboojbackmodel.codesandbox.ExecuteCodeRequest;
import com.ynjabo77.jaboojbackmodel.codesandbox.ExecuteCodeResponse;

/**
 * 代码沙箱接口定义
 */
public interface CodeSandbox {

    /**
     * 执行代码
     *
     * @param executeCodeRequest
     * @return
     */
    ExecuteCodeResponse executeCode(ExecuteCodeRequest executeCodeRequest);
}
