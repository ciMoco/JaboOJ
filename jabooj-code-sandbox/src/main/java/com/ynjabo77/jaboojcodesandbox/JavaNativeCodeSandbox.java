package com.ynjabo77.jaboojcodesandbox;

import com.ynjabo77.jaboojcodesandbox.model.ExecuteCodeRequest;
import com.ynjabo77.jaboojcodesandbox.model.ExecuteCodeResponse;
import org.springframework.stereotype.Component;

/**
 * Java 原生代码沙箱实现（直接复用模版方法）
 */
@Component
public class JavaNativeCodeSandbox extends JavaCodeSandboxTemplate {
    @Override
    public ExecuteCodeResponse executeCode(ExecuteCodeRequest executeCodeRequest) {
        return super.executeCode(executeCodeRequest);
    }
}
