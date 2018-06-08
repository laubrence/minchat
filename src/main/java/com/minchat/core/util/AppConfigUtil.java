package com.minchat.core.util;

import java.util.Properties;

public class AppConfigUtil {

    /**
     * 从配置文件中读取配置属性
     *
     * @param propertyKey 属性key
     * @return
     */
    public static String get(String propertyKey) {

        Properties properties = (Properties) AppUtil.getBean("configproperties");
        return properties.getProperty(propertyKey);

    }


}
