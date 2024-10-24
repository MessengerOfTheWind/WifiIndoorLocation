package com.ruoyi.web.controller.tool.Encoder;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.ruoyi.common.core.page.TableDataInfo;

import javax.websocket.EncodeException;
import javax.websocket.Encoder;
import javax.websocket.EndpointConfig;

public class TableDataInfoEncoder implements Encoder.Text<TableDataInfo> {

    private static ObjectMapper objectMapper = new ObjectMapper();

    @Override
    public String encode(TableDataInfo tableDataInfo) throws EncodeException {
        try {
            return objectMapper.writeValueAsString(tableDataInfo);
        } catch (JsonProcessingException e) {
            throw new EncodeException(tableDataInfo, "Unable to encode TableDataInfo to JSON", e);
        }
    }

    @Override
    public void init(EndpointConfig config) {
        // 初始化编码器
    }

    @Override
    public void destroy() {
        // 资源清理
    }
}
