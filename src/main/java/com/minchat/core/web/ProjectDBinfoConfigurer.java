package com.minchat.core.web;

import org.springframework.beans.BeansException;
import org.springframework.beans.factory.config.ConfigurableListableBeanFactory;
import org.springframework.beans.factory.config.PropertyPlaceholderConfigurer;

import java.util.HashMap;
import java.util.Map;
import java.util.Properties;

/**
 * 自定义ProjectDBinfoConfigurer返回properties内容
 *
 * @author ZhangYQ iitshare@itblood.com
 * @ClassName: ProjectDBinfoConfigurer
 * @Description: TODO (请用一句话描述该类做什么)
 * @date: 2012-11-20 下午11:48:32
 */
public class ProjectDBinfoConfigurer extends PropertyPlaceholderConfigurer {
    private static Map<String, String> ctxPropertiesMap;

    @Override
    protected void processProperties(
            ConfigurableListableBeanFactory beanFactoryToProcess,
            Properties props) throws BeansException {
        super.processProperties(beanFactoryToProcess, props);
        ctxPropertiesMap = new HashMap<String, String>();
        for (Object key : props.keySet()) {
            String keyStr = key.toString();
            String value = props.getProperty(keyStr);
            ctxPropertiesMap.put(keyStr, value);
        }
    }

    public static Object getContextProperty(String name) {
        return ctxPropertiesMap.get(name);
    }
}