package com.ynjabo77.jaboojbackjudgeservice.judge.codesandbox.impl;

import com.ynjabo77.jaboojbackjudgeservice.judge.codesandbox.CodeSandbox;
import com.ynjabo77.jaboojbackmodel.codesandbox.ExecuteCodeRequest;
import com.ynjabo77.jaboojbackmodel.codesandbox.ExecuteCodeResponse;

/**
 * 第三方代码沙箱（调用网上现成的代码沙箱）
 */
public class ThirdPartyCodeSandbox implements CodeSandbox {
    @Override
    public ExecuteCodeResponse executeCode(ExecuteCodeRequest executeCodeRequest) {
        System.out.println("第三方代码沙箱");
        return null;
    }
}
