package com.ynjabo77.jaboojcodesandbox;

import com.ynjabo77.jaboojcodesandbox.model.ExecuteCodeRequest;
import com.ynjabo77.jaboojcodesandbox.model.ExecuteCodeResponse;

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
